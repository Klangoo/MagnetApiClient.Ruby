#
# File: MagnetAPIClient.rb
#
# Copyright @2018 Klangoo Inc.
#
require 'openssl'
require 'base64'
require 'open-uri'
require 'ERB'
require 'net/http'
require 'cgi'


class MagnetAPIClient

  def initialize(endpointURI , calk, secretKey = nil)
    @endpointURI = endpointURI
    @calk = calk
    @secretKey  = secretKey
  end

  def callwebmethod(method_name, request, request_method)
    _request = request
    if has_calk(_request) == false
      _request['calk'] = @calk
    end
    _signed_querystring = get_signed_querystring(method_name, _request, request_method)

    if request_method.downcase == 'post'
      uri = URI(""<<@endpointURI<<"/"<<method_name)
      params = CGI::parse(_signed_querystring)

      req = Net::HTTP::Post.new(uri)

      req.set_form_data( params)

      res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(req)
        end
        case res
        when Net::HTTPSuccess, Net::HTTPRedirection
          return   res.body
        else
            res.value
        end
    else
         res = open(""<<@endpointURI<<"/"<<method_name<<"?"<<_signed_querystring).read
         
        return  res
    end
  end

  def get_signed_querystring(method_name, request, request_method)
    _request = request
    _request["timestamp"] = get_time_stamp()
    _sortedRequest = ksort(_request)
    _canonicalized_query = ""

    if  ( _sortedRequest.length > 0)
      for k in _sortedRequest
          _canonicalized_query << encode_rfc3986(k[0])
          _canonicalized_query << "="
          _canonicalized_query << encode_rfc3986(k[1])
          _canonicalized_query << "&"
      end
      _canonicalized_query = _canonicalized_query[0..-2]
    end
    _string_to_sign = ""
    _string_to_sign<<request_method.downcase<<"\n"<<@endpointURI.downcase<<"\n"<<method_name.downcase<<"\n"<<_canonicalized_query;
    #puts _string_to_sign
    _signed_query_string = _canonicalized_query

    if !@secretKey.nil?
      _signature = Base64.encode64(OpenSSL::HMAC.digest('sha256', @secretKey, _string_to_sign)).gsub(/\n/, "")
      _signature = encode_rfc3986(_signature)
      _signed_query_string += '&signature=' + _signature
    end
    #puts _signed_query_string
    return _signed_query_string
  end

  def ksort(d)
    d = Hash[d.sort]
    return d
  end

  def get_time_stamp()
    return Time.now.strftime("%Y-%m-%dT%H:%M:%SZ")
  end

  def has_calk(request)
    request.each do |key, value|
      if key.downcase == 'calk'
        return true
      end
    end
    return false
  end

  def encode_rfc3986(s)

    s = ERB::Util.url_encode(s).gsub("%7E", "~")
    return s
  end
end
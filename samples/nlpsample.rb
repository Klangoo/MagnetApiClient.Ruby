require 'magnetapiclient'

ENDPOINT = 'https://nlp.klangoo.com/Service.svc'
CALK = 'enter your calk here'
SECRET_KEY = 'enter your secret key here'

$client = MagnetAPIClient.new(ENDPOINT, CALK, SECRET_KEY)

def processDocument()
    request = Hash[]
    request["text"] = "Real Madrid transfer news"
    request["lang"] = "en"
    request["format"] = "json"
    json = $client.callwebmethod('ProcessDocument', request, 'POST')
    puts json
end

def getEntities()
    request = Hash[]
    request["text"] = "Real Madrid transfer news"
    request["lang"] = "en"
    request["format"] = "json"
    json = $client.callwebmethod('GetEntities', request, 'POST')
    puts json
end

def getSummary()
    request = Hash[]
    request["text"] = "Real Madrid transfer news"
    request["lang"] = "en"
    request["format"] = "json"
    json = $client.callwebmethod('GetSummary', request, 'POST')
    puts json
end

def getCategories()
    request = Hash[]
    request["text"] = "Real Madrid transfer news"
    request["lang"] = "en"
    request["format"] = "json"
    json = $client.callwebmethod('GetCategories', request, 'POST')
    puts json
end

def getKeyTopics()
    request = Hash[]
    request["text"] = "Real Madrid transfer news"
    request["lang"] = "en"
    request["format"] = "json"
    json = $client.callwebmethod('GetKeyTopics', request, 'POST')
    puts json
end

puts "\nProcess Document:"
processDocument()

puts "\nGet Entities:"
getEntities()

puts "\nGet Summary:"
getSummary()

puts "\nGet Categories:"
getCategories()

puts "\nGet Key Topics:"
getKeyTopics()


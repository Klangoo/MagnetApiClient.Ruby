**This library allows you to easily use the Magnet API via Ruby.**

# Table of Contents

* [About](#about)
* [Installation](#installation)
* [Usage](#usage)

<a name="about"></a>
# About

Klangoo NLP API is a natural language processing (NLP) service that uses the rule-based paradigm and machine learning to recognize the aboutness of text. The service recognizes the category of the text, extracts key disambiguated topics, places, people, brands, events, and 41 other types of names; analyzes text using tokenization, parts of speech, parsing, word sense disambiguation, named entity recognition; and automatically finds the relatedness score between documents.

[Read More](https://klangoosupport.zendesk.com/hc/en-us/categories/360000812171-Klangoo-Natural-Language-API).

[Signup for a free trail](https://connect.klangoo.com/pub/Signup/)

<a name="installation"></a>
# Installation

## Prerequisites

- An API Key Provided by [Klangoo](https://klangoosupport.zendesk.com/hc/en-us/articles/360015236872-Step-2-Registering-to-Klangoo-NLP-API)
- An API Secret Provided by [Klangoo](https://klangoosupport.zendesk.com/hc/en-us/articles/360015236872-Step-2-Registering-to-Klangoo-NLP-API)


## Install

### Install using gem:

```bash
gem install magnetapiclient
```

### Install  manually:
Download and add to your project the file [magnetapiclient.rb](https://github.com/Klangoo/MagnetApiClient.Ruby/blob/master/lib/magnetapiclient.rb)


<a name="usage"></a>
# Usage

This quick start tutorial will show you how to process a text.

## Initialize the client

To begin, you will need to initialize the client. In order to do this you will need your API Key **CALK** and **Secret Key**.
You can find both on [your Klangoo account](https://connect.klangoo.com/).

```ruby
require 'magnetapiclient' # installed using gem
#load 'magnetapiclient.rb' # installed manually


ENDPOINT ='https://nlp.klangoo.com/Service.svc'
CALK ='enter your calk here'
SECRET_KEY ='enter your secret key here'

$client = MagnetAPIClient.new(ENDPOINT, CALK, SECRET_KEY)

request = Hash[]
    request["text"] = "Real Madrid transfer news"
    request["lang"] = "en"
    request["format"] = "json"
    json = $client.callwebmethod('ProcessDocument', request, 'POST')
```
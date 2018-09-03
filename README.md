# Magnet API Client for Ruby

# Getting Started

## Install

### Install using gem:

```bash
gem install magnetapiclient
```

### Install  manually:
Download and add to your project the file [MagnetAPIClient.py](https://github.com/Klangoo/MagnetApiClient.Ruby/blob/master/lib/magnetapiclient.rb)

## Quick Start

This quick start tutorial will show you how to process a text

### Initialize the client

To begin, you will need to initialize the client. In order to do this you will need your API Key **CALK** and **Secret Key**.
You can find both on [your Klangoo account](https://connect.klangoo.com/).

```python
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
#CassieQ Client
[![Build Status](https://travis-ci.org/tronroy/cassieq-client.svg?branch=master)](https://travis-ci.org/tronroy/cassieq-client)

A Ruby API wrapper for [CassieQ](https://github.com/paradoxical-io/cassieq)

##Installation
Install from RubyGems:
```
gem install cassieq-client
```

Require statement:
```
require "cassieq/client"
```

##Usage

###Create a client
With key based authentication:
```
client = Cassieq::Client.new do |config| 
  config.host = "192.168.99.100"
  config.account = "account_name"
  config.key = "7dCFl6xxco1NIQSxSpseW5olftHHxHlc6Q12DY5VkBkCCs8_q3JrvYgPZapUSJ6PcaQDElunMsEFwDuOi6tQFQ"
end
```
With query string authentication claims:
```
client = Cassieq::Client.new do |config|
  config.host = "192.168.99.100"
  config.account = "account_name"
  config.auth = "puag"
  config.sig = "NygRs9GBh9n_i2s7KTMof0us-RXm5nt3RnlWKb3N15A"
end
```
Read more about CassieQ's [authentication](https://github.com/paradoxical-io/cassieq/wiki/Authentication).

###Create a queue
```
client.create_queue(queue_name: "my_queue", bucket_size: 15, max_delivery_count: 10)
# => true
```
See CassieQ's API [documentation](https://github.com/paradoxical-io/cassieq/wiki/api) for all queue creation options.

###Add message to queue
```
client.create_message("my_queue", "message content")
# => true
```

###Get message from a queue
```
client.next_message("my_queue")
# => {:pop_receipt=>"MToyOkEyMnBLZw", :message=>"message content", :delivery_count=>0, :message_tag=>"A22pKg"}
```

###Ack message
```
pop_receipt = "MToyOkEyMnBLZw"
client.delete_message("my_queue", pop_receipt)
# => true
```
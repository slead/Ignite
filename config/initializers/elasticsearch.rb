ENV["ELASTICSEARCH_URL"] = "search-ignitetalks-jgbu2tzolcti7hbpxtd6muifm4.us-west-2.es.amazonaws.com"

Searchkick.client = Elasticsearch::Client.new(hosts: ["localhost:9200"], retry_on_failure: true, transport_options: {request: {timeout: 250}})
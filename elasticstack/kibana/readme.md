$ elasticsearch-service-tokens create elastic/kibana kibana-token
SERVICE_TOKEN elastic/kibana/kibana-token = AAEAAWVsYXN0aWMva2liYW5hL2tpYmFuYS10b2tlbjpDRnNrZFh5NVNKS3UyeUJMWWNqY093
$ elasticsearch-reset-password -u elastic
$ elasticsearch-reset-password -u kibana_system



## Token
~# curl -u elastic:kfMk6ZJZ58Ek3=KVKxRq  "http://10.244.39.204:9200/_sec-H "Content-Type: application/json" -d'ation/json" -d'
{
  "name": "kibana-access",
  "expiration": "1d", 
  "role_descriptors": {
    "kibana_read": {
      "cluster": ["monitor"],
      "index": [
        {
          "names": ["*"],
          "privileges": ["read"]
        }
      ]
    }
  }
}'
{"id":"0K_6DJsB2gcmyj8seWOt","name":"kibana-access","expiration":1765535700403,"api_key":"mgyREfVkpxWpgussC7sPLA","encoded":"MEtfNkRKc0IyZ2NteWo4c2VXT3Q6bWd5UkVmVmtweFdwZ3Vzc0M3c1BMQQ=="}

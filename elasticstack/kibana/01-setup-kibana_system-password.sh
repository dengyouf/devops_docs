~# curl -X POST "http://10.244.39.234:9200/_security/user/kibana_system/_password" \
  -u elastic:elastic@123 \
  -H "Content-Type: application/json" \
  -d '{"password": "kibana@123"}'

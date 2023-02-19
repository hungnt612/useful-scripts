#!/bin/bash
domains=($(cat domain_list.txt))
ip=$(curl -s https://api.ipify.org)

for domain in "${domains[@]}"
do
    zone_id="" # replace with your own zone id
    api_key="" # replace with your own api key
    email="" # replace with your own email
    record_name=$domain

    record_id=$(curl -X GET "https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records?type=A&name=$domain" \
                -H "Authorization: Bearer $api_key" \
                -H "Content-Type: application/json" | jq -r '.result[0].id')

    # Update DNS record
    curl -X PUT "https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records/$record_id" \
        -H "X-Auth-Email: $email" \
        -H "Authorization: Bearer $api_key" \
        -H "Content-Type: application/json" \
        --data "{\"type\":\"A\",\"name\":\"$record_name\",\"content\":\"$ip\",\"ttl\":1,\"proxied\":true}"
done

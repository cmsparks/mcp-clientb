#!/bin/bash

# Fetch the workers.dev subdomain from Cloudflare API
response=$(curl -s "https://api.cloudflare.com/client/v4/accounts/805b839e5ee74f0dbb336d59fcef3f8b/workers/subdomain" \
  -H "Authorization: Bearer $CLOUDFLARE_API_TOKEN")

# Extract the subdomain using jq
subdomain=$(echo "$response" | jq -r '.result.subdomain')

# Construct and output ONLY the full URL (no other text)
echo "https://$WRANGLER_CI_OVERRIDE_NAME.$subdomain.workers.dev"
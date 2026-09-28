#!/bin/sh

set -e

export $(grep -v '^#' /opt/issue-acme/cf/conf-issue-acme | xargs)
export PATH="/opt/acme.sh:$PATH"

WEBSERVER="${WEBSERVER}"
DOMAIN="${DOMAIN}"
EMAIL="${CF_EMAIL}"

export CF_Token="${CF_TOKEN}"
export CF_Account_ID="${CF_ACN_ID}"

# Issue cert DNS challenge (Cloudflare)
acme.sh --register-account -m "$EMAIL" --server letsencrypt

# acme.sh --issue --dns --server letsencrypt -d "$DOMAIN" --debug
acme.sh --issue --dns --server letsencrypt -d "$DOMAIN" --force

# Install cert to mounted volume
acme.sh --install-cert -d "$DOMAIN" \
  --key-file       /etc/$WEBSERVER/ssl/$DOMAIN.key \
  --fullchain-file /etc/$WEBSERVER/ssl/$DOMAIN-fullchain.crt \
  --reloadcmd "systemctl reload $WEBSERVER"
  # --debug

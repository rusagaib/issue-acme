#!/bin/sh

set -e

export $(grep -v '^#' /opt/issue-acme/cpanel/conf-issue-acme | xargs)
export PATH="/opt/acme.sh:$PATH"

WEBSERVER="${WEBSERVER}"
DOMAIN="${DOMAIN}"

export cPanel_Username="${CP_USERNAME}"
export cPanel_Apitoken="${CP_APITOKEN}"
export cPanel_Hostname="${CP_HOSTNAME}"

# Issue cert DNS challenge (dns_cpanel)
# acme.sh --issue --dns dns_cpanel --server letsencrypt -d "$DOMAIN" --debug
acme.sh --issue --dns dns_cpanel --server letsencrypt -d "$DOMAIN" --force

# Install cert to mounted volume
acme.sh --install-cert -d "$DOMAIN" \
  --key-file       /etc/$WEBSERVER/ssl/$DOMAIN.key \
  --fullchain-file /etc/$WEBSERVER/ssl/$DOMAIN-fullchain.crt \
  --reloadcmd "systemctl reload $WEBSERVER"
  # --debug

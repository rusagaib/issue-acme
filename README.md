## Quickstart:

### 1. git clone acme.sh from official github:

```sh
cd /opt
git clone https://github.com/acmesh-official/acme.sh.git
```

### 2. on root user Add alias for acme.sh on bashrc:

```sh
echo 'export PATH="/opt/acme.sh:$PATH"' >> /root/.bashrc
source ~/.bashrc
acme.sh -v
```

### 3. git clone or download and copy this repo on /opt/

### 4. choose cf or cpanel for dns query method:

```sh
# if using cf

chmod +x /opt/issue-acme/cf/issue-acme.sh

# if using cpanel

chmod +x /opt/issue-acme/cpanel/issue-acme.sh
```

### 5. add config settings on conf-issue-acme in given key-val and specify webserver used ( `nginx` or `apache2` on `--reloadcmd` section )

### 6. run script:

```sh
./issue-acme.sh
```

### 7. check ssl info:

```sh
acme.sh --info -d {domain_name.com} 
```

### 8. enable cronjob to auto-regenerate ssl:

```sh
acme.sh --install-cronjob
```

### 9. check if cronjob already listed:

```sh
crontab -l
```

### Sauce:

- [acme.sh - dnsapi docs](https://github.com/acmesh-official/acme.sh/wiki/dnsapi2) 

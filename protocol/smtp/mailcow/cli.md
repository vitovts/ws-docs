# --- Mailcow

## --- URL
https://mailcow.github.io/

## --- Docker

## --- Configure 

```
$ su
# umask
0022 # <- Verify it is 0022
# cd /opt
# git clone https://github.com/mailcow/mailcow-dockerized
# cd mailcow-dockerized
```

```
./generate_config.sh
>>
ress enter to confirm the detected value '[value]' where applicable or enter a custom value.
Mail server hostname (FQDN) - this is not your mail domain, but your mail servers hostname: mx1.domain.com
Timezone [Etc/UTC]: Europe/RdG
Installed memory is <= 2.5 GiB. It is recommended to disable ClamAV to prevent out-of-memory situations.
ClamAV can be re-enabled by setting SKIP_CLAMD=n in mailcow.conf.
Do you want to disable ClamAV now? [Y/n] n
Disabling Solr on low-memory system.
Generating snake-oil certificate...
Generating a RSA private key
........................................................................++++
...............................++++
writing new private key to 'data/assets/ssl-example/key.pem'
-----
Copying snake-oil certificate...
```

```
vim  /opt/mailcow-dockerized/mailcow.conf

If you plan to use a reverse proxy, you can, for example, bind HTTPS to 127.0.0.1 on port 8443 and HTTP to 127.0.0.1 on port 8080.
```


```
docker-compose pull
docker-compose up -d
```


## --- SSL
/opt/mailcow-dockerized/
MAILCOW_PATH/data/assets/ssl/




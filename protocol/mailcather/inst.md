# --- Install MailCather

## --- URL
https://mailtrap.io/blog/mailcatcher-guide/

## ---
  Ubuntu 20.04 / 18.04 / 16.04
  Mac OS X 10.14
  Windows

## --- Install Ruby

## --- Install
gem install mailcatcher
<or use Bundler>
gem install bundler

## --- start
mailcatcher --ip 0.0.0.0
<or just>
mailcatcher

Starting MailCatcher
==> smtp://0.0.0.0:1025
==> http://0.0.0.0:1080
*** MailCatcher runs as a daemon by default. Go to the web interface to quit.

## --- Help
mailcatcher --help
Usage: mailcatcher [options]
       --ip IP                      Set the ip address of both servers
       --smtp-ip IP                 Set the ip address of the smtp server
       --smtp-port PORT             Set the port of the smtp server
       --http-ip IP                 Set the ip address of the http server
       --http-port PORT             Set the port address of the http server
       --http-path PATH             Add a prefix to all HTTP paths
       --no-quit                    Don't allow quitting the process
       --[no-]growl
   -f, --foreground                 Run in the foreground
   -b, --browse                     Open web browser
   -v, --verbose                    Be more verbose
   -h, --help                       Display this help information


## launch Mailcatcher in a foreground so others can connect to your local SMTP
mailcatcher --foreground --ip=0.0.0.0


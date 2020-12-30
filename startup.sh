#!/usr/bin/env bash

main(){
  systemctl stop firewalld
  ssserver -m aes-256-cfb -p 12345 -k abcedf --manager-address 127.0.0.1:4000 --user nobody -d start
  pm2 --name "ss" -f start ssmgr -x -- -c ~/.ssmgr/ss.yml
  pm2 --name "webgui" -f start ssmgr -x -- -c ~/.ssmgr/webgui.yml
}

# start run script
main

#!/usr/bin/env bash

dd if=/dev/zero of=/swapfile bs=1024 count=1048576
/sbin/mkswap /swapfile
/sbin/swapon /swapfile
echo '/swapfile swap swap defaults 0 0' >> /etc/fstab

apt-get update
apt-get install -y python-software-properties build-essential m4
add-apt-repository ppa:avsm/ppa
apt-get update
apt-get install -y ocaml ocaml-native-compilers camlp4 camlp4-extra opam git libssl-dev emacs vim nginx aspcud
sed -i -e 's,/usr/share/nginx/html,/home/vagrant/.opam/doc/doc,g' /etc/nginx/sites-available/default

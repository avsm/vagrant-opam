#!/usr/bin/env bash
set -e
export OPAMVERBOSE=1
export OPAMYES=1
opam init
opam pin opam-doc git://github.com/avsm/opam-doc
eval `opam config env`
echo '. /home/vagrant/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true' > ~/.bashrc
opam install opam-doc merlin utop cohttp
opam doc -n ssl
opam doc-serve &

#!/usr/bin/env bash
set -e
export PACKAGES="async core core_extended"
export OPAMYES=1
export OPAMJOBS=2
opam init
opam pin opam-doc git://github.com/avsm/opam-doc
eval `opam config env`
echo '. /home/vagrant/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true' > ~/.bashrc
chmod a+x ~/.bashrc
opam install opam-doc merlin utop cohttp
# TODO add an ocamlinit
opam install ${PACKAGES}
opam doc -n ${PACKAGES}
sudo service nginx start

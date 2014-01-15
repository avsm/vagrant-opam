#!/usr/bin/env bash
set -e
PACKAGES="ssl core_extended async js_of_ocaml core_bench cohttp cryptokit menhir"

# TODO: release opam-doc.0.3 to not need this
opam pin opam-doc git://github.com/ocamllabs/opam-doc

export OPAMYES=1
export OPAMJOBS=2
opam install opam-doc merlin utop cohttp js_of_ocaml oasis
opam install ${PACKAGES}

# Generate OPAM doc in ~/.opam/doc/doc
eval `opam config env`
opam doc -n ${PACKAGES}

# Add extra clauses to .ocamlinit for new packages
cat >> ~/.ocamlinit <<EOF
#require "core.top";;
#require "core.syntax";;
EOF

# Start web server for docs
sudo service nginx start

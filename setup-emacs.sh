#!/usr/bin/env bash
set -ex

opam install ocp-index ocp-indent
git clone https://github.com/samoht/ocaml-emacs-settings.git
ln -s ocaml-emacs-settings/.emacs
ln -s ocaml-emacs-settings/.emacs.d/
~/.emacs.d/emacs-pkg-install.sh tuareg auto-complete

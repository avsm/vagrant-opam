#!/usr/bin/env bash
set -ex

mkdir -p ~/.vim/autoload ~/.vim/bundle;
curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
cd ~/.vim/bundle
git clone git://github.com/tpope/vim-sensible.git
git clone https://github.com/scrooloose/syntastic.git

cat > ~/.vimrc <<EOF
colo desert
syn on
execute pathogen#infect()
let s:ocamlmerlin=substitute(system('opam config var share'),'\n$','','''') .  "/ocamlmerlin"
let g:syntastic_ocaml_checkers = ['merlin']
execute "set rtp+=".s:ocamlmerlin."/vim"
execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
EOF

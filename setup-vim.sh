#!/usr/bin/env bash
set -ex

mkdir -p ~/.vim/autoload ~/.vim/bundle;
curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
cd ~/.vim/bundle
git clone git://github.com/tpope/vim-sensible.git
git clone git://github.com/scrooloose/syntastic.git
git clone git://github.com/def-lkb/ocp-indent-vim

opam install -y ocp-indent

cat > ~/.vimrc <<EOF
colo desert
syn on
execute pathogen#infect()

let s:ocamlmerlin=substitute(system('opam config var share'),'\n$','','''') .  "/ocamlmerlin"
let g:syntastic_ocaml_checkers = ['merlin']
execute "set rtp+=".s:ocamlmerlin."/vim"
execute "set rtp+=".s:ocamlmerlin."/vimbufsync"

au BufEnter *.ml setf ocaml
au BufEnter *.mli setf ocaml
au FileType ocaml call FT_ocaml()
function FT_ocaml()
    set textwidth=80
    set colorcolumn=80
    set shiftwidth=2
    set tabstop=2
    " ocp-indent with ocp-indent-vim
    let opamprefix=system("opam config var prefix | tr -d '\n'")
    execute "autocmd FileType ocaml source ".opamprefix."/share/typerex/ocp-indent/ocp-indent.vim"
    filetype indent on
endfunction
EOF

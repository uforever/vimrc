" Basic settings {{{
if v:progname =~? "evim"
  finish
endif

source $VIMRUNTIME/defaults.vim

set nobackup
set noundofile

if &t_Co > 2 || has("gui_running")
  set hlsearch
endif

if has("autocmd")
  augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=78
  augroup END
else
  set autoindent
endif

if has('syntax') && has('eval')
  packadd! matchit
endif
" }}}

" personal config {{{
" statusline settings
set statusline=%f\ %y
set laststatus=0

" show row and num
set number
set cursorline

" set tab
set shiftwidth=4
set tabstop=4
set expandtab

" set leader and localleader
let mapleader = ","
let maplocalleader = "\\"

" some mapping
inoremap jk <Esc>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
inoremap <Esc> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" insert model mapping
inoremap <Leader>w <Esc>vbUea
inoremap <Leader>q <Esc>bvUea
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
" }}}

" Vimscript file settings {{{
augroup ft_vim
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim iabbrev lld <Localleader
    autocmd FileType vim iabbrev ld <Leader
augroup END
" }}}

" .c file settings {{{
augroup ft_c
    autocmd FileType c nnoremap <Localleader>s i#include<Space><stdio.h><CR><CR>int<Space>main(int<Space>argc, char<Space>*argv[])<CR>{<CR>return<Space>0;<CR>}<Esc>kO
    autocmd FileType c inoremap <Leader>p printf("");<Esc>2hi
    autocmd FileType c inoremap <Leader>s scanf("",);<Esc>3hi
    autocmd FileType c inoremap <Leader>; <Esc>$a;<Cr>
augroup END
" }}}

" .css/.scss file settings {{{
augroup ft_css
    autocmd FileType css,scss setlocal tabstop=2
    autocmd FileType css,scss setlocal shiftwidth=2
    autocmd FileType css,scss inoremap { {
    autocmd FileType css,scss inoremap /* /*<Space><Space>*/<Esc>2hi
    " margin "
    autocmd FileType css,scss iabbrev mgt margin-top:
    autocmd FileType css,scss iabbrev mgb margin-bottom:
    autocmd FileType css,scss iabbrev mgl margin-left:
    autocmd FileType css,scss iabbrev mgr margin-right:
    " border "
    autocmd FileType css,scss iabbrev bdt border-top:
    autocmd FileType css,scss iabbrev bdb border-bottom:
    autocmd FileType css,scss iabbrev bdl border-left:
    autocmd FileType css,scss iabbrev bdr border-right:
    " padding "
    autocmd FileType css,scss iabbrev pdt padding-top:
    autocmd FileType css,scss iabbrev pdb padding-bottom:
    autocmd FileType css,scss iabbrev pdl padding-left:
    autocmd FileType css,scss iabbrev pdr padding-right:
    " float "
    autocmd FileType css,scss iabbrev fll float: left;
    autocmd FileType css,scss iabbrev flr float: right;
    autocmd FileType css,scss iabbrev flt float: top;
    autocmd FileType css,scss iabbrev flb float: bottom;
    " text "
    autocmd FileType css,scss iabbrev txa text-align:
    autocmd FileType css,scss iabbrev txt text-transform:
    autocmd FileType css,scss iabbrev txd text-decoration:
    " font "
    autocmd FileType css,scss iabbrev fns font-size:
    autocmd FileType css,scss iabbrev fnw font-weight:
    autocmd FileType css,scss iabbrev lss list-style:
    autocmd FileType css,scss iabbrev lts letter-spacing:
    autocmd FileType css,scss iabbrev lnh line-height:
augroup END
" }}}

" .html.erb file settings {{{
augroup ft_erb
    autocmd FileType eruby setlocal tabstop=2
    autocmd FileType eruby setlocal shiftwidth=2
    autocmd FileType eruby iabbrev dtd <!DOCTYPE html>
    autocmd FileType eruby inoremap <Leader>5 <%<Space><Space>%><Esc>2hi
    autocmd FileType eruby inoremap <Leader>= <%=<Space><Space>%><Esc>2hi
    autocmd FileType eruby inoremap <Localleader><Tab> ><Esc>bi<<Esc>vwwyP2li/<Esc>hi
    autocmd FileType eruby inoremap <Tab><CR> <CR><Esc>O
    autocmd FileType eruby imap <Leader><CR> <Localleader><Tab><Tab><CR>
    autocmd FileType eruby nmap <Localleader>s idtd<CR>html<Leader><CR>body<Localleader><Tab><CR>jkkOhead<Leader><CR>title<Localleader><Tab>
    autocmd FileType eruby inoremap <Localleader>a <a<Space>href=""></a><Esc>5hi
    autocmd FileType eruby imap <Localleader>c <Localleader><Tab><CR>jkk$i<Space>class="
    autocmd FileType eruby inoremap <Leader>c <Esc>3li
augroup END
" }}}

" .rb file settings {{{
augroup ft_rb
    autocmd FileType ruby setlocal formatoptions-=r
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby nnoremap <Localleader>s i#!/usr/bin/ruby<CR>#<Space>-*-<Space>coding:<Space>UTF-8<Space>-*-<CR><CR>
    autocmd FileType ruby inoremap <Leader>{ do<Space>\|\|<CR>end<Esc>k$i
    autocmd FileType ruby inoremap <Leader>d def<CR>end<Esc>ka<Space>
    autocmd FileType ruby inoremap <Leader>i if()<CR>end<Esc>ka
    autocmd FileType ruby inoremap <Leader>t test<Space>""<Space>do<CR>end<Esc>k3la
    autocmd FileType ruby inoremap <Leader>c class<CR>end<Esc>k$a<Space>
    autocmd FileType ruby inoremap {<Space> {<Space><Space>}<Esc>hi
    autocmd FileType ruby iabbrev sgc $stdin.gets.chomp()
    autocmd FileType ruby iabbrev ase assert_equal
    autocmd FileType ruby iabbrev ass assert_select
    autocmd FileType ruby iabbrev asn assert_not
    autocmd FileType ruby iabbrev ast assert_template
    autocmd FileType ruby iabbrev asd assert_difference
    autocmd FileType ruby iabbrev asrt assert_redirect_to
augroup END
" }}}

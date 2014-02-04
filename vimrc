set nocompatible
syntax enable
filetype plugin on
filetype indent on

let g:ScreenImpl = 'GnuScreen'
let vimrplugin_tmux = 0
let g:vimrplugin_noscreenrc = 1
let g:vimrplugin_screenplugin = 1
" Don't use conque shell if installed
let vimrplugin_conqueplugin = 0
" map the letter 'r' to send visually selected lines to R 
let g:vimrplugin_map_r = 1
" see R documentation in a Vim buffer
let vimrplugin_vimpager = "no"
set expandtab
set shiftwidth=4
set tabstop=4
" start R with F2 key
map <F2> <Plug>RStart
imap <F2> <Plug>RStart
vmap <F2> <Plug>RStart
" send selection to R with space bar
vmap <Space> <Plug>RDSendSelection
" send line to R with space bar
nmap <Space> <Plug>RDSendLine

" show line numbers
set nu

" spell check code
set spell

" line wrap on spaces
set formatoptions=l
set lbr

" lisp editing commands
" let g:lisp_rainbow=1
" let g:paredit_mode = 0
" let g:slimv_repl_split = 4

" no swap files help deal with slow i/o
set noswapfile

" use vimr plugin
let vimrplugin_source = "~/.vim/screenR.vim"

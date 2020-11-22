:syntax on
colorscheme molokai

set shell=/bin/bash

set nocompatible " be iMproved, required

filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'Yggdroot/indentLine'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'tacahiroy/ctrlp-funky'
" Plugin 'suy/vim-strlp-commandline'

call vundle#end() " required
filetype plugin indent on " required



"-------------------
" vim-markdown
"-------------------
set conceallevel=2
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_auto_insert_bullets = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_toc_autofit = 1 " Allow for the TOC window to auto-fit
let g:vim_markdown_fenced_languages = ['csharp=cs']
"-------------------

set laststatus=2 " Show statusline
set showmode " Show the current mode on the statusline
set showcmd " Show the typed command under the status line
set ruler " Show the position of the cursor on the right of the statusline


"-------------------
" Indent
"-------------------
" set expandtab
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set shiftwidth=2
"-------------------

"-------------------
" Search
"-------------------
set incsearch
set ignorecase
set smartcase
set hlsearch

nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
"-------------------


"-------------------
" Cursor
"-------------------
set whichwrap=b,s,h,l,<,>,[,],~ " Move to the head of the next line
set number " Show line number
set cursorline " Highlight the cursorline
set backspace=indent,eol,start

"-------------------



if &term =~ "xterm"
	let &t_SI .= "\e[?2004h"
	let &t_EI .= "\e[?2004l"
	let &pastetoggle = "\e[201~"

	function XTermPasteBegin(ret)
		set paste
		return a:ret
	endfunction

	inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif


" show the corresponding pair of brackets
set showmatch

highlight LineNr ctermfg=darkgray

if has('vim_starting')
  let &t_SI .= "\e[6 q"
  let &t_EI .= "\e[2 q"
  let &t_SR .= "\e[4 q"
endif


" Tabular
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

filetype plugin on


set list
" set listchars=space:·,eol:↲
set list lcs=space:·,eol:↲,tab:\|\ 


imap <silent> <C-D><C-D> <C-R>=strftime("%Y-%m-%d")<CR>
imap <silent> <C-F> <Right>
imap <silent> <C-B> <Left>
imap <silent> <C-E> <Esc>A



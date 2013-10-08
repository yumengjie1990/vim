set nocompatible               " be iMproved
filetype off                   " required!
filetype plugin indent on      " required

" run time directory
set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'vim-scripts/YankRing.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'wincent/Command-T'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Raimondi/delimitMate'
Bundle 'Lokaltog/powerline'
Bundle 'Lokaltog/powerline-fonts'
Bundle 'flazz/vim-colorschemes'
Bundle 'wesleyche/Trinity'
" vim-scripts repos
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/SrcExpl'
Bundle 'vim-scripts/cscope.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=300

" Set to auto read when a file is changed from the outside
set autoread
set noswapfile 

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
let g:ycm_confirm_extra_conf = 0

" Fast saving
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>ti :TrinityToggleAll<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;"
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set so=7

set wildmenu "Turn on WiLd menu

set ruler "Always show current position

set cmdheight=2 "The commandbar height

set hid "Change buffer - without saving

set number "Always show number

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" Set code folding
set foldmethod=indent
set foldcolumn=1
set foldlevel=10

" Set powerline
set laststatus=2
set encoding=utf-8
let g:Powerline_symbols='fancy'
let g:yankring_history_dir = '/home/mjyu/.vim/yankring/'

" Set command-T
let g:CommandTMaxHeight = 30
let g:CommandTCachedDirectories = 3

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

" Color scheme
if has("gui_running")
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline 
    colorscheme molokai
    set guioptions-=m
    set guioptions-=T
    set t_Co=256
    set cursorline
else
    colorscheme torte
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => key maps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Leader>cc :CommandT<CR>
nnoremap <silent> <Leader>cr :CommandT $HOME/code/videostream/<CR>
nnoremap <silent> <Leader>bb :CommandTBuffer<CR>
nnoremap <Leader>be :BufExplorerVerticalSplit<CR>
nnoremap <Leader>cs :ConqueTermVSplit bash<CR>
nnoremap <leader>te :tabedit<space>
nnoremap <leader>tn :tabnew .<cr>
nnoremap <space> za
" ycm map
nnoremap <leader>jj :YcmCompleter GoToDefinitionElseDeclaration<CR>
" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
" go to prev tab
nnoremap <S-H> gT
" go to next tab
nnoremap <S-L> gt
nnoremap <C-y> :YRShow<cr>
nnoremap <F3> :NERDTree<cr>
nnoremap <F4> :NERDTreeClose<cr>
nnoremap <F5> :!scons -u -j4<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => others 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set pastetoggle=<F2>  "press F2 to switch to paste mode
set mouse=a

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"au BufWinLeave *.cpp silent mkview
"au BufWinEnter *.cpp silent loadview

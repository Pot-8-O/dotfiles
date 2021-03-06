
set nowb
set noswapfile
set noerrorbells

set mouse=a
set ttymouse=xterm2
set so=999
set clipboard^=unnamed,unnamedplus
set wildmenu

" Appearance "

syntax enable

set number
set relativenumber
set linespace=12

set title
set titlestring=%F\ -\ vim
set noshowmode
set laststatus=2

set background=dark

" File behaviour "

set expandtab
set smarttab
set linebreak
set breakindent
set nostartofline

set shiftwidth=4
set tabstop=4

" Search "

set smartcase
set hlsearch
set incsearch

" Panes "

set splitbelow
set splitright

" Bindings "

set backspace=indent,eol,start

map ; :Files<CR>

map <F6> :setlocal spell!<CR>
map <F12> :Goyo<CR>
map <C-o> :NERDTreeToggle<CR>

map <Leader> <Plug>(easymotion-prefix)

" Plugins "

" Install and run vim-plug on first run
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

so ~/.vim/plugins.vim

let g:gruvbox_vert_split = 'bg1'
let g:gruvbox_sign_column = 'bg0'

colorscheme gruvbox
hi Normal ctermbg=NONE
hi CursorLineNr ctermfg=white
hi SignColumn ctermbg=NONE

highlight GitGutterAdd ctermfg=green ctermbg=NONE
highlight GitGutterChange ctermfg=yellow ctermbg=NONE
highlight GitGutterDelete ctermfg=red ctermbg=NONE
highlight GitGutterChangeDelete ctermfg=yellow ctermbg=NONE

let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['gitbranch', 'fileformat', 'fileencoding']]
  \     },
  \     'component_function': {
  \         'gitbranch': 'gitbranch#name'
  \     }
  \ }

let g:javascript_plugin_flow = 1
let NERDTreeShowHidden = 1
" INFRA-9620 / CVE-2019-06-04
" Please leave this as the LAST LINE in your .vimrc
" This is a temporary kludge fix until Apple updates bundled vim package
" <3 Infra
set nomodeline

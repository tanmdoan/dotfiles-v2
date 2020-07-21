call plug#begin()
  Plug 'dracula/vim'
call plug#end()

if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula

" Set leader
  let mapleader=","
  let maplocalleader=","

syntax on                        " enable syntax highlighting
set cursorline                   " Highlight current line
set wrap                         " wrap long lines
set showcmd                      " show commands as we type them
set showmatch                    " highlight matching brackets
set scrolloff=4 sidescrolloff=10 " scroll the window when we get near the edge
set incsearch                    " show the first match as search strings are typed
set hlsearch                     " highlight the search matches
set ignorecase smartcase         " searching is case insensitive when all lowercase
set gdefault                     " assume the /g flag on substitutions to replace all matches in a line
set directory=/tmp/              " set temporary directory (don't litter local dir with swp/tmp files)
set autoread                     " pick up external file modifications
set hidden                       " don't abandon buffers when unloading
set autoindent                   " match indentation of previous line
set laststatus=2                 " show status line
set display=lastline             " When lines are cropped at the screen bottom, show as much as possible
set backspace=indent,eol,start   " make backspace work in insert mode
set wildmode=list:longest,full   " use tab-complete to see a list of possiblities when entering commands
set clipboard^=unnamed           " Use system clipboard
set shell=zsh                    " Use login shell for commands
set encoding=utf-8               " utf encoding
set number                       " line numbers

" mapping the jumping between splits. Hold control while using vim nav.
  nmap <C-J> <C-W>j
  nmap <C-K> <C-W>k
  nmap <C-H> <C-W>h
  nmap <C-L> <C-W>l

" vim tab navigation
  nnoremap th :tabfirst<CR>
  nnoremap tj :tabprev<CR>
  nnoremap tk :tabnext<CR>
  nnoremap tl :tablast<CR>
  nnoremap tc :tabclose<CR>
  nnoremap tn :tabnew<CR>

" Quick write, quit, write + quit, quit all
  nnoremap <Leader>w :w<CR>
  nnoremap <Leader>q :q<CR>
  nnoremap <Leader>x :x<CR>
  nnoremap <Leader>Q :q!<CR>

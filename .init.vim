" Plugins
  call plug#begin()
    Plug 'dracula/vim'
    Plug 'kien/ctrlp.vim'
    Plug 'mileszs/ack.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'JamshedVesuna/vim-markdown-preview'
    Plug 'edkolev/tmuxline.vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-rails'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-endwise'
    Plug 'vim-ruby/vim-ruby'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'christoomey/vim-tmux-runner'
    Plug 'milkypostman/vim-togglelist'
    Plug 'scrooloose/nerdtree'
    Plug 'gabebw/vim-spec-runner'
    Plug 'mxw/vim-jsx'
    Plug 'godlygeek/tabular'
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-snippets']
  call plug#end()

" Theme
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
set autoread                     " pick up external file modifications
set hidden                       " don't abandon buffers when unloading
set autoindent                   " match indentation of previous line
set laststatus=2                 " show status line
set display=lastline             " When lines are cropped at the screen bottom, show as much as possible
set backspace=indent,eol,start   " make backspace work in insert mode
set clipboard^=unnamed           " Use system clipboard
set shell=zsh                    " Use login shell for commands
set encoding=utf-8               " utf encoding
set number                       " line numbers
set nobackup 	 		               " no backups
set nowritebackup 	 	           " no backups
set noswapfile     	 	           " no swap file

" match tabs/spaces
  set smarttab
  set smartindent
  set expandtab tabstop=2 softtabstop=2 shiftwidth=2

" flip the default split directions to sane ones
  set splitright
  set splitbelow

"folding settings
  set foldmethod=indent   "fold based on indent
  set foldnestmax=10      "deepest fold is 10 levels
  set nofoldenable        "dont fold by default

" remember last position in file
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

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

" buffer resizing mappings
  nnoremap <S-H> :vertical resize -10<cr>
  nnoremap <S-L> :vertical resize +10<cr>

" Yank from the cursor to the end of the line, to be consistent with C and D.
  nnoremap Y y$

" Unhighlight search results
  map <Leader><space> :nohl<cr>

" ctrlp
 if get(g:, 'loaded_ctrlp', 1)
   let g:ctrlp_match_window_reversed = 0
   " let g:ctrlp_working_path_mode = 'a'
   let g:ctrlp_max_height = 20
   let g:ctrlp_match_window_bottom = 0
   let g:ctrlp_switch_buffer = 0
   let g:ctrlp_custom_ignore = '\v(\.DS_Store|\.sass-cache|\.scssc|tmp|\.bundle|\.git|node_modules|vendor|bower_components|deps|_build)$'
   let g:ctrlp_working_path_mode = 'w'
   if executable('ag')
      let g:ctrlp_user_command = 'ag %s
             \ -l
             \ --nocolor
             \ --ignore .git
             \ --ignore .svn
             \ --ignore "*.class"
             \ --ignore "*.o"
             \ --ignore "*.obj"
             \ --ignore "*.rbc"
             \ --ignore features/cassettes
             \ --ignore spec/cassettes
             \ --ignore tmp/cache
             \ --ignore vendor/gems
             \ --ignore vendor/ruby
             \ -g ""'
   endif
 endif

 command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" Ack
  nnoremap <leader><bs> :Ack! '\b<c-r><c-w>\b'<cr>
  nnoremap <leader>a :Ack<space>

" NERDTree configuration
  let NERDTreeIgnore=['\~$', 'tmp', '\.git', '\.bundle', '.DS_Store', 'tags', '.swp']
  let NERDTreeShowHidden=1
  let g:NERDTreeDirArrows=0
  let g:NERDTreeNodeDelimiter = "\u00a0"
  map <Leader>n :NERDTreeToggle<CR>
  map <Leader>fnt :NERDTreeFind<CR>
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif   " Automaticaly 
    " close nvim if NERDTree is only thing left open

" Markdown preview
  let vim_markdown_preview_toggle=1
  let vim_markdown_preview_hotkey='<C-m>'
  let vim_markdown_preview_github=1

" Tmux status bar
  let g:tmuxline_preset = {
    \'win'    : '#I #W',
    \'cwin'    : '#I #W #F',
    \ }
  let g:tmuxline_powerline_separators = 0

" toggle quickfix with <Leader> c
  let g:toggle_list_no_mappings=1
  nmap <script> <silent> <Leader>c :call ToggleQuickfixList()<CR>

" Run specs quickly with tmux
  let g:VtrClearSequence = "^C^Mclear^M"
  nmap <leader>h :VtrOpenRunner({'orientation': 'h', 'percentage': 33})<CR>
  nmap <leader>v :VtrOpenRunner({'orientation': 'v', 'percentage': 20})<CR>
  nmap <leader>k :VtrKillRunner<CR>
  let g:spec_runner_dispatcher = 'call VtrSendCommand("bundle exec {command}")'
  let g:disable_write_on_spec_run = 1
  map <leader>t <plug>RunCurrentSpecFile
  map <leader>T <plug>RunFocusedSpec
  map <leader>tl <plug>RunMostRecentSpec

" use <tab> for trigger completion and navigate to the next complete item
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  inoremap <silent><expr> <Tab>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()

" use <C-j/k> to nav completion list
  inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"


if filereadable(expand('~/.init.vim.local'))
  source ~/.init.vim.local
endif

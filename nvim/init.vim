" leaves insert mode after 15 seconds of no input
"stopinsert au InsertEnter * let updaterestore=&updatetime | set updatetime=15000 au InsertLeave * let &updatetime=updaterestore

" Appearance
"let g:airline_theme='bubblegum'
"let g:airline_powerline_fonts = 1
"set guifont=Inconsolata\ for\ Powerline

" Disable vim backups
set nobackup
set noswapfile

" SHORTCUT REMAPPINGS
nnoremap ; :
inoremap jk <esc>
inoremap kj <esc>
nnoremap j gj
nnoremap k gk

" For terminal mode
tnoremap kj <C-\><C-n>
tnoremap jk <C-\><C-n>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

map <silent> F :Files<CR>

" easy access to nerdtree
map <silent> <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1

" clears search buffer with ,/
nmap <silent> ,/ :nohlsearch<CR>

" highlights cursor line only in active window
au WinEnter * setlocal cursorline
au WinLeave * setlocal nocursorline

" hides buffers instead of closing them
set hidden

" dynamically set and reset paste mode when copying and pasting text
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" sets tab to predefined number of spaces
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" set autoindent and text width max size
set autoindent
set textwidth=80

" set split to split new window to right instead of left
set splitright

" other stuff
set nowrap        " don't wrap lines
set backspace=indent,eol,start	  " allow backspacing over everything in insert mode
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set mouse=a       " mouse support
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
"set title                " change the terminal's title
set visualbell           " don't beep
set fileformat=unix      " stores files in unix format
set noerrorbells         " don't beep
syntax enable            " enable syntax highlighting

" set system clipboard as default for copy operations
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

" for setting indents based on file type
if has('autocmd')
	filetype plugin indent on
	autocmd filetype python set expandtab
endif
"add vim wordprocessor mode
"func! WordProcessorMode()
 "setlocal textwidth=80
 "setlocal smartindent
 "setlocal spell spelllang=en_us
 "setlocal noexpandtab
"endfu
"com! WP call WordProcessorMode()

" for use with c++
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
" use w!! to save read-only files
cmap w!! %!sudo tee > /dev/null %

" for javscript improvements
let g:javascript_plugin_flow = 1    "adds support for Flow
let g:jsx_ext_required = 0      "so you don't need have jsx extension

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
"   " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
"
"   " Make sure you use single quotes
"
"   " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
"
"   " Any valid git URL is allowed
 Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
"   " Multiple Plug commands can be written in a single line using |
"   separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
"   " On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
"   " Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
"   " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }
"
"   " Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"
"   " Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"
"   " Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'
"
"   " Initialize plugin system
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"
"   " you complete me
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"
"   " vim rtags
Plug 'lyuts/vim-rtags'

"
"   " vim javascript improvements
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'

"   " themes
Plug 'ajh17/Spacegray.vim'
Plug 'morhetz/gruvbox'
"Plug 'mhinz/vim-janah'
Plug 'Soares/base16.nvim'

"   " autocomplete tags for tags file (idk what this is rn)
Plug 'ludovicchabant/vim-gutentags'

"   " auto pairing for tags
Plug 'jiangmiao/auto-pairs'

"   " switch surroundings, ie quotes and pairs
Plug 'tpope/vim-surround'

"   " easy commenting
Plug 'tpope/vim-commentary'

"   " fuzzy searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"   " syntax highlighting
" Plug 'w0rp/ale'

"   " git integration
Plug 'tpope/vim-fugitive'
call plug#end()

" Plugins to check out: ctrlP - navigating files, yankring - history, python mode 

" colorscheme
" autocmd ColorScheme janah highlight Normal ctermbg=235
set termguicolors
let g:base16_airline=1

set background=dark
colorscheme railscasts
"let base16colorspace=256
"set background=dark    " Setting dark mode

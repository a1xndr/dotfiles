" ------------ ajh's .vimrc ------------
" Plugins {{{1

" Syntax, FileType, Colorscheme {{{1
syntax on
filetype plugin indent on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'vim-scripts/c.vim'
Plugin 'vim-scripts/fortran.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kovisoft/slimv'
Plugin 'chriskempson/base16-vim'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/OmniCppComplete'
call vundle#end()

nnoremap <CR> :noh<CR><CR>
" General {{{1
set autoread
set number
set backspace=indent,eol,start
set hidden
"set mouse=n ttymouse=sgr
set nostartofline
set path=.,**
set switchbuf=useopen,usetab
set ttimeoutlen=50
set wildmenu wildcharm=<C-z>

set colorcolumn=81
" UI {{{1
set formatoptions+=1j
set lazyredraw
set linebreak
set list listchars=tab:│\ ,extends:›,precedes:‹,nbsp:·,trail:·
set nofoldenable
set nojoinspaces
set showcmd showbreak=↪
set splitright
set fillchars=vert:│    " that's a vertical box-drawing character


" Searching {{{1
set hlsearch incsearch
set ignorecase smartcase
set showmatch matchtime=2
set grepprg=ag\ --hidden\ --vimgrep grepformat^=%f:%l:%c:%m

" Indenting {{{1
set autoindent
set breakindent breakindentopt=shift:4,sbr
set smarttab expandtab
set softtabstop=4 shiftwidth=4 shiftround

" Backup {{{1
set history=200
set noswapfile
set backup backupdir=~/.vim/backup/
set undofile undodir=~/.vim/backup/undo/

" Wildignore {{{1
set wildignore+=.hg,.git,.svn,*.pyc,*.spl,*.o,*.out,*.DS_Store,*.class,*.manifest,*~,#*#,%*
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,*.xc*,*.pbxproj,*.xcodeproj/**,*.xcassets/**

" General Mappings {{{1

" Switch between splits
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>
noremap <silent> <Leader>vs :exe AddColumn()<CR>
function! AddColumn()
  exe "norm \<C-u>"
  let @z=&so
  set noscb so=0
  bo vs
  exe "norm \<PageDown>"
  setl scrollbind
  wincmd p
  setl scrollbind
  let &so=@z
endfunction
colorscheme base16-ocean
"let base16colorspace=256
set background=dark

if v:version >= 600
  filetype plugin on
  filetype indent on
else
  filetype on
endif
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

function! UpdateTags()
  execute ":!ctags -R --languages=C++ --c++-kinds=+p --fields=+iaS --extra=+q ./"
  echohl StatusLine | echo "C/C++ tag updated" | echohl None
endfunction
nnoremap <F4> :call UpdateTags()
set tags+=~/.vim/tags/cpp


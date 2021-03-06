syntax on
filetype plugin indent on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'vim-scripts/c.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kovisoft/slimv'
Plugin 'chriskempson/base16-vim'
"Plugin 'ervandew/supertab'
"Plugin 'vim-scripts/OmniCppComplete'
Plugin '0ax1/lxvc'
Plugin 'airblade/vim-gitgutter'
Plugin 'godlygeek/tabular'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'w0rp/ale'
Plugin 'fatih/vim-go'
Plugin 'lifepillar/vim-mucomplete'
Plugin 'vim-scripts/dbext.vim'
Plugin 'lervag/vimtex'
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
"let base16colorspace=256
set background=dark
let g:airline_powerline_fonts = 0
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
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,noselect
inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")
  set shortmess+=c   " Shut off completion messages
  let g:mucomplete#enable_auto_at_startup = 1

function! UpdateTags()
  execute ":!ctags -R --languages=C++ --c++-kinds=+p --fields=+iaS --extra=+q ./"
  echohl StatusLine | echo "C/C++ tag updated" | echohl None
endfunction
nnoremap <F4> :call UpdateTags()
set tags+=~/.vim/tags/cpp

"set termguicolors
colorscheme base16-ocean
"set clipboard^=unnamedplus,unnamed

set path+=**
set wildmenu
command! MakeTags !ctags -R .
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
hi NonText ctermbg=none 
hi Normal guibg=NONE ctermbg=NONE

hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE


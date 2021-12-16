" General configuration

set title               " Name of the file
set number              " Line number
set mouse=a             " Mouse
set nowrap              " No division of line in case it's so long
set cursorline          " Actual line
set colorcolumn=120     " Column limit
set tabstop=2           " indentation
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab           " Space instead of tab
set hidden              " Change buffers with no need of storage
set ignorecase          " No case sensitive in searchings
set smartcase           " No ignoring uppercase
set spelllang=en,es     " Language correction


"mappings
let g:mapleader = ' ' " Space as leader key

nnoremap <leader>s :w<CR> " Save with <leader>+s

" Copy/paste
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>d "+d
nnoremap <leader>d "+d
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+p
vnoremap <leader>P "+p

" Change between tabs
nnoremap <C-Right> gt
nnoremap <C-Left> gT

" Change between buffers
nnoremap <C-S-Right> :bn<cr> 
nnoremap <C-S-Left> :bp<cr> 
"    Kill buffer
nnoremap <C-S-q> :bw!<cr>
"    Buffers list
nnoremap <C-S-l> :Buffers<cr>
" Map <Esc> to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Map cocActions
nnoremap <leader>c :CocAction<cr>

" Plugins
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'mhartington/oceanic-next'
  Plug 'jacoborus/tender.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'airblade/vim-gitgutter'
  Plug 'jreybert/vimagit'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
call plug#end()

" Plugins configuration
  
  " Nerdtree 
   nmap <leader>n :NERDTreeToggle<CR>

  " colorscheme
  set termguicolors       " True colors in terminal
  syntax enable
  colorscheme tender      " Preferred colorscheme : desert, morning, OceanicNext

  " Airline theme
  let g:airline_theme='owo'

  " GitGutter
  " Use fontawesome icons as signs
  let g:gitgutter_sign_added = '+'
  let g:gitgutter_sign_modified = '>'
  let g:gitgutter_sign_removed = '-'
  let g:gitgutter_sign_removed_first_line = '^'
  let g:gitgutter_sign_modified_removed = '<'

  " vimagit
  " Open vimagit pane
  nnoremap <leader>gs :Magit<CR>

  " UltiSnips
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  let g:UltiSnipsEditSplit="vertical"

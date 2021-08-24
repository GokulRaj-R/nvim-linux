call plug#begin("~/.vim/plugged")
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'mattn/emmet-vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'skywind3000/asyncrun.vim'
Plug 'rafi/awesome-vim-colorschemes'
call plug#end()


" ===========================================================================================
" Settings
" ===========================================================================================
" Color Scheme
set termguicolors
syntax enable
colorscheme onedark


" NerdTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" Fzf
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Python
let g:python3_host_prog = "/usr/bin/python3"
let g:python_highlight_all = 1

" Airline
let g:airline_section_c = '%-1.3n | %t'

" SnipMate
let g:snipMate = { 'snippet_version' : 1 }



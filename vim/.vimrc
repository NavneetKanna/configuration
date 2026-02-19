call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'

Plug 'sheerun/vim-polyglot'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'rafi/awesome-vim-colorschemes'

Plug 'nordtheme/vim'

Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'

Plug 'sainnhe/edge'

Plug 'tpope/vim-commentary'

call plug#end()

if (has("termguicolors"))
  set termguicolors
endif

set background=dark
colorscheme desert

" Dark statusline that works with desert + dark background
hi StatusLine    ctermbg=8  ctermfg=7  guibg=#404040 guifg=#d0d0d0
hi StatusLineNC ctermbg=0  ctermfg=8  guibg=#1c1c1c guifg=#808080

highlight NonText ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

function! HumanSize() abort
    " line2byte(line('$') + 1) - 1 is the most accurate way to get buffer size
    let l:bytes = line2byte(line('$') + 1) - 1
    if l:bytes < 0 | return '0B' | endif
    
    let l:sizes = ['B', 'KiB', 'MiB', 'GiB', 'TiB']
    let l:i = 0
    while l:bytes >= 1024 && l:i < len(l:sizes) - 1
        let l:bytes = l:bytes / 1024.0
        let l:i += 1
    endwhile
    return printf('%.1f%s', l:bytes, l:sizes[l:i])
endfunction

set laststatus=2

" %f %m stay on the left. Everything after %= goes to the right.
set statusline=%f\ %m%=%y\ [%LL]\ [%l,%c]\ %P\ %{HumanSize()}

set number
set relativenumber
set mouse=a
set clipboard=unnamed
set ignorecase
set smartcase
set showmode
set expandtab
set shiftwidth=4
set tabstop=4
set title
set smartindent
set hlsearch
set incsearch
set nowrap

let mapleader = " "

nnoremap <CR> :noh<CR><CR>

" FZF: Space + f to Find files
nnoremap <leader>f :Files<CR>

" FZF: Space + g to Grep (search text inside files)
nnoremap <leader>g :Rg<CR>

" FZF: Space + b to find open Buffers
nnoremap <leader>b :Buffers<CR>

" NERDTree: Space + e to toggle file tree
nnoremap <leader>e :NERDTreeToggle<CR>

" Navigation: Ctrl+h/j/k/l to move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Rename symbol (Space + rn)
nmap <leader>rn <Plug>(coc-rename)


" 1. Autocomplete
" Use Tab to trigger completion and navigate the list
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use Enter to confirm selection
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 2. Go To Definition / References
" gd = Go to Definition
nmap <silent> gd <Plug>(coc-definition)
" gy = Go to Type Definition
nmap <silent> gy <Plug>(coc-type-definition)
" gr = Go to References (where is this used?)
nmap <silent> gr <Plug>(coc-references)

" 3. Documentation (Hover)
" Press K to show documentation in a popup
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

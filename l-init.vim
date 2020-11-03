set background=dark
syntax on
filetype plugin indent on

set noerrorbells
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set incsearch
set clipboard=unnamedplus
set hidden
set scrolloff=8
set noshowmode
set updatetime=10
set shortmess+=c
set signcolumn=yes
set colorcolumn=120
set relativenumber
set termguicolors
highlight ColorColumn ctermbg=0 guibg=lightgrey


" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'jceb/vim-orgmode'

" Auto Complete
Plug 'OmniSharp/omnisharp-vim'
Plug 'scrooloose/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" NERDTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Color Schemes
Plug 'lifepillar/vim-gruvbox8'
Plug 'karoliskoncevicius/sacredforest-vim'
Plug 'jpo/vim-railscasts-theme'
Plug 'blevs/vim-dzo'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'OrangeT/vim-csharp'
call plug#end()



colorscheme gruvbox8_soft 
"colorscheme sacredforest 
"colorscheme dzo
"colorscheme railscasts
"colorscheme onedark
"colorscheme gruvbox

"highlight Normal ctermbg=NONE guibg=NONE
"highlight NonText ctermbg=NONE guibg=NONE
"highlight StatusLine ctermbg=NONE cterm=NONE
"au ColorScheme * hi Normal ctermbg=none guibg=none

"let g:gruvbox_contrast_dark = 'hard'
"let g:gruvbox_invert_selection='0'
"
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = ['\.meta$', '\.cs.meta$']

"let g:OmniSharp_translate_cygwin_wsl = 1
let g:OmniSharp_server_use_mono = 1
"let g:OmniSharp_prefer_global_sln = 1  
let g:OmniSharp_timeout = 10         
let t:is_transparent = 0                                                                        

function! Toggle_transparent_background()                                                       
  if t:is_transparent == 0                                                                      
    hi Normal guibg=#111111 ctermbg=black                                                       
    let t:is_transparent = 1                                                                    
  else                                                                                          
    hi Normal guibg=NONE ctermbg=NONE                                                           
    let t:is_transparent = 0
  endif
endfunction                                                                                     
nnoremap <C-t> :call Toggle_transparent_background()<CR>  

let t:is_darkmode = 0
function! Toggle_dark_mode()
    if t:is_darkmode ==0
        set background=dark
        let t:is_darkmode = 1
    else
        set background=light
        let t:is_darkmode = 0
    endif
endfunction
nnoremap <C-b> :call Toggle_dark_mode()<CR>

if executable('rg')
    let g:rg_derive_root='true'
endif


":call Toggle_transparent_background()
":call Toggle_dark_mode()

let loaded_matchparen = 1
let mapleader = " "

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-omnisharp',
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_checkout_track_key = 'ctrl-t'

command! -nargs=0 Prettier :CocCommand prettier.formatFile

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction



" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0]

nnoremap <leader>gc :GCheckout<CR>
"nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
"nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
"nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d
map <Leader>n :NERDTreeToggle<CR>

inoremap <C-c> <esc>
command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <silent><expr> <C-space> coc#refresh()


nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart




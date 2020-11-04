syntax on
filetype on
filetype plugin indent on


call plug#begin('~/.config/nvim/plugged')
" Auto Complete / Syntax
"Plug 'neoclide/coc.nvim', {'branch': 'release'} " Tab auto complete
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'OmniSharp/omnisharp-vim' " C# support
Plug 'dense-analysis/ale'
Plug 'jceb/vim-orgmode' " Emacs Org mode for Vim
Plug 'sheerun/vim-polyglot' " Syntax highlighting

" Vim Airline
Plug 'vim-airline/vim-airline' " Lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes' " airline theme...

" NERDTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Color Schemes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'

" Git
Plug 'tpope/vim-fugitive'

" Unity Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'Mathij-Bakker/vim-unity-snippets'
Plug 'naumazeredo/vim-unity3d-snippets'
Plug 'kitao/unity_dict'

" Misc
Plug 'vim-utils/vim-man' " Vim man pages
Plug 'mbbill/undotree' " Undo history visualizer
Plug 'tpope/vim-dispatch' " required to launch OmniSharp server
Plug 'scrooloose/nerdcommenter'
call plug#end()

"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
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
set clipboard+=unnamedplus 
set hidden
set scrolloff=8
set noshowmode
set updatetime=10
set shortmess+=c
set signcolumn=yes
set mouse=a
set colorcolumn=120
set relativenumber
set termguicolors
colorscheme gruvbox 

highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight StatusLine ctermbg=NONE cterm=NONE
hi ColorColumn ctermbg=0 guibg=lightgrey

let g:ale_completion_enabled = 1
let g:ale_linters = {'cs': ['OmniSharp']}

let g:OmniSharp_server_path = '/home/brettbar/.cache/omnisharp-vim/omnisharp-roslyn/run'
"let g:OmniSharp_prefer_global_sln = 1
"let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_want_snippet=1
let g:OmniSharp_popup = 1
let g:OmniSharp_popup_options = {
\ 'winblend': 30,
\ 'winhl': 'Normal:Normal'
\}
let g:OmniSharp_timeout = 10
let g:omnicomplete_fetch_full_documentation = 1
set previewheight=5

let g:UltiSnipsSnippetDirectories=["UltiSnips", "UnitySnippets"]

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:float_preview#docked = 0

let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'

let g:gruvbox_contrast_dark = 'lightgrey'
let g:gruvbox_invert_selection='0'

let loaded_matchparen = 1
let mapleader = " "

"let g:coc_global_extensions = [
"  \ 'coc-snippets',
"  \ 'coc-pairs',
"  \ 'coc-tsserver',
"  \ 'coc-eslint', 
"  \ 'coc-prettier', 
"  \ 'coc-json', 
"  \ ]

let t:is_transparent = 0

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_checkout_track_key = 'ctrl-t'

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

"command! -nargs=0 Prettier :CocCommand prettier.formatFile

"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0]

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

nnoremap <leader>gc :GCheckout<CR>
"nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
"nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
"nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
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
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
inoremap <C-c> <esc>

"inoremap <silent><expr> <C-space> coc#refresh()
"nmap <leader>gd <Plug>(coc-definition)
"nmap <leader>gy <Plug>(coc-type-definition)
"nmap <leader>gi <Plug>(coc-implementation)
"nmap <leader>gr <Plug>(coc-references)
"nmap <leader>rr <Plug>(coc-rename)
"nmap <leader>g[ <Plug>(coc-diagnostic-prev)
"nmap <leader>g] <Plug>(coc-diagnostic-next)
"nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
"nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
"nnoremap <leader>cr :CocRestart

augroup omnisharp_commands
    autocmd!
 
    " Show type information automatically when the cursor stops moving.
    " Note that the type is echoed to the Vim command line, and will overwrite
    " any other messages in this space including e.g. ALE linting messages.
    autocmd CursorHold *.cs OmniSharpTypeLookup
 
    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
 
    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>
 
    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>
 
    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
 
    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END

" Requited dependencies:
" 1) ClangFormat (sudo apt install clang-format)
" 2) Vim 8.2 or newer (sudo add-apt-repository ppa:jonathonf/vim && sudo apt update && sudo apt
" update && sudo apt install vim)
" 3) Nodejs >= 10.12 (curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -)
" 4) powerline (pip3 install git+git://github.com/Lokaltog/powerline)
" 5) ccls (sudo snap install ccls --classic)

"==================================="
"=====set SPACE as the <LEADER>====="
"==================================="
let mapleader=" "

"================================="
"======gruvbox configurations====="
"================================="
let g:gruvbox_contrast_dark = 'soft'

"=========================="
"=====enable powerline====="
"=========================="
set rtp+=~/anaconda3/lib/python3.8/site-packages/powerline/bindings/vim/
set t_Co=256

if filereadable("/usr/share/powerline/bindings/bash/powerline.sh")
  python3 from powerline.vim import setup as powerline_setup
  python3 powerline_setup()
  python3 del powerline_setup
endif

set laststatus=2

"============================"
"=====enable mouse click====="
"============================"
set mouse=a

"===================================="
"=====disable swap file creation====="
"===================================="
set noswapfile

"========================================"
"=====to switch off highlight search====="
"========================================"
noremap <LEADER><CR> :nohlsearch<CR>

"=========================="
"=====Enable backspace====="
"=========================="
set backspace=indent,eol,start

" Line numbers
set number
set number relativenumber

set wildmenu
set wrap
set showcmd
set hlsearch
set incsearch
set ignorecase
set smartcase
syntax on

" Share clipboard with the system
set clipboard=unnamedplus

filetype on 
filetype indent on
filetype plugin on
filetype plugin indent on


set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set tw=0
set scrolloff=7
set foldmethod=indent
set foldlevel=99
set laststatus=2
set autochdir

"========================================"
"=====more intuitive movment key map====="
"========================================"
"left
noremap j h
"down
noremap k j
"up
noremap i k

"======================"
"=====compensate I====="
"======================"
noremap t I

"====================="
"=====replacement====="
"====================="
nnoremap s :%s///gc<left><left><left><left>

"=============================="
"=====save, quit and source====="
"=============================="
map S :w<CR>
map Q :q<CR>
map R :source ~/.vim/vimrc<CR>
 
"================================"
"=====plugins using vim-plug====="
"================================"
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'mbbill/undotree/'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rhysd/vim-clang-format'
Plug 'craigemery/vim-autotag'
Plug 'mileszs/ack.vim'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'davidhalter/jedi-vim'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'sheerun/vim-polyglot'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
call plug#end() 

"============================="
"=====choose COLOR SCHEME====="
"============================="
colorscheme onedark
" colorscheme gruvbox
" colorscheme dracula
" colorscheme molokai

"======================"
"=====screen split====="
"======================"
map <LEADER>l :set splitright<CR>:vsplit<CR>
map <LEADER>i :split<CR>

"============================"
"=====go to split-screen====="
"============================"
map <C-k> <C-w>j
map <C-i> <C-w>k
map <C-j> <C-w>h
map <C-l> <C-w>l

"==============================="
"=====resizing split-screen====="
"==============================="
nmap <LEADER><up> :resize-3<CR>
nmap <LEADER><down> :resize+3<CR>
nmap <LEADER><left> :vertical resize+3<CR>
nmap <LEADER><right> :vertical resize-3<CR>

"=============="
"=====tabs====="
"=============="
map tt :tabe<CR>
map qw :+tabnext<CR>
map wq :-tabnext<CR>

"======================"
"=====clang format====="
"======================"
map I :ClangFormat<CR>

set nocompatible              " be iMproved, required

let g:ackprg = 'ag --vimgrep'

"============================="
"=====from Coc.vim readme====="
"============================="
let g:coc_disable_startup_warning=1
set hidden " TextEdit might fail if hidden is not set.

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"================================="
"=====markdown preview (grip)====="
"================================="
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Mozilla Firefox'

"========================"
"=====format options====="
"========================"
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'ycm-core/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons' " XXX must be last plugin to be loaded
call plug#end()

syntax on
set noswapfile
set mouse=a
set backspace=indent,eol,start
set laststatus=2
"set statusline=%f\ %l:%c\ [offset:\ %{line2byte(line('.'))-1+col('.')-1}]\ hex:\ 0x%02B
set colorcolumn=110
set textwidth=100
set wrapmargin=0
set formatoptions=cqt "tcron
set nowrap
set encoding=utf-8
set foldenable
set fdm=marker
set scrolloff=8
set sidescrolloff=15
set sidescroll=1
set rnu
set numberwidth=5
set tabstop=4
set shiftwidth=4
set noexpandtab
set smarttab
set modelines=5
set modeline
set autoindent
set smartindent
set cindent

set hlsearch
set incsearch
set ignorecase
set smartcase

au FileType fsharp set et ts=4 sw=4
au BufNewFile,BufRead *.md set syntax=markdown

"colorscheme trapni
"colorscheme Monokai
"colorscheme Benokai " overrides some stuff (types!)

"filetype indent on
filetype plugin on

" set <space> to toggle fold
nnoremap <space> za

" function shortcuts (command mode)
nmap <F2>  :w<enter>
nmap <F3> :NERDTreeToggle<enter>
nmap <C-N> :NERDTreeFind<enter>
nmap <C-J> :0read ~/.vim.header<enter>
nmap <C-H> :noh<enter>

" tabbed windows (command mode)
nmap <S-H> :tabprev<enter>
nmap <S-L> :tabnext<enter>
nmap <S-T> :tabnew<enter>
nmap <S-C> :tabclose<enter>

"nmap <F12> :!make<enter>
"imap <F2>  <ESC>:w<enter>a
"imap <F10> <ESC>:q<enter>

" spelling (en)
"set spell
"set spelllang=en
"set spellsuggest=9

" enable current cursor line/column highlighting
set cursorline
"set cursorcolumn

" C++11 syntax highlighting fix (lambdas and initializers)
let c_no_curly_error=1

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

let NERDTreeIgnore = [ '\.o$', 'cmake_install.*', 'CMakeFiles', 'CMakeCache.*' ]

"set list
"set listchars=tab:――,trail:·
"highlight NonText ctermbg=red ctermfg=white
"highlight SpecialKey ctermbg=red ctermfg=white

" fuzzyfinder shortcuts (command mode)
"(buggy)nmap <C-L> :FufCoverageFile<CR>

au BufNewFile,BufRead Makefile set ts=4 sw=4

" {{{ git (fugitive)
nmap <C-G> :Gstatus<enter>
nmap <C-B> :Gblame<enter>
nmap <C-F> :Ggrep<Space>

nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>ga :Gcommit --amend<CR>
nnoremap <leader>gt :Gcommit -v -q %<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>

" }}}
" {{{ LLVM IR
au BufNewFile,BufRead *.bc set filetype=llvm
au BufNewFile,BufRead *.ll set filetype=llvm
" }}}
" {{{ x0 / Flow
au BufNewFile,BufRead *.flow setf x0dconf
" }}}
" {{{ C/C++
au FileType c,cpp,objc set ts=4
au FileType c,cpp,objc set sw=4
au FileType c,cpp,objc set noet

" let g:clang_format#style_options = {
"             \ "AccessModifierOffset": -4,
"             \ "AllowShortIfStatementsOnASingleLine": "false",
"             \ "AlwaysBreakTemplateDeclarations": "true",
"             \ "Standard": "C++11" }

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
" }}}
" {{{ FuzzyFinder
"nmap <silent> <C-O> :FufFile<CR>
nmap <silent> <C-T> {:call fuf#setOneTimeVariables(['g:fuf_coveragefile_globPatterns', ['**/*.h', '**/*.cc', '**/*.cpp', '**/.md', '**/*.ac', '**/*.am', '**/*.pc.in', '**/*.conf', '**/*.jinja', '**/*.sls']]) \| FufCoverageFile<CR>}
nmap <Leader>fr :FufRenewCache<CR>
" }}}
" {{{ YCM (YouCompleteMe)
nnoremap <leader>gg :YcmCompleter GoTo<CR>
nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>gt :YcmCompleter GoToType<CR>
nnoremap <leader>it :YcmCompleter GetType<CR>
" }}}
" {{{ CoC related
set cmdheight=2
set hidden
set updatetime=300
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-json', 
  \ ]

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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
inoremap <silent><expr> <c-space> coc#refresh()
" }}}

" {{{ NERDTree
" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()
" }}}

function! SetupEnvironment()
  let l:path = expand('%:p')
  if l:path =~ '.sol$'
    setlocal expandtab
    setlocal tabstop=4 shiftwidth=4
  elseif l:path =~ '/home/trapni/projects/contour'
    setlocal expandtab
    setlocal tabstop=4 shiftwidth=4
  elseif l:path =~ '/home/trapni/projects/libterminal'
    setlocal expandtab
    setlocal tabstop=4 shiftwidth=4
  elseif l:path =~ '/home/trapni/projects/klex'
    setlocal noexpandtab
    setlocal tabstop=4 shiftwidth=4
  elseif l:path =~ '/home/trapni/ethereum/solidity'
    setlocal noexpandtab
    setlocal tabstop=4 shiftwidth=4
    setlocal colorcolumn=99
  elseif l:path =~ '/home/trapni/ethereum/cpp-ethereum'
    setlocal tabstop=4 shiftwidth=4 expandtab
    setlocal colorcolumn=99
  elseif l:path =~ '/home/trapni/projects/x0'
    setlocal expandtab
    setlocal tabstop=2 shiftwidth=2
  endif
endfunction
autocmd! BufReadPost,BufNewFile * call SetupEnvironment()

" open NERDTree when no file is to be opened at sratup
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

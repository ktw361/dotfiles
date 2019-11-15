set runtimepath+=~/.vim_runtime

" For vundle
let vundle_file=findfile("~/.vim_vundle_rc.vim", ".;")
if !empty(vundle_file) && filereadable(vundle_file)
    source ~/.vim_vundle_rc.vim
endif

" Vim-Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/linediff.vim'
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'skywind3000/asyncrun.vim'
" Plug 'Chiel92/vim-autoformat'
" Plug 'tmhedberg/SimpylFold'
" Plug 'python-mode/python-mode', { 'branch': 'develop' }
" Plug 'cjrh/vim-conda'
call plug#end()

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

set t_Co=256
colorscheme gruvbox

set guifont=Monospace:h10
set nocompatible
set number
set mouse=a
set splitright
set splitbelow
set autoindent
set showmatch
set switchbuf="" " for Ack.vim

set shiftwidth=4
set tabstop=4
set expandtab

syntax enable
filetype plugin on

set path+=**
set wildmenu
set exrc  " per project .vimrc
set tags=./.tags;,.tags

command! MakeTags :AsyncRun ctags -f .tags -R .
command! MakeCscope :AsyncRun cscope -f .cscope.out -R -b

" If we dont't have a local vimrc, then we set <F4> to execute single file.
" otherwise(non empty case), we don't set it here
let local_vimrc=findfile(".vimrc", ".")
if empty(local_vimrc)
    autocmd filetype python nnoremap <F4> :w <bar> :AsyncRun -raw python3 %<CR>
    " autocmd filetype python set foldmethod=indent
    " autocmd filetype python set foldnestmax=2
    autocmd filetype c nnoremap <F4> :w <bar> :AsyncRun gcc -g % -o %:r && echo Compilation complete && ./%:r<CR>
    " autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ -std=c++11 -Wall -g -fsanitize=address '.shellescape('%').' -o'.shellescape('%:r').' && echo Compilation complete && ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer-4.0 ./'.shellescape('%:r')<CR>
    autocmd filetype cpp nnoremap <F4> :w<bar>:AsyncRun g++ -std=c++11 -Wall -g -fsanitize=address % -o %:r  && echo Compilation complete && ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer-4.0 ./%:r<CR>
    autocmd filetype go nnoremap <F4> :w <bar> :AsyncRun go run %<CR>
    autocmd filetype sh nnoremap <F4> :w <bar> :AsyncRun bash %<CR>
    autocmd filetype cuda nnoremap <F4> :w <bar> :AsyncRun nvcc -g -G -O0 -std=c++11 % -o %:r && echo Compilation complete && ./%:r<CR>
    autocmd filetype cool nnoremap <F4> :w <bar> :AsyncRun coolc % && spim %:r.s<CR>
endif
" let g:syntastic_cpp_compiler_options = ' -std=c++11'

" Quickfix/Location window
autocmd! FileType qf nnoremap <buffer> <leader><Enter> <C-w><Enter><C-w>L

" AsyncRun.vim
" automatically open quickfix window when AsyncRun command is executed
" set the quickfix window 6 lines height.
let g:asyncrun_open = 10
map <leader>a :AsyncRun 
map <leader>g :AsyncRun ag 

" Cool Language commentary
autocmd FileType cool setlocal commentstring=--\ %s

" SimpylFold
" let g:SimpylFold_fold_import = 0

" Easymotion
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" CtrlP
let g:ctrlp_cmd = 'CtrlPMRUFiles'

" Tagbar
nnoremap <Leader>tt :TagbarToggle<CR>
nnoremap <silent> <F9> :TagbarToggle<CR>

" NerdTree/NerdTreeTabs Settings
let g:NERDTreeWinPos = "left"
nnoremap <Leader>nn :NERDTreeTabsToggle<cr>
nnoremap <F8> :NERDTreeTabsToggle<cr>
" nnoremap <F8> :NERDTreeToggle<cr>

" Turn off annoying ALE default sign column for c++11
let g:ale_linters = {'cpp': ['g++']}
let g:ale_lint_on_text_changed = 'normal'
let g:ale_cpp_clang_options = '  -std=c++11'
" let g:ale_lint_delay

" YouCompleteMe config
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0

" Disable auto-pair
let g:AutoPairs={}

" Disable bufexplorer
let g:bufexplorer_version = "disabled"

" Find cscope
let cscope_file=findfile(".cscope.out", ".;")
if !empty(cscope_file) && filereadable(cscope_file)
    exe "cs add" cscope_file 
    source ~/.vim_runtime/my_plugins/cscope.vim
endif

" current line function info in python
nnoremap <C-g>f :echo cfi#format("%s", "")<CR>

" vim python-mode
let g:pymode_python = 'python3'
" let g:pymode_virtualenv = "/home/damon/anaconda2"
" let g:pymode_lint_checkers = ["pylint", ]
let g:pymode_lint_ignore = ["E501", "E111", "E114"]
let g:pymode_options_colorcolumn = 0

" Ack.vim
cnoreabbrev Ack Ack!
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
let g:ack_mappings = { "o": "<CR><C-W>j", "h": "h" }

" python function list helper
command! ShowFunc :lvim /def\ ./ %<cr>:lopen<cr>
command! ShowClass :lvim /^class\ ./ %<cr>:lopen<cr>
command! Ipdb :normal Oimport ipdb; ipdb.set_trace()  # XXX BREAKPOINT

" load my vim keymap
source ~/.vimrc.keymap

set secure

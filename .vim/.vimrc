noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <PageUp> <Nop>
noremap <PageDown> <Nop>
nmap <f7> :NERDTreeToggle<CR>

inoremap jk <esc>

filetype plugin indent on
syntax on
set encoding=utf-8
set clipboard=unnamedplus

set modelines=0
set number
set wildmenu
set autochdir

set runtimepath^=~/.vim/bundle/NERD_tree
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.m2\|public$|log\|tmp$\|node_modules\|target\|build\|\.idea',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$\|\.woff$\|\.svg$\|\.snap.js$\|\.png$\|\.ttf$\|\.woff$\|\.eot$\|\.jpg$'
  \ }
"let g:ctrlp_user_command = 'grep %s --color=never' 
"let g:ctrlp_user_command = 'find . -regex %s'

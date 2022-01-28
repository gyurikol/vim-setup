" enable plugins
"filetype on " enable file type detection
"filetype plugin on " load plugin for detected filetype
"filetype indent on " load indent file for detected filetype
syntax on " syntax highlighting

" TABS
set tabstop=4 " tab space-width
set softtabstop=0 " non-zero ill make tab key insert spaces to simulate tab stops
set expandtab " replace tab with spaces
set shiftwidth=4 " when tab is pressed the length of movement
set smarttab " insert spaces or tabs to go to tehe next indent

" show relative numbers on sidebar
set relativenumber

" show ruler information on bottom
set ruler

" highlight search
set hlsearch
hi Search ctermbg=LightYellow
hi Search ctermfg=Red

" diff colors
highlight DiffAdd    cterm=bold ctermfg=10  ctermbg=29  gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=9   ctermbg=1   gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=101 ctermbg=100 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=11  ctermbg=130 gui=none guifg=bg guibg=Red

" first run in console
"    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" then run :PlugInstall in vim
" ---- PLUGINS ------- ( install with :PlugInstall ) -----------------------------------------
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
:nnoremap <C-g> :NERDTreeToggle<CR>

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }
let g:go_fmt_command = "goimports" " Run goimports along gofmt on each save     
let g:go_auto_type_info = 1 " Automatically get signature/type info for object under cursor  
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

Plug 'vim-airline/vim-airline', { 'tag': '*' }
let g:airline_powerline_fonts = 1 " Allow powerline fonts

Plug 'tpope/vim-fugitive', { 'tag': '*' }

Plug 'maxmellon/vim-jsx-pretty', { 'tag': '*' }

Plug 'davidhalter/jedi-vim', { 'tag': '*' }

Plug 'ryanoasis/vim-devicons', { 'tag': '*' }
set encoding=UTF-8
set guifont=DroidSansMono\ Nerd\ Font\ 11

" Initialize plugin system
call plug#end()

" ---- AUTO-COMPLETE -------------------------------------------------------------------------
set completeopt+=noselect " dont select a word on initially attempting autocomplete

" language autocomplete mapping
au filetype go inoremap <buffer> . .<C-x><C-o>


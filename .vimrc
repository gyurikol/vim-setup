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

" show tab characters in vim editor
set list
set listchars=tab:>-

" highlight search
set hlsearch
hi Search ctermbg=LightYellow
hi Search ctermfg=Red

" first run in console
"    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" then run :PlugInstall in vim
" ---- PLUGINS ------- ( install with :PlugInstall ) -----------------------------------------
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'vim-airline/vim-airline', { 'tag': '*' }
Plug 'tpope/vim-fugitive', { 'tag': '*' }
Plug 'ciaranm/detectindent', { 'tag': '*' }
Plug 'maxmellon/vim-jsx-pretty', { 'tag': '*' }

" Initialize plugin system
call plug#end()

" ---- AUTO-COMPLETE -------------------------------------------------------------------------
set completeopt+=noselect " dont select a word on initially attempting autocomplete

" language autocomplete mapping
au filetype go inoremap <buffer> . .<C-x><C-o>

" ---- NERDTree ------------------------------------------------------------------------------
:nnoremap <C-g> :NERDTreeToggle<CR>

" ---- VIM-AIRLINE ---------------------------------------------------------------------------
let g:airline_powerline_fonts = 1 " Allow powerline fonts

" ---- VIM GO --------------------------------------------------------------------------------
let g:go_fmt_command = "goimports" " Run goimports along gofmt on each save     
let g:go_auto_type_info = 1 " Automatically get signature/type info for object under cursor  

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" ---- DETECT-INDENTATION --------------------------------------------------------------------
:autocmd BufReadPost * :DetectIndent " detect indentation on load



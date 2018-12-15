" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" List here the plugins with Plug commands
" Shorthand notations can be used, as well as any valid GIT URLs
" Make sure you use single quotes
" See all possible ways to list a plugin: https://github.com/junegunn/vim-plug
" Ex: Plug 'https://github.com/username/reponame.git'

" Typescrript syntax support
Plug 'https://github.com/leafgarland/typescript-vim'

" Template strings syntax support
" FIXME: throws E488 trailing characters error when opening .ts files
Plug 'https://github.com/Quramy/vim-js-pretty-template'

" Javascript syntax highlighting
Plug 'https://github.com/pangloss/vim-javascript'

" Async execution library for Vim
Plug 'https://github.com/Shougo/vimproc.vim', {'do' : 'make'}

" TS features plugin
Plug 'https://github.com/Quramy/tsuquyomi'

" Automatic completion suggestions
Plug 'https://github.com/Valloric/YouCompleteMe'

" .editorconfig support
Plug 'https://github.com/editorconfig/editorconfig-vim'

" Syntastic plugin
Plug 'https://github.com/vim-syntastic/syntastic'

" Auto pairs plugin
Plug 'https://github.com/jiangmiao/auto-pairs'

" Angular CLI plugin
" Use :Ng command in Vim
Plug 'https://github.com/bdauria/angular-cli.vim'

" Initialize the plugin system
call plug#end() 

" Load the configuration for the template strings syntax support in the TS files
" autocmd FileType typescript JsPreTmpl html
" autocmd FileType typescript syn clear foldBraces

" Enable displaying TS compilation errors in the QuickFix window
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Disable VIM Scratch Preview Window included at the top of the editted files
" See also: https://stackoverflow.com/questions/3105307/how-do-you-automatically-remove-the-preview-window-after-autocompletion-in-vim
set completeopt-=preview

" Syntastic syntax highlighting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] 


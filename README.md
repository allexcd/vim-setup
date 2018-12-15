# Vim for Angular/VueJS/Dart development (MAC Setup)

## 1. Install `vim-plug` as a plugin manager

`vim-plug` advantages:
- installs each plugin in its own directory
- includes commands for plugin installation/update/removal: [See the list of commands here](https://github.com/junegunn/vim-plug)
- parallel installation/update of plugins
- faster than `Vundle`

`vim-plug` installation:

* Run this command in terminal
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
* Create the `.vimrc` file in your local dir, if there's none yet

```
touch ~/.vimrc
```

* Open the `.vimrc` file and paste:

```
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" List here the plugins with Plug commands
" Shorthand notations can be used, as well as any valid GIT URLs
" Make sure you use single quotes
" See all possible ways to list a plugin: https://github.com/junegunn/vim-plug
" Ex: Plug 'https://github.com/username/reponame.git'

" Initialize the plugin system
call plug#end()
```

## 2. Install typescript

```
npm install -g typescript
```

## 3. Install `typescript-vim` plugin to enable typescript syntax support

* Open `~/.vimrc` file
* Add `Plug 'https://github.com/leafgarland/typescript-vim'` before `call plug#end()`
* Also add the following lines after `call plug#end()` to enable the plugin to display compilation errors in the QuickFix window:

```
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
```

* Open vim and type `:PlugInstall`
* Open a `.ts` file with vim: `vim someFile.ts`
* Run `:make` while editing a TypeScript file to execute the `tsc` compiler and display errors in the QuickFix window:

## 4. Install `vim-js-pretty-template` plugin to enable template strings syntax support

* Open `~/.vimrc` file
* Add `Plug https://github.com/Quramy/vim-js-pretty-template`
* Add the following lines at the end of the file:

```
autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces
```
* Open vim and type `:PlugInstall`

FIXME: throws E488 trailing characters error when opening `.ts` files

## 5. Install `vim-javascript` plugin to enable javascript syntax highlighting

* Open `~/.vimrc` file
* Add `Plug https://github.com/pangloss/vim-javascripte`
* Open vim and type `:PlugInstall`

## 6. Install TSUQUYOMI to bring IDE like features to VIM

* Open `~/.vimrc` file
* Add `Plug 'https://github.com/Shougo/vimproc.vim', {'do' : 'make'}`
* Add `Plug 'https://github.com/Quramy/tsuquyomi'`
* Open vim and type `:PlugInstall`

## 7. Install YouCompleteMe plugin to to get completion suggestions automatically while typing
* Open `~.vimrc` file
* Add `Plug 'https://github.com/Valloric/YouCompleteMe'`
* Open vim and type `:PlugInstall`

### If you're in Mojave and you get an error like:

```
line    4:
Exception MemoryError: MemoryError() in <module 'threading' from '/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/threading.pyc'> ignored
Segmentation fault: 11
```
do the following:

* `brew install vim --with-lua --with-override-system-vi`
* Restart terminal 
* See comments: 
    * [Valloric/YouCompleteMe#3165 (comment)](https://github.com/Valloric/YouCompleteMe/issues/3165#issuecomment-425616700)
    * [Solution 2](https://github.com/powerline/powerline/issues/1947#issuecomment-441884283)

### 8. Syntax checking
* Open `~/.vimrc`
* Add `Plug 'https://github.com/vim-syntastic/syntastic'`
* Add the following lines at the end of the file:

```
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] 
```
* Open vim and type `:PlugInstall`

## 9. Other plugins
* Add `Plugin 'https://github.com/editorconfig/editorconfig-vim'`
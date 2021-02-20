# My Neovim Config

This is my [Neovim](https://neovim.io/) setting for Python development on MacOS.

## Install

### Neovim

The easiet way to install neovim is [Homebrew](https://brew.sh/). Other options are [here](https://github.com/neovim/neovim/wiki/Installing-Neovim).

```bash
brew install neovim
```

### vim-plug

Vim itself is not very useful.
We need more plugins for Vim.
There are many options for installing vim plugin, but [vim-plug](https://github.com/junegunn/vim-plug) is simplest.

The install directory is different with Vim and Neovim.
You can read [this](https://github.com/junegunn/vim-plug#neovim) for Neovim.

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
### init.vim

`init.vim` is the configuration file of Neovim.
It has different path with Vim.
The config path of Neovim is `~/.config/nvim/init.vim`
If you can't find this file, make it manually.

```bash
mkdir ~/.config/nvim/
touch ~/.config/nvim/init.vim
```

### How to install plugin in Neovim using `vim-plug`

If you want to intall [Nerdtree](https://github.com/preservim/nerdtree), you should write the URL of the repository in `init.vim` file.
It looks like below.

```vim
call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
call plug#end()
```

This is vim script, and you should write your plugin between `call plug#begin()` and `call plug#end()`.
Then open Neovim, write command `:PlugInstall`.

```
:PlugInstall
```

This is how it works. There are another commands for `vim-plug` [here](https://github.com/junegunn/vim-plug#commands).

## Plugin

I introduce some useful plugins with my taste.
You can select some of them. But don't install every plugin without understading what they do for you. There are so many vim plugins, many people just installed it. Install one of them carefully watching the difference with before and after the plugin. It's like enjoyful shopping.

### Nerdtree

The [NERDTree](https://github.com/preservim/nerdtree) is a file system explorer. 
It makes visual file tree in the Vim editor.
The NERDTree has no short cuts originally.
It recomemends some shortcuts to add on `init.vim` like blow.

```vim
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
```

This script adds shortcuts, for example `<C-n>` means `Ctrl-n` and it toggles the file tree on the editor.

### commentary.vim

This is the Vim plugin artist, Tim Pope's [commentary.vim](https://github.com/tpope/vim-commentary).
Just use `gcc` to comment out some codes.
I used to do `visual-block mode` when I commented out without `commentary.vim`. Absolutely, this is much easier.

### vim-polyglot

[vim-polyglot](https://github.com/sheerun/vim-polyglot) brings better systax highlighting than basic Vim not only for Python.
Enable all syntax highlighting features you can add the following command to `init.vim`.

```vim
let g:python_highlight_all = 1
```

### onedark.vim

[onedark.vim](https://github.com/joshdick/onedark.vim) is one of popular color scheme for Vim editor, and my favorite.
With installation, set color scheme on `init.vim`.

```vim
syntax on
colorscheme onedark
```

### vim-airline

[vim-airline](https://github.com/vim-airline/vim-airline) offers a nice status line on the bottome of vim windows.
It has its own theme plugin, [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes).
This theme plugin has to be installed too.

vim-airline can use `onedark` theme that was installed above.
Set `airline_powerline_fonts = 1` to use powerline symbols on `init.vim`.

```vim
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1
```

### ALE

[ALE (Asynchronous Lint Engine)](https://github.com/dense-analysis/ale) is a manager for all kinds of linter and fixer(sometimes called formatter).
It's not a linter or fixer itself, but it controls how the specific linters and fixers behave.
You can choose which linter or fixer is applied to your editor.

I use `flake8` and `pylint` as my linter. 
```vim
" ale linters
let g:ale_linters = {'python': ['flake8', 'pylint']}
```

And `yapf` is the fixer.
```vim
" ale fixers
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['yapf'],
\}
```

ALE is very powerful, but it has a lot of options.
You should read the doc for this plugin.
There are some options for me below.

```vim
" ale - fix files when you save them.
let g:ale_fix_on_save = 1

" ale - kinder message
" [flake8] E302: expected 2 blank lines, found 1 [E]
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" ale - keep the sign gutter open at all times
let g:ale_sign_column_always = 1

" ale - load pylint plugins
let g:ale_python_pylint_options = '--load-plugins pylint_flask pylint_flask_sqlalchemy'

" ale - moving between warnings and errors quickly
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
```

[pylint](https://www.pylint.org/) is sometimes too strict.
You need to set `pylintrc` configuration file to control it or use plugins for `pylint`.
`let g:alie_python_pylint_options` is available on `init.vim` to load specific `pylint` plugin to `ALE`.
I usually load `pylint_flask` and `pylint_flaks_sqlalchemy` plugin on `init.vim`.
There are so many people frustrated by too kind `pylint`, so you can find every kinds of `pylint` plugin. 


### Tmux Plugin Manager
https://github.com/tmux-plugins/tpm

### Tmux Themepack
https://github.com/jimeh/tmux-themepack

### Tmux truecolor
```bash
curl -s https://raw.githubusercontent.com/JohnMorales/dotfiles/master/colors/24-bit-color.sh | bash
```

### mosh color problem
```
brew install mosh --HEAD
```

#### Compiling from Git

```bash
git clone https://github.com/mobile-shell/mosh
cd mosh
./autogen.sh
./configure
make
make install
```

### omyzsh

### powerlevel10k

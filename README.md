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

### pylintrc

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

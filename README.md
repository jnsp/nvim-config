# nvim-config

This is my [Neovim](https://neovim.io/) setting for Python development on MacOS.

## Install

### Neovim

The easiet way to install neovim is [Homebrew](https://brew.sh/). Other options are [here](https://github.com/neovim/neovim/wiki/Installing-Neovim).

```bash
brew install neovim
```

### vim-plug

Vim itself is not very useful.
We need more plug-ins for Vim.
There are many options for installing vim plug-in, but [vim-plug](https://github.com/junegunn/vim-plug) is simplest.

The install directory is different with Vim and Neovim.
You can read [this](https://github.com/junegunn/vim-plug#neovim) for Neovim.

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
### init.vim

`init.vim` is the configuration file of Neovim.
It has different path with Vim.
If you can't find this file, make it manually.

```bash
mkdir ~/.config/nvim/
touch ~/.config/nvim/init.vim
```

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

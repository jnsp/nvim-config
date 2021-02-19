# nvim-config

This is my neovim setting for Python development on MacOS.

## Install

### neovim

The easiet way to install neovim is [Homebrew](https://brew.sh/). Other options are [here](https://github.com/neovim/neovim/wiki/Installing-Neovim).

```bash
brew install neovim
```

### vim-plug

Vim itself is not very useful. We need more plug-ins for Vim. There are many options for installing vim plug-in, but vim-plug is most recommended.

https://github.com/junegunn/vim-plug

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
### init.vim

mkdir ~/.config/nvim/

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

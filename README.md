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

This script adds shortcuts, for example `<C-n>` means <kbd>ctrl</kbd>-<kbd>n</kbd> and it toggles the file tree on the editor.

### commentary.vim

This is the Vim plugin artist, Tim Pope's [commentary.vim](https://github.com/tpope/vim-commentary).
Just use <kbd>gcc</kbd> to comment out some codes.
I used to do `visual-block mode` when I commented out without `commentary.vim`. Absolutely, this is much easier.

[Tim Pope](https://twitter.com/tpope) did really great jobs for vim users.
You can look around his jobs [here](https://github.com/tpope).

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

For example, You can fix your file everytime you save it.

```vim
" ale - fix files when you save them.
let g:ale_fix_on_save = 1
```

You can use different linters at the same time, but it is sometimes confusing which one is warning.
You need kinder messages from your linters.

```vim
" ale - kinder message
" [flake8] E302: expected 2 blank lines, found 1 [E]
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
```

Linters make new space to specify the position of warning or error in your code.
It could be annoying flashing the gutter space.
You need to fix the gutter space all the time.

```vim
" ale - keep the sign gutter open at all times
let g:ale_sign_column_always = 1
```

[pylint](https://www.pylint.org/) is sometimes too strict.
You need to set `pylintrc` configuration file to control it or use plugins for `pylint`.
`let g:alie_python_pylint_options` is available on `init.vim` to load specific `pylint` plugin to `ALE`.
I usually load `pylint_flask` and `pylint_flaks_sqlalchemy` plugin on `init.vim`.
There are so many people frustrated by too kind `pylint`, so you can find every kinds of `pylint` plugin you need.

``` vim
" ale - load pylint plugins
let g:ale_python_pylint_options = '--load-plugins pylint_flask pylint_flask_sqlalchemy'
```

You need to move the cursor quickly between warnings and errors by `ctrl-j` and `ctrl-k`.

```vim
" ale - moving between warnings and errors quickly
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
```

### Etc.

Line numbers will be displayed with `set number` on `init.vim`.
And a vertical line for PEP8 with `set colorcolumn=79`.

```vim
set number
set colorcolumn=79
```

When you search some keywords in vim, the search highlight never disappear until you command `:noh`.
You can make shourtcuts to clear the hightlight by pressing <kbd>esc</kbd>-<kbd>esc</kbd> or <kbd>ctrl</kbd>-<kbd>l</kbd>.

```vim
nnoremap <esc><esc> :noh<cr>
nnoremap <C-L> :noh<cr>
```

## tmux

[tmux](https://github.com/tmux/tmux/wiki) is not about Vim.
But if you do something with terminal, tmux is your best friend to split the window.

### tmux plugin manager

tmux also has a lot of plugin.
You need a [plugin manager](https://github.com/tmux-plugins/tpm) to install them.

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Don't forget to make a tmux configuration file, `~/.tmux.conf` like below.
Note that `tmux-plugins/tpm` and `tmux-plugins/tmux-sensible` is mendatory to use the tmux plugin manager.


```bash
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'git@github.com:user/plugin'
# set -g @plugin 'git@bitbucket.com:user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```

It's easy to install new plugin.

1. Add new plugin to `~/.tmux.conf` with `set -g @plugin '<PLUGIN>'`
2. Press `prefix` + <kbd>I</kbd> (capital i, as in **I**nstall) to fetch the plugin.

### tmux themepack

The first reason I installed the tmux plugin manager is [tmux themepack](https://github.com/jimeh/tmux-themepack) to be out of the green status bar of tmux.
You have diffenrent options for color, not just ugly green [here](https://github.com/jimeh/tmux-themepack#themes). I chose gray.

```bash
set -g @plugin 'jimeh/tmux-themepack'
set -g @themepack 'powerline/default/gray'
```

## True color issue

When you use some colorthemes for Vim or tmux, you would face the true color issue in terminal.
You can test your truecolor environment with this script.

```bash
curl -s https://raw.githubusercontent.com/JohnMorales/dotfiles/master/colors/24-bit-color.sh | bash
```

If you can see the beatiful gradation of colors, you're able to use true color in your Vim editor.

Although you have true color environment, you could have some problem with color.
Then, add some extra setting like below on `init.vim`.
I copied this code from [onedark.vim install part](https://github.com/joshdick/onedark.vim#installation). Be sure to read `tmux`-related notes in the firs few line.

```vim
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
```

### Mosh

Truecolor issue is also related with [Mosh](https://mosh.org/).
When you connect to a server with mosh, open tmux, and code in Vim, the coloring is twisted so much.

Fortunately, complicated issues are almost resolved. But tricky thing is you should install the latest version of Mosh. (This is written in 2021-02-21.)

Install latest mosh on Mac with Homebrew.

```bash
brew install mosh --HEAD
```

Or you can compile from git
```bash
git clone https://github.com/mobile-shell/mosh
cd mosh
./autogen.sh
./configure
make
make install
```

In my case, I have no problem in coloring of Vim editor through mosh and tmux after installing of the latest mosh.
If you can't solve the problem, just go with 256 color setting with mosh.

### powerlevel10k

### Softlink

```bash
ln -s ~/.config/nvim/init.vim ~/projects/nvim-config/init.vim
```

## References

I got a help to configure my nvim settings by some excellent articles.

* https://www.vimfromscratch.com/articles/vim-for-python/
* https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/
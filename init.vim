call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'tpope/vim-commentary'
  Plug 'joshdick/onedark.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'sheerun/vim-polyglot'
  Plug 'dense-analysis/ale'
call plug#end()

" nerdtree shortcuts
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" ale - linters
let g:ale_linters = {'python': ['flake8', 'pylint']}
" let g:ale_python_pylint_options = '--disable=redefined-outer-name'

" ale - fixers
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['yapf'],
\}

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

" onedark theme
syntax on
colorscheme onedark

" vim-airline theme
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1

" vim-polyglot
let g:python_highlight_all = 1

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"if (empty($TMUX))
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
"endif

set number
set colorcolumn=79

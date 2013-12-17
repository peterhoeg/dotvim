call plug#begin('~/.vim/bundle')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'bling/vim-airline'
Plug 'mbbill/undotree'
Plug 'jnurmine/Zenburn'
Plug 'vim-scripts/camelcasemotion'
call plug#end()

let mapleader=","

set encoding=utf-8

" Theme
set t_Co=256
try
  colors zenburn
catch /^Vim\%((\a\+)\)\=:E185/
  " deal with it
endtry

function Defaults()

  " Ctrl-P
  if exists(':CtrlP')
    map <leader>t :CtrlP<CR>
    map <leader>b :CtrlPBuffer<CR>
  endif

  " Rainbow
  if exists(':RainbowParenthesesToggle')
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
  endif

endfunction

autocmd VimEnter * call Defaults()

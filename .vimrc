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

" General settings
set relativenumber
set number
set cm=blowfish


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

function! CloseWindowOrKillBuffer() "{{{
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))
  " never bdelete a nerd tree
  if matchstr(expand("%"), 'NERD') == 'NERD'
    wincmd c
    return
  endif
  if number_of_windows_to_this_buffer > 1
    wincmd c
  else
    bdelete
  endif
endfunction "}}}

nnoremap <silent> Q :call CloseWindowOrKillBuffer()<cr>

autocmd VimEnter * call Defaults()

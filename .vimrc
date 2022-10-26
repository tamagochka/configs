set nowrap
colo delek
syntax on
set tabstop=4
set shiftwidth=4
set smarttab
set smartindent
set expandtab
set cursorline
hi CursorLine cterm=NONE ctermbg=0
set incsearch
set ignorecase
set hlsearch
set number
set rnu
imap [ []<LEFT>
imap ( ()<LEFT>
imap { {}<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{%encoding}\ %b\ 0x%B\ %l,%c%V\ %P
set showcmd


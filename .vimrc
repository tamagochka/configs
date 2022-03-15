set nowrap
colo evening
syntax on
set tabstop=4
set shiftwidth=4
set smarttab
set smartindent
set expandtab
set cursorline
hi CursorLine cterm=NONE ctermbg=4
hi statusline guifg=black guibg=black ctermfg=black ctermbg=white
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
set statusline=%<%f%h%m%r%=%b\ 0x%B\ %l,%c%V\ format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %P
set laststatus=2
set showcmd


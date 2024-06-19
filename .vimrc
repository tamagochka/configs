set encoding=utf-8          " кодировка по умолчанию
set number                  " выводить номера строк
set nowrap                  " не переносить длинные строки
colorscheme orbital         " цветовая схема
syntax on                   " подсветка синтаксиса
set tabstop=4               " к-во пробелов, которыми отображается tab в тексте
set softtabstop=4           " к-во пробелов, которые добавляются после нажатия tab
set shiftwidth=4
set smarttab                " добавит shiftwidth пробелов в начале строки при нажатии tab
set smartindent             " копировать отступ с предыдущей строки
set expandtab               " заменяет tab на пробелы
set autoindent              " добавлять отступ в нужных местах, например после {
set cursorline              " выделять строку на которой находится курсор
set incsearch
set ignorecase              " игнорировать регистр при поиске
set hlsearch                " подсвечивать результаты поиска
set shortmess-=S            " показывать к-во найденных совпадений при поиске
" убрать подсветку после поиска:
noremap <esc> :noh<return><esc>  
imap [ []<LEFT>
imap ( ()<LEFT>
imap { {}<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
set statusline=%F%h%m%r\ -\ fmt:%{&fileformat}\ flv:%{&fileencoding}\ enc:%{&encoding}%=dec:%-4b\ hex:0x%-4B\ col:%-5crow:%-5ltotal:%-5L\ %-3P
set laststatus=2


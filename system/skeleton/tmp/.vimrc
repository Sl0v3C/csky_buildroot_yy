set go=
set guifont=Courier_New:h10:cANSI
autocmd InsertLeave * se nocul 
autocmd InsertEnter * se cul
set showcmd
set novisualbell
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set laststatus=1
set foldenable
set foldmethod=manual 
set nocompatible
set helplang=cn
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set syntax=on
set backspace=2
set autoindent
set cindent
set number
set ignorecase
set hlsearch
set langmenu=zh_CN.UTF-8
set helplang=cn

filetype on
filetype plugin on
filetype indent on

set fillchars=vert:\ ,stl:\ ,stlnc:\
set showmatch

let Tlist_Sort_Type = "name"    
let Tlist_Use_Right_Window = 1  
let Tlist_Compart_Format = 1    
let Tlist_Exist_OnlyWindow = 1  
let Tlist_File_Fold_Auto_Close = 0
let Tlist_Enable_Fold_Column = 0    
"autocmd FileType java set tags+=
"autocmd FileType h,cpp,cc,c set tags+=  
set tags=tags  

"autocmd BufNewFile *.py *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"
"func SetTitle()
"    if &filetype == 'sh' 
"        call setline(1,"\#########################################################################") 
"        call append(line("."), "\# File Name: ".expand("%")) 
"        call append(line(".")+1, "\# Author: Sl0v3C")
"        call append(line(".")+2, "\# mail: pyy8510@163.com")
"        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
"        call append(line(".")+4, "\#########################################################################")
"        call append(line(".")+5, "\#!/bin/bash")
"        call append(line(".")+6, "") 
"    if &filetype == 'py'
"        call setline(1,"\'''#########################################################################") 
"        call append(line("."), " File Name: ".expand("%")) 
"        call append(line(".")+1, " Author: Sl0v3C")
"        call append(line(".")+2, " Mail: pyy8510@163.com")
"        call append(line(".")+3, " Created Time: ".strftime("%c"))
"        call append(line(".")+4, "\########################################################################'''")
"        call append(line(".")+5, "\#!/usr/bin/python")
"        call append(line(".")+6, "") 
"    endif
"    autocmd BufNewFile * normal G
"endfunc    

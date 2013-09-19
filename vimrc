version 5.x
map <Right> <Space>
set showmatch incsearch wrapmargin=4
set ttytype=ansi
" set term=builtin_beos-ansi
set background=light
syntax on

hi Comment		term=bold		ctermfg=Blue		guifg=LightBlue 
hi Constant		term=underline	ctermfg=Green		guifg=Green		gui=underline 
hi Identifier	term=underline	ctermfg=DarkCyan	guifg=DarkCyan 
hi Statement	term=bold		ctermfg=Magenta		guifg=Brown		gui=bold
hi PreProc		term=underline	ctermfg=Magenta		guifg=Purple 
hi Type			term=underline	ctermfg=DarkGreen	guifg=SeaGreen	gui=bold 
hi Special		term=bold		ctermfg=DarkBlue	guifg=SlateBlue	gui=underline 

hi Comment      cterm=NONE
hi Constant     cterm=NONE
hi Identifier   cterm=NONE
hi Statement    cterm=NONE
hi PreProc      cterm=NONE
hi Type         cterm=NONE
hi Special      cterm=NONE

set backspace=2

set scrolloff=2
set whichwrap=<,>,[,] 
set autoindent
set background=dark
set fileformat=dos
set formatoptions=tcq2
set mouse=a
set ruler
set shiftwidth=4
set smartindent
set tabstop=4
set textmode
set textwidth=78
  
hi Normal guibg=black
hi Normal guifg=gray80

" Mappings

map z 0
map m $

set cindent

autocmd Filetype gitcommit setlocal spell textwidth=72

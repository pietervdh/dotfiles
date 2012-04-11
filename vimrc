set nocompatible          " get rid of Vi compatibility mode. SET FIRST!
call pathogen#infect()
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
colorscheme desert        " set colorscheme
set number                " show line numbers
set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ruler                 " Always show info along bottom.
set autoindent            " auto-indent
set tabstop=4             " tab spacing
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set noexpandtab           " use tabs instead of spaces
set wrap linebreak textwidth=0    " wrap text
set showcmd		" show commands in the lower right corner as they are typed
set scrolloff=10	" keep some offset from the bottom when working at the end of a file

set autowrite		" autosave before building
autocmd Filetype cpp setlocal makeprg=bjam	" use bjam as make cmd
autocmd Filetype python setlocal makeprg=python\ %

let NERDTreeIgnore=['^bin$', '\~$']

map <leader>n :NERDTreeToggle<CR>
" change the path to the currently active buffer's file
nmap <silent> <leader>cd :lcd %:h<CR>

"underline current line with =
nmap <silent> <leader>ul :t.\|s/./=/g\|:nohls<CR>

" comment line
map <leader>/ <plug>NERDCommenterToggle<CR> 
imap <leader>/ <Esc><plug>NERDCommenterToggle<CR>


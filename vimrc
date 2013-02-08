set nocompatible          " get rid of Vi compatibility mode. SET FIRST!
filetype off

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'Syntastic' 
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'xolox/vim-easytags'
Bundle 'derekwyatt/vim-protodef'

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end
"

filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
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


set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,.git,.svn

set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

" long line, jump to next 'soft' line i.s.o. next line
nnoremap j gj
nnoremap k gk


set autowrite		" autosave before building
autocmd Filetype cpp setlocal makeprg=bjam	" use bjam as make cmd
autocmd Filetype python setlocal makeprg=python\ %

let NERDTreeIgnore=['^bin$', '\~$']
let NERDTreeShowBookmarks=1

map <leader>n :NERDTreeToggle<CR>
" change the path to the currently active buffer's file
nmap <silent> <leader>cd :lcd %:h<CR>

"underline current line with =
nmap <silent> <leader>ul :t.\|s/./=/g\|:nohls<CR>

" look for tags file in current dir, keep going up till root
set tags=./tags;/
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
let g:easytags_dynamic_files = 1

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Command-shift-b : build with 'Test' option
nmap <silent> <D-B> :make Test<CR>
" Build 'silently', make will only give output when error occurs
noremap <leader>m :silent! :make \| :redraw! \| :botright :cw<cr>
" build single file (so no linking is done) (command-option-b) (insert mode, dan ctrl-v (visualise) en dan typen om te zien wat een toetsencombo is)
nmap <silent> <D-∫> :!~/.vim/bin/buildCurrentFile.sh %:p $PWD<CR> 

cmap w!! w !sudo tee % >/dev/null

nmap <silent> <leader>t :CtrlP /Volumes/work/code/adhese_tags/release-20121116-old-ui-compatible/<CR>
" Omnicompletion
set ofu=syntaxcomplete#Complete

" set list listchars=tab:▸\ ,trail:⋅,nbsp:⋅

" first attempt at my own vim function, switch header/source with tag
function! SwitchHeaderSource()
	let oldExt = fnamemodify(expand("%:t"), ":e")
	let newExt = oldExt
	if (oldExt == "cpp" || oldExt == "c") 
		let newExt = "h"
	elseif (oldExt == "h")
		let newExt = "cpp"
	endif
	let baseName = substitute(expand("%:t"), oldExt, newExt, "")
	exe 'tag ' .baseName
endfunction

nmap <silent> <leader>h :call SwitchHeaderSource()<CR>

" ctags -R --c++-kinds=+p --fields=+iaS --extra=+qf .
"
" au FileType {c,cpp} au BufWritePost <buffer> silent ! [ -e tags ] && ( awk -F'\t' '$2\!="%:gs/'/'\''/"{print}' tags ; ctags -f- '%:gs/'/'\''/' ) | sort -t$'\t' -k1,1 -o tags.new && mv tags.new tags

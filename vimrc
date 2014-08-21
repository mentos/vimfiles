set nocompatible                "Use Vim defaults instead of Vi compatibility

execute pathogen#infect()
execute pathogen#helptags()
syntax on

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

set background=dark               "Use `dark` or `light` as your background
set number                        "Display numbers
set guifont=Droid\ Sans\ Mono\ 9  "Set font family and size
set nowrap                        "Do not wrap lines
set guioptions-=T                 "Remove top toolbar
set guioptions-=r                 "Remove right hand scroll bar
set go-=L                         "Remove left hand scroll bar
set cursorline                    "Highlight current line
set gcr=a:blinkon0                "Disable cursor blink
set visualbell                    "No sounds
set autoread                      "Reload files changed outside vim

set expandtab                     "Use spaces for tab at insert mode
set shiftwidth=2                  "How many columns text is indented with the reindent operations
set softtabstop=2                 "Duh?
set tabstop=2                     "How many columns a tab counts for

set history=1000                  "Keep 150 lines of command line history
set ruler                         "Show the cursor position all the time
set showcmd                       "Display incomplete commands
set incsearch                     "Do incremental searching
set ignorecase                    "Make searches case-insensitive.
set smartcase                     "Unless there is a capital letter

colorscheme mango

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
"set colorcolumn=0              "Disable max chars column

filetype on                     "Enable filetype detection
filetype indent on              "Enable filetype-specific indenting
filetype plugin on              "Enable filetype-specific plugins
filetype indent plugin on


set omnifunc=syntaxcomplete#Complete

" Keep undo history across sessions by storing in file.
if has('persistent_undo')
  silent !mkdir ~/.vim/tmp/backups > /dev/null 2>&1
  set undodir=~/.vim/tmp/backups//
  set undofile
endif

" Every time you open a git object using fugitive it creates a new buffer. 
" This means that your buffer listing can quickly become swamped with 
" fugitive buffers. This prevents this from becomming an issue:
autocmd BufReadPost fugitive://* set bufhidden=delete

" save swaps in fixed directories
set directory=~/.vim/tmp/swap//,/var/tmp//,/tmp//

" autocmd vimenter * NERDTree   "Autostarts NERDTree
autocmd VimEnter * wincmd p   "Focus on current window
let g:NERDTreeWinSize=30      "Set size
let g:NERDTreeWinPos="left"   "Set position
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" Toggle NERDTree with F2
map <F2> :NERDTreeToggle<CR>  

" Set autocomplete colors
":highlight Pmenu guibg=black guifg=lightmagenta

" auto-source .vimrc upon save
if has("autocmd")
  autocmd! bufwritepost .vimrc source $MYVIMRC
endif

" autoclose ruby blocks with end
imap <S-CR>    <CR><CR>end<Esc>-cc

set statusline=%t 
set statusline+=%{rvm#statusline()}  
set statusline+=%{fugitive#statusline()}\    
set statusline+=%=
set statusline+=[%{strlen(&fenc)?&fenc:&enc}]
set statusline+=\ [line\ %l\/%L]          

"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"show the error list automatically
let g:syntastic_auto_loc_list=0
"don't care about warnings
"let g:syntastic_quiet_warnings=0

runtime macros/matchit.vim

let mapleader=","
" RSpec.vim mappings
let g:RspecKeymap=0
map <Leader>t :call RunSpec()<CR>
map <Leader>s :call RunSpecLine()<CR>
map <Leader>a :call RunSpecs()<CR>

" Do not lose cursor position when splitting
nnoremap <C-W>s Hmx`` \|:split<CR>`xzt``

" Little hack to fix the split/scroll problem 
tabnew
bwipeout

" Start ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

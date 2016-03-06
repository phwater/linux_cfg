" phwater's vimrc - <midsummereddy@gmail.com>
" Fork me on github : https://github.com/phwater/vimrc

"-------------------------------------------------------------------------------
" => Filetype & Syntax
"-------------------------------------------------------------------------------
filetype plugin on
filetype indent on
syntax enable
syntax on

"> Set language
let $LANG='en'    "set message language
set langmenu=en   "set menu's language of gvim. no spaces beside '='

"> help language
"set helplang=cn

"-------------------------------------------------------------------------------
" => Motions, search, patterns
"-------------------------------------------------------------------------------
"> move the cursor left/right to move to the previous/next line
set whichwrap+=<,>

"> search settings
set wrapscan
set incsearch

"> search ignore case
set ignorecase
set smartcase

"> set to auto read when a file is changed from the outside
set autoread

"> backup settings
set nobackup
"set backupext=.bak
"set patchmode=.orig

"> viminfo
set viminfo='10,\"100,:20,%,n~/.vim/viminfo

"-------------------------------------------------------------------------------
" => Display, message info
"-------------------------------------------------------------------------------
"set scrolloff=7

"> wrap long lines
set wrap

"> commandbar height
set cmdheight=1

"> list chars
set list
set listchars=tab:\>\ ,

"> show line number
set number
"set rnu

"> hightlight search matches
set hlsearch

"> highlight the screen column/line of the cursor
"set cursorline
"set cursorcolumn

set shortmess=aToO

"> show input cmd
set showcmd

"> display the current mode in the status line
set showmode
set ruler

"> show matching bracets
set showmatch

"-------------------------------------------------------------------------------
" => Selecting & Editing
"-------------------------------------------------------------------------------
"set paste

"> 'unnamed' to use the * register like unnamed register
"> 'unnamedplus' to use the + register like unnamed register
"> 'autoselect' to always put selected text on the clipboard
set clipboard+=unnamed

"> Specifies what <BS>, CTRL-W, etc. can do in Insert mode
set backspace=eol,start,indent

"> auto code complete
"set completeopt=longest,menu

"> 'alpha', 'octal' and/or 'hex'; number formats recognized for CTRL-A
"> and CTRL-X commands (local to buffer)
"set nrformats=octal,hex

"> insert 4 space instead of <Tab>, use <C-T> to add <Tab> in insert mode
set expandtab

"> number of spaces a <Tab> in the text stands for
set tabstop=4
"> number of spaces used for each step of (auto) indent
set shiftwidth=4
"> if non-zero, number of spaces to insert for a <Tab>
set softtabstop=4

"> indent
set autoindent
set smartindent
set cindent
set cinoptions=g0,:0

"-------------------------------------------------------------------------------
" => Windows & Tab pages
"-------------------------------------------------------------------------------
"> status line
set laststatus=2
set statusline=\ %<%f%h%m%r%w%=\ %y[%{&fileformat}][%{&encoding}]\ 0x%B\ %l/%L,%c%V\ %p%%

"> tab line
set showtabline=1
"set tabpagemax=10

"> confirm window
set confirm

"> command line settings
set history=400
set wildmenu
set wildignorecase

"-------------------------------------------------------------------------------
" => Mouse
"-------------------------------------------------------------------------------
set mouse=a
set mousefocus
set mousehide

"-------------------------------------------------------------------------------
" => Multi-byte characters
"-------------------------------------------------------------------------------
set encoding=utf-8
set fileencoding=utf-8

"-------------------------------------------------------------------------------
" => Terminal settings
"-------------------------------------------------------------------------------
set t_Co=256
"set t_ti= t_te=

"-------------------------------------------------------------------------------
" => Ctags & cscope
"-------------------------------------------------------------------------------
"> ctags
set tags=tags;

"> cscope
if has("cscope")
    set cscopeprg=/usr/local/bin/cscope
    set cscopetagorder=0
    set cscopetag

    set nocsverb
    " add any database in current directory
    if filereadable(".projrc/cscope/cscope.out")
        cs add .projrc/cscope/cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb

    set cscopequickfix=s-,c-,d-,i-,t-,e-,g-

"> The following maps all invoke one of the following cscope search types:
">    's'   symbol: find all references to the token under cursor
">    'g'   global: find global definition(s) of the token under cursor
">    'c'   calls:  find all calls to the function name under cursor
">    't'   text:   find all instances of the text under cursor
">    'e'   egrep:  egrep search for the word under cursor
">    'f'   file:   open the filename under cursor
">    'i'   includes: find files that include the filename under cursor
">    'd'   called: find functions that function under cursor calls
    nnoremap <silent> <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR><BAR>:belowright copen<CR>
    nnoremap <silent> <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR><BAR>:belowright copen<CR>
    nnoremap <silent> <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR><BAR>:belowright copen<CR>
    nnoremap <silent> <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR><BAR>:belowright copen<CR>
    nnoremap <silent> <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR><BAR>:belowright copen<CR>
    nnoremap <silent> <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR><BAR>:belowright copen<CR>
    nnoremap <silent> <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<<CR>BAR>:belowright copen<CR>
    nnoremap <silent> <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR><BAR>:belowright copen<CR>

endif

"-------------------------------------------------------------------------------
" => Mapping
"-------------------------------------------------------------------------------
"> select file content
nnoremap <silent> <C-A> ggvG$

"> remove trailing spaces
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"> copy filename to clipboard
nnoremap <silent> <F6> :let @+=expand("%:p")<CR>

"> copy/paste with system clipboard
vnoremap <silent> <F7> "+y
nnoremap <silent> <F8> "+p
vnoremap <silent> <F8> "+p
inoremap <silent> <F8> <C-R><C-O>+

"> allow saving of files as sudo when permission denied
cnoremap w!! w !sudo tee > /dev/null %

"> Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>


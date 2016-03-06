" phwater's vimrc - <midsummereddy@gmail.com>
" Fork me on github : https://github.com/phwater/vimrc

"------------------------------------------------------------------------------
" Vundle to manage Plugin
"   :PluginList       - lists configured Plugins
"   :PluginInstall    - installs Plugins
"   :PluginUpdate     - update Plugins
"   :PluginSearch foo - searches for foo; append `!` to refresh local cache
"   :PluginClean      - confirms removal of unused Plugins
"------------------------------------------------------------------------------
"> required!
if (0 != &compatible)
    set nocompatible
endif
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"> let Vundle manage Vundle, required!
Plugin 'VundleVim/Vundle.vim'

"> Plugins
Plugin 'bling/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/syntastic'
"Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-surround'
Plugin 'Yggdroot/indentLine'
Plugin 'bufexplorer.zip'

"> required
call vundle#end()
filetype plugin indent on
"> To ignore plugin indent changes, instead use:
"filetype plugin on

"-------------------------------------------------------------------------------
"            ===>    NOTE: Following is Plugin configuration    <===
"
"   1. NERDTree
"   2. NERDCommenter
"   3. Tagbar
"   4. airline
"   5. ctrl-p
"   6. easy-motion
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" 1. NERDTree - explore filesystem & open files/directories
"-------------------------------------------------------------------------------
let g:NERDTreeBookmarksFile= expand('$HOME/.vim/NERDTreeBookmarks')

function! PHOpenNERDTreeCustom() abort
    if !empty(expand("%:p"))
        if !g:NERDTree.IsOpen()
            exec 'NERDTreeFind'
        else
            exec 'NERDTreeClose'
        endif
    else
        exec 'NERDTree'
    endif
endfunction

nnoremap <silent> <F3> :call PHOpenNERDTreeCustom()<CR>

"-------------------------------------------------------------------------------
" 2. NERDCommenter - for comment (Use default keymap)
"-------------------------------------------------------------------------------
" Usage :    use '<Leader>cX' to trigger
"
"   Mapping  | Details
"   ---------|--------------------------------------------------------------
"   cc       | Comment out the current line or text selected in visual mode.
"   cu       | Uncomments the selected line(s).
"   c<Space> | Toggles the comment state of the selected line(s).
"   ci       | Toggles the comment state of the selected line(s) individually.
"   cm       | Comments using only one set of multipart delimiters.
"   cy       | Comments out the selected lines 'sexily'
"   c$       | Comments the current line from the cursor to the end of line.
"   cA       | Adds comment delimiters to the end of line and goes into
"            | insert mode between them.
"   ca       | Switches to the alternative set of delimiters.
"   cn       | Same as |<Leader>|cc but forces nesting.
"   cl,cb    | Same as |NERDComComment| except that the delimiters are aligned
"            | down the left side (|<Leader>|cl) or both sides (|<Leader>|cb).
"-------------------------------------------------------------------------------
map <Leader>cc <Plug>NERDCommenterComment
map <Leader>cu <Plug>NERDCommenterUncomment
map <Leader>c<space> <Plug>NERDCommenterToggle
map <Leader>ci <Plug>NERDCommenterInvert
map <Leader>cm <Plug>NERDCommenterMinimal
map <Leader>cs <Plug>NERDCommenterSexy
map <Leader>cy <Plug>NERDCommenterYank
map <Leader>c$ <Plug>NERDCommenterToEOL
map <Leader>cA <Plug>NERDCommenterAppend
map <Leader>ca <Plug>NERDCommenterAltDelims
map <Leader>cn <Plug>NERDCommenterNested
map <Leader>cl <Plug>NERDCommenterAlignLeft
map <Leader>cb <Plug>NERDCommenterAlignBoth

"-------------------------------------------------------------------------------
" 3. Tagbar - display tags
"-------------------------------------------------------------------------------
function! TagbarStatusFunc(current, sort, fname, flags, ...) abort
    let colour=a:current ? '%#StatusLine#' : '%#StatusLineNC#'
    let flagstr=join(a:flags, '')
    if flagstr != ''
        let flagstr='[' . flagstr . '] '
    endif
    return colour . '[' . a:sort . '] ' . flagstr . a:fname
endfunction
let g:tagbar_status_func='TagbarStatusFunc'

let g:tagbar_sort=0
let g:tagbar_iconchars=['+', '-']

nnoremap <silent> <F4> :TagbarToggle<CR>

"-------------------------------------------------------------------------------
" 4. Airline - status line
"-------------------------------------------------------------------------------
set t_Co=256
"> change default display
function! PHAirlineInit()
    "let g:airline_section_a = airline#section#create_left(['mode', 'crypt', 'paste', 'capslock', 'iminsert'])
    "let g:airline_section_b = airline#section#create(['hunks', 'branch'])
    "let g:airline_section_c = airline#section#create(['%<', 'file', spc, 'readonly'])
    "let g:airline_section_x = airline#section#create_right(['tagbar', 'filetype'])
    "let g:airline_section_y = airline#section#create_right(['ffenc'])
    let g:airline_section_z = airline#section#create(['windowswap', '0x%B %l/%L,%c%V %p%%'])
endfunction
autocmd User AirlineAfterInit call PHAirlineInit()
"> the separator used on the left/right side
let g:airline_left_sep=''
let g:airline_right_sep=''
"> enable/disable detection
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline_detect_iminsert=0
"> determine whether inactive windows should have the left section
"> collapsed to only the filename of that buffer.
let g:airline_inactive_collapse=1
"> themes are automatically selected based on the matching
"> colorscheme. this can be overridden by defining a value.
let g:airline_theme='phwater'

"-------------------------------------------------------------------------------
" 5. CtrlP - file finder
"-------------------------------------------------------------------------------
" Usage :    use '<Ctrl>P' to open
"
" <F5>         - purge the cache for the current directory to get new
"                files, remove deleted files and apply new ignore options
" <C-F>, <C-B> - cycle between modes
" <C-D>        - switch to filename only search instead of full path
" <C-R>        - switch regexp mode
" <C-J>, <C-K> - navigate the result list (also can use arrow keys)
" <C-T>        - open the selected entry in a new tab
" <C-V>, <C-X> - open the selected entry in a new split
" <C-N>, <C-P> - select the next/previous string in the prompt's history
" <C-Y>        - create a new file and its parent directories.
" <C-Z>        - mark/unmark multiple files and <C-O> to open them.
" 2|2+ dots    - go up the directory tree by one or multiple levels
"-------------------------------------------------------------------------------
let g:ctrlp_map = '<C-P>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/out/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

"-------------------------------------------------------------------------------
" 6. easymotion - use motions
"-------------------------------------------------------------------------------
" Usage :    use '<Leader><Leader>XX' to trigger
"
"   Default Mapping   | Details
"   ------------------|----------------------------------------------
"   <Leader>f{char}   | Find {char} to the right. See |f|.
"   <Leader>F{char}   | Find {char} to the left. See |F|.
"   <Leader>t{char}   | Till before the {char} to the right. See |t|.
"   <Leader>T{char}   | Till after the {char} to the left. See |T|.
"   <Leader>w         | Beginning of word forward. See |w|.
"   <Leader>W         | Beginning of WORD forward. See |W|.
"   <Leader>b         | Beginning of word backward. See |b|.
"   <Leader>B         | Beginning of WORD backward. See |B|.
"   <Leader>e         | End of word forward. See |e|.
"   <Leader>E         | End of WORD forward. See |E|.
"   <Leader>ge        | End of word backward. See |ge|.
"   <Leader>gE        | End of WORD backward. See |gE|.
"   <Leader>j         | Line downward. See |j|.
"   <Leader>k         | Line upward. See |k|.
"   <Leader>n         | Jump to latest '/' or '?' forward. See |n|.
"   <Leader>N         | Jump to latest '/' or '?' backward. See |N|.
"   <Leader>s         | Find(Search) {char} forward and backward.
"                     | See |f| and |F|.
"-------------------------------------------------------------------------------

"> Map '/' for search
"noremap  / <Plug>(easymotion-sn)
"onoremap / <Plug>(easymotion-tn)
"noremap  n <Plug>(easymotion-next)
"noremap  N <Plug>(easymotion-prev)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

"-------------------------------------------------------------------------------
" 7. vim-surround
"-------------------------------------------------------------------------------
" Use for parentheses, brackets, quotes, XML tags, and more
" More on https://github.com/tpope/vim-surround
"
"   cs'<q>  |    'Hello world!'         ==>     <q>Hello world!</q>
"   cst'    |    <q>Hello world!</q>    ==>     'Hello world!'
"   ds'     |    'Hello world!'         ==>     Hello world!

"-------------------------------------------------------------------------------
" 8. syntastic
"-------------------------------------------------------------------------------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_enable_signs = 0

"-------------------------------------------------------------------------------
" 9. fugitive
"-------------------------------------------------------------------------------


"-------------------------------------------------------------------------------
" 10. BufExplorer
"-------------------------------------------------------------------------------
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.

nnoremap <silent> <Leader>be :BufExplorer<CR>
nnoremap <silent> <Leader>bh :BufExplorerHorizontalSplit<CR>
nnoremap <silent> <Leader>bv :BufExplorerVerticalSplit<CR>

"-------------------------------------------------------------------------------
" 10. IndentLine
"-------------------------------------------------------------------------------
let g:indentLine_color_tty_light=5    " (default: 4)
let g:indentLine_color_dark=6         " (default: 2)



" phwater's vimrc - <midsummereddy@gmail.com>
" Fork me on github : https://github.com/phwater/vimrc

function! _phwater_getSystemType()
    if has('win32')
        return 'windows'
    elseif has('unix')
        let s:uname = system('uname -s')
        if s:uname =~ 'Darwin'
            return 'mac'
        elseif s:uname =~ 'Linux'
            return 'linux'
        endif
    else
        return 'unknown'
    endif
endfunction

function! _phwater_switchToBuf(filename)
    "let fullfn = substitute(a:filename, "^\\~/", $HOME . "/", "")
    " find in current tab
    let bufwinnr = bufwinnr(a:filename)
    if bufwinnr != -1
        exec bufwinnr . "wincmd w"
        return
    else
        " find in each tab
        tabfirst
        let tab = 1
        while tab <= tabpagenr("$")
            let bufwinnr = bufwinnr(a:filename)
            if bufwinnr != -1
                exec "normal " . tab . "gt"
                exec bufwinnr . "wincmd w"
                return
            endif
            tabnext
            let tab = tab + 1
        endwhile
        " not exist, new tab
        exec "tabnew " . a:filename
    endif
endfunction

function! _phwater_removeTrailWS()
    let _s = @/
    exec "normal mz"
    %s/\s\+$//ge
    let @/ = _s
    nohl
    exec "normal `z"
endfunction

function! _phwater_findProjrc()
    " Todo
endfunction

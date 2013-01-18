" Vim plugin for highlight patterns which read from a file
" Maintainer:  Tokikazu Ohya <ohya@art.plala.or.jp>
" Last Change: 2013 Jan 15
"
" Usage:
"   :HlLoad <pattern file>
"
" File Format:
" %<color>
" [pattern]
" [pattern]
" [...]
"
" %<color>
" [pattern]
" [...]
"
" color is one of following items:
"   Red, Green, Blue, Yellow, Magenta, Gray, Unobtrusive
"
" Example:
"   %Red
"   Foo
"   Bar
"
"   %DarkBlue
"   ^.*Not interestd.*$

function! s:HighlightPattern(fname) abort
    let l:fg = 'Red'
    for line in readfile(a:fname)
        if (line =~ '^#' || line =~ '^$')
            continue
        endif

        if (line =~ '^%')
            if (line !~ '^%%')
                let l:fg = substitute(line, "^.", "", "")
                continue
            endif
            let line = substitute(line, "^%%", "%", "")
        endif

        execute "syn match highlight" . l:fg . " \"" . line . "\""

    endfor

    hi def link highlightRed             RedBold
    hi def link highlightGreen           GreenBold
    hi def link highlightBlue            BlueBold
    hi def link highlightYellow          YellowBold
    hi def link highlightCyan            CyanBold
    hi def link highlightMagenta         MagentaBold
    hi def link highlightGray            GrayBold

    hi def link highlightDarkRed         DarkRed
    hi def link highlightDarkGreen       DarkGreen
    hi def link highlightDarkBlue        DarkBlue
    hi def link highlightDarkYellow      DarkYellow
    hi def link highlightDarkCyan        DarkCyan
    hi def link highlightDarkMagenta     DarkMagenta
    hi def link highlightDarkGray        DarkGray
endfunction

command! -nargs=1 -complete=file HlLoad call s:HighlightPattern(<q-args>)

function! s:HighlightTime() abort
    let lnum = 1
    while line <= getline(lnum)
        call s:HighlightProcLine(line)
        let lnum = lnum + 1
    endwhile
endfunction

function! s:HighlightProcLine(line) abort
    if a:line !~ "^\d\d-\d\d \d\d:\d\d:\d\d"
    endif

    if b:last_line ==# a:line
        return
    endif
    b:last_line = a:line
endfunction


function! s:Highlight(fname) abort
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

        echo "syn keyword highlight" . l:fg . " " . line
        "execute "syn keyword highlight" . l:fg . " " . line
        execute "syn match highlight" . l:fg . " \"" . line . "\""

    endfor
    hi def link highlightRed         RedBoldText
    hi def link highlightGreen       GreenBoldText
    hi def link highlightBlue        BlueBoldText
    hi def link highlightYellow      YellowBoldText
    hi def link highlightCyan        CyanBoldText
    hi def link highlightMagenta     MagentaBoldText
    hi def link highlightGray        GrayBoldText
    hi def link highlightUnobtrusive UnobtrusiveText
endfunction

command! -nargs=1 -complete=file HlLoad call s:Highlight(<q-args>)

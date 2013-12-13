" Vim plugin for highlight patterns which read from a file
" Maintainer:  Tokikazu Ohya <ohya@art.plala.or.jp>
" Last Change: 2013 Dec 13
"==============================================================================
" Usage:
"   :HlLoad <pattern file>
"
" File Format:
" # comment line
" %<style-list>
" [pattern]
" [pattern]
" [...]
"
" %<style-list>
" [pattern]
" [...]
"
" Keywords:
" style-list = style, { style }
" style = attribute | foreground-color | background-color
" attribute = "bold" | "underline" | "undercurl" | "reverse" | "inverse" | "italic" | "standout"
" foreground-color = color
" background-color = "!", color
" color = color-name | color-RGB
" color-name =
"         "White" | "Red" | "Green" | "Blue" | "Yellow" | "Cyan" | "Magenta" | "Gray" |
"         "DarkRed" | "DarkGreen" | "DarkBlue" | "DarkYellow" | "DarkCyan" | "DarkMagenta" | "DarkGray"
" color-RGB = "#", hexadecimal-numbers
"
" NOTE:
"  - color-RGB is only for GUI.
"  - if a pattern starts %, use %% instead of %.
"
" Example File:
"   %Red
"   Foo
"   Bar
"
"   %green,!cyan,bold
"   Hoge
"
"   %DarkBlue
"   ^.*Not interested line.*$
"==============================================================================

" Attributes definition
let s:attr_list = [ 'bold', 'underline', 'undercurl', 'reverse', 'inverse', 'italic', 'standout' ]

" Colors definition
let s:color_list = [
        \ 'Red', 'Green', 'Blue', 'Yellow', 'Cyan', 'Magenta', 'Gray',
        \ 'DarkRed', 'DarkGreen', 'DarkBlue', 'DarkYellow', 'DarkCyan', 'DarkMagenta', 'DarkGray',
        \ 'White' ]

"------------------------------------------------------------------------------
" PRIVATE FUNCTION: define a highlight group
"  - param : style list
"  - retrun: defined highlight group-name
" This is a private function.
"------------------------------------------------------------------------------
function! s:HighlightDefineStyle(argv) abort
    let l:fg = ''
    let l:bg = ''
    let l:attr = ''

    " process arguments
    for item in a:argv
        " attribute
        let l:idx = match(s:attr_list, item . '\c')
        if l:idx >= 0
            let l:attr = s:attr_list[l:idx]
            continue
        endif

        " background?
        let l:isBG = 0
        if item =~# '!.\+'
            let l:isBG = 1
            let item = strpart(item, 1)
        endif

        " color
        let l:idx = match(s:color_list, item . '\c')
        if l:idx >= 0
            let l:color = s:color_list[l:idx]
        elseif item =~# '#\x\{6}'  " RGB
            let l:color = item
        else " error
            echoerr "unknown keyword: " . item
            return -1
        endif

        if l:isBG != 1
            let l:fg = l:color
        else
            let l:bg = l:color
        endif
    endfor

    " construct a syntax command
    let l:term_str = ''
    let l:fg_str = ''
    let l:bg_str = ''

    if l:attr != ''
        let l:term_str = 'term=' . l:attr . ' cterm=' . l:attr . ' gui=' . l:attr
    endif

    if l:fg != ''
        if l:fg !~# '#\x\{6}'  " Not RGB
            let l:fg_str = 'ctermfg=' . l:fg . ' guifg=' . l:fg
        else
            let l:fg_str = ' guifg=' . l:fg
            let l:fg = strpart(l:fg, 1)
        endif
    endif

    if l:bg != ''
        if l:bg !~# '#\x\{6}'  " Not RGB
            let l:bg_str = 'ctermbg=' . l:bg . ' guibg=' . l:bg
        else
            let l:bg_str = ' guibg=' . l:bg
            let l:bg = strpart(l:bg, 1)
        endif
        let l:bg = 'On' . l:bg
    endif
    
    " make highlight group-name
    let l:name = "highlight" . l:fg . l:bg . l:attr

    " execute highlight command
    let l:hi_cmd = l:name . ' ' . l:term_str . ' ' . l:fg_str . ' ' . l:bg_str
    execute 'hi ' . l:hi_cmd
    
    " return an added highlight group-name
    return l:name
endfunction

"------------------------------------------------------------------------------
" PRIVATE FUNCTION: highlight patterns
"  - param : pattern file
"  - retrun: none
" Proccess a pattern file.
"------------------------------------------------------------------------------
function! s:HighlightPattern(fname) abort

    " process each line.
    for line in readfile(a:fname)
        " skip comment or empty line.
        if (line =~ '^#' || line =~ '^$')
            continue
        endif

        " process a style list which starts '%'.
        if (line =~ '^%')
            if (line !~ '^%%')
                " make a List of styles
                let l:argv = split(strpart(line, 1), ',')
                " add a highlight group
                let l:name = s:HighlightDefineStyle(l:argv)
                continue
            endif
            " replace % by %%.
            let line = substitute(line, "^%%", "%", "")
        endif

        " add a syntax with current highlight group
        execute 'syn match ' . l:name . ' "' . line . '"'
    endfor
endfunction

"------------------------------------------------------------------------------
" GLOBAL FUNCTION: find and apply the pattern
"  - param : file name
"  - retrun: none
" Searches a pattern file upwards until finds it, then apply.
"------------------------------------------------------------------------------
function! HighlightFindAndApply(fname) abort
    let l:keywords_path = findfile(a:fname, ".;")
    if (l:keywords_path != "")
        call s:HighlightPattern(l:keywords_path)
    else
        " echo "No such file: " a:fname
    endif
endfunction

"------------------------------------------------------------------------------
" COMMAND: Load highlight pattern file
" Usage:
"     HlLoad <pattern file>
"------------------------------------------------------------------------------
command! -nargs=1 -complete=file HlLoad call s:HighlightPattern(<q-args>)

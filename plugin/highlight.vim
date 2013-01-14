" 追加のハイライト定義
" - 目立たせないテキスト
"hi UnobtrusiveText ctermfg=darkblue guifg=DarkBlue

hi RedBoldText term=bold cterm=bold ctermfg=Red guifg=Red
hi GreenBoldText term=bold cterm=bold ctermfg=Green guifg=Green
hi YellowBoldText term=bold cterm=bold ctermfg=Yellow guifg=Yellow

function! s:Highlight(fname) abort
    let l:fg = 'Red'
    for line in readfile(a:fname)
        if (line =~ '^#' || line =~ '^$')
        elseif line =~ '^%'
            if line ==? '%Red'
                echo ">r"
                let l:fg = 'Red'
            elseif line ==? '%Green'
                echo ">g"
                let l:fg = 'Green'
            elseif line ==? '%Yellow'
                echo ">y"
                let l:fg = 'Yellow'
            endif
        else
            echo "syn keyword highlight" . l:fg . " " . line
            execute "syn keyword highlight" . l:fg . " " . line
        endif
    endfor
    hi def link highlightRed RedBoldText
    hi def link highlightGreen GreenBoldText
    hi def link highlightYellow YellowBoldText
endfunction

command! -nargs=1 Hi call s:Highlight(<q-args>)

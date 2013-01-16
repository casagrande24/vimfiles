if did_filetype()	" 既にファイル形式が決定している時は
  finish		    " このチェックは行わない
endif

let save_cursor = getpos(".")
call cursor(1, 1)

" Android の logcat ファイル形式
if (search('\<[DEIVW]/\i\+ *( *\d\+):', 'cn', 10, 500))
    setfiletype logcat
endif

call setpos('.', save_cursor)

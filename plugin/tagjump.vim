"==============================================================================
" タグジャンプ関連
"==============================================================================
" タグファイル名のリスト
set tags=./tags,tags;

" <F11><F12> で前/次のタグに移動
nmap <F11> :tp<CR>
nmap <F12> :tn<CR>

" GNU GLOBAL 用マップ (マーク G を使う)
"nmap <C-k> :GtagsCursor<CR>
"nmap <C-n> :cn<CR>
"nmap <C-p> :cp<CR>
"nmap <C-n> :lnext<CR>
"nmap <C-p> :lprevious<CR>
nmap <C-L>r :Rtag<CR>
cab gt Gtags
cab gb normal `G
"cab gc GtagsCursor

" taglist プラグイン設定
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Close_On_Select=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_One_File=1
let Tlist_Ctags_Cmd='ctags'
let Tlist_WinWidth = 40

function! s:ReverseTagJump(...) abort
    let l:pattern = (a:0 > 0) ? a:1 : expand("<cword>")
    try
        let l:save_tags = &tags
        set tags=RTAGS
        execute "ltag " . l:pattern
        lwindow
    catch
        echo "Rtag:" . v:exception
    finally
        let &tags = l:save_tags
    endtry
endfunction

command! -nargs=? Rtag call s:ReverseTagJump(<f-args>)

" vim:filetype=vim

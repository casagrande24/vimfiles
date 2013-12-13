"============================================================================
" Android logcat 関連
"============================================================================
" 最終検索パターン用レジスタにエラー系のキーワードをセットしておく。
" ファイルを開いた直後にコマンド "n" で検索できる。
let @/ = '\%(Exception\|Error\|Throwable\)\c'

" ディレクトリを遡ってハイライト定義ファイルを探し、適用する。
autocmd BufWinEnter <buffer> call HighlightFindAndApply("logcat_keywords.txt")

" vim:filetype=vim

"============================================================================
" Vim 設定
"============================================================================
set nocompatible
filetype off

" internationalization settings
source $DOTVIM/rc/i18n

" vundle setting
source $DOTVIM/rc/vundle

" general settings
source $DOTVIM/rc/general

" platform specific settings
source $DOTVIM/rc/platform

source $DOTVIM/rc/term

" % による対応括弧へのカーソル移動機能を強化
source $VIMRUNTIME/macros/matchit.vim

filetype plugin indent on

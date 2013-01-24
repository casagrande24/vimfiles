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

filetype plugin indent on

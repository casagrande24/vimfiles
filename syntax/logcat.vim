" Language:		Android log file
" Maintainer:	Tokikazu Ohya <ohya@art.plala.or.jp>
" Last Change:	Jan 15, 2013
" Version:		0.1
" URL:	https://github.com/casagrande24/vimfiles

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match	logcatTime	"^\d\d-\d\d \d\d:\d\d:\d\d\.\d\d\d:\? "

syn case ignore
syn keyword	logcatError	Error Exception Throwable

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_drchip_tags_inits")
  if version < 508
    let did_logcat_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink logcatTime	Gray
  HiLink logcatError	ErrorMsg

  delcommand HiLink
endif

let b:current_syntax = "logcat"

" vim: ts=12

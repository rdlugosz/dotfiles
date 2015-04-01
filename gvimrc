set transparency=0
set guioptions=aAce "hide the toolbar

" Mac OS X-only mappings
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin\n"
    silent! set guifont=Menlo:h14
    if has("gui_macvim")
      set guifont=Menlo:h14
    endif

    " Automatically resize splits
    " when resizing MacVim window
    autocmd VimResized * wincmd =
  endif
endif

colorscheme base16-ocean

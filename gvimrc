set transparency=0
set guioptions=aAce "hide the toolbar

" Mac OS X-only mappings
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin\n"
    silent! set guifont=Sauce\ Code\ Powerline\ Plus\ Nerd\ File\ Types\ Mono\ Plus\ Pomicons:h12

    " Automatically resize splits
    " when resizing MacVim window
    autocmd VimResized * wincmd =
  endif
endif

colorscheme gruvbox

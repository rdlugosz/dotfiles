" Vim configuration. Thoroughly annotated for two reasons:
"   1. Hopefully this is helpful to others
"   2. I often can't remember why something is set is a certain way or what a
"   specific plugin provides!
"
" Note to future self: Git history was lost during a rename; you can see it by
" adding the `--follow` option to `git log`.
"
" Nice catalog of plugins lives at: http://vimawesome.com/
"
" Any questions, contact @lbwski
"
" FOLDING TIPS:
"   zi - toggle foldenable
"   zo - open a fold
"   zc - close a fold
"   za - toggle a fold
"   zR - open all folds
"   zM - close all folds

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible               " be iMproved
filetype off                   " required!

" vim-plug must be installed first...
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'



if exists(':Plug')
  " Repeat.vim sets up bindings other plugins can use to make their commands
  " repeatable with the . command.
  " https://github.com/tpope/vim-repeat
  Plug 'tpope/vim-repeat'

  " Fugitive is a highly-capable Git wrapper for Vim.
  " https://github.com/tpope/vim-fugitive
  Plug 'tpope/vim-fugitive'

  " Surround.vim lets you add/change/remove surrounding chars and tags
  " https://github.com/tpope/vim-surround
  Plug 'tpope/vim-surround'

  " Unimpaired.vim provides shortcuts for various paired activities:
  "
  " ex cmds: ]q is :cnext, [q is :cprevious. ]b is :bnext, [b is :bprev.
  " See the documentation for the full set of 20 mappings and mnemonics.
  " All of them take a count.
  "
  " lines: [<Space> and ]<Space> add newlines before and after the
  " cursor line. [e and ]e exchange the current line with the one above
  " or below it.
  "
  " toggling options: [os, ]os, and cos perform :set spell, :set
  " nospell, and :set invspell, respectively. There's also l (list), n
  " (number), w (wrap), x (cursorline cursorcolumn), and several others,
  " plus mappings to help alleviate the set paste dance. Consult the
  " documentation.
  "
  " misc: [f and ]f to go to the next/previous file in the directory,
  " and [n and ]n to jump between SCM conflict markers.
  "
  " https://github.com/tpope/vim-unimpaired
  Plug 'tpope/vim-unimpaired'

  " Commentary.vim provides commenting for many languages
  " Use gcc to comment out a line (takes a count), gc to comment out the
  " target of a motion (for example, gcap to comment out a paragraph),
  " gc in visual mode to comment out the selection, and gc in operator
  " pending mode to target a comment.
  " https://github.com/tpope/vim-commentary
  Plug 'tpope/vim-commentary'

  " Improves output of ga, which shows character codes for the char
  " under the cursor. Supports HTML entities & emoji...
  " https://github.com/tpope/vim-characterize
  Plug 'tpope/vim-characterize'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " A Vim plugin which shows a git diff in the gutter (sign column) and
  " stages/reverts hunks. Use [c and ]c to navigate changes.
  " https://github.com/airblade/vim-gitgutter
  Plug 'airblade/vim-gitgutter'

  " Flagship adds API hooks that can be used to set things in the statusline
  " https://github.com/tpope/vim-flagship
  " "Plug 'tpope/vim-flagship'

  " NERDTree is a tree explorer plugin for vim.
  " Open with <leader>n
  " https://github.com/scrooloose/nerdtree
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  " Add some Git hotness...
  "Plug 'Xuyuanp/nerdtree-git-plugin'

  " Vim-vinegar allows access to netrw via -
  " https://github.com/tpope/vim-vinegar
  Plug 'tpope/vim-vinegar'

  " EasyAlign makes it easy to align stuff...
  " https://github.com/junegunn/vim-easy-align
  Plug 'junegunn/vim-easy-align'

  " This allows you to select some text using Vim's visual mode and then hit *
  " and # to search for it elsewhere in the file.  For example, hit V, select
  " a strange sequence of characters like '$! $!', and hit star.  You'll find
  " all other runs of '$! $!' in the file.
  "
  " If you hit <leader>* ('\*' unless you changed the mapleader), vim will
  " recursively vimgrep for the word under the cursor or the visual selection.
  "
  " Vim's default behavior is to just extend the visual selection to the next
  " word that matches the word under the cursor. Doesn't seem very useful.
  " https://github.com/nelstrom/vim-visual-star-search
  "Plug 'nelstrom/vim-visual-star-search'

  " Vim global plugin for dragging virtual blocks. By Damien Conway.
  " Select text in Visual Block mode (ctrl-v), use arrow keys to move it around!
  " This isn't terribly useful; more of a fun hack to show off
  " https://github.com/rdlugosz/vim-dragvisuals
  "Plug 'rdlugosz/vim-dragvisuals'

  " Indent Guides is a plugin for visually displaying indent levels in Vim.
  " Toggle with <leader>ig
  " https://github.com/nathanaelkane/vim-indent-guides
  "Plug 'nathanaelkane/vim-indent-guides'

  " Provides extra text objects for things like pairs, quotes, separators and
  " arguments.
  "   Pairs      i( i) ib i{ i} iB i[ i] i< i> it
  "   Quotes     i' i" i`
  "   Separators i, i. i; i: i+ i- i= i~ i_ i* i# i/ i| i\ i& i$
  "   Argument   ia
  "   All also work with 'a' instead of 'i' (An vs In). Can also insert an 'n'
  "   or 'l' to target the 'next' object, e.g., vin]
  " https://github.com/wellle/targets.vim
  ""Plug 'wellle/targets.vim'

  " Creates a new text object 'i' for indentation. E.g.,
  "   vii will select block of text at current indent level
  "   vai will select block of text at current indent level, plus line above
  "   vaI selects block of text at current indent level, plus line above & below
  " http://www.vim.org/scripts/script.php?script_id=3037
  "Plug 'michaeljsmith/vim-indent-object'

  " Text objects for: lines (l) and entire file (e)
  " https://github.com/kana/vim-textobj-line
  "Plug 'kana/vim-textobj-line'
  "Plug 'kana/vim-textobj-entire'

  " Add a text object for Ruby blocks (ar / ir)
  " Depends on vim-textobj-user
  " https://github.com/nelstrom/vim-textobj-rubyblock
  "Plug 'kana/vim-textobj-user'
  "Plug 'nelstrom/vim-textobj-rubyblock'

  " Repeated `v` keystrokes will expand the selected region. Supports language
  " specific text objects; see configuration below in this file or the docs.
  " https://github.com/terryma/vim-expand-region
  "Plug 'terryma/vim-expand-region'

  " Easy navigation of the Rails directory structure. gf considers context and
  " knows about partials, fixtures, and much more. There are two commands, :A
  " (alternate) and :R (related) for easy jumping between files, including
  " favorites like model to schema, template to helper, and controller to
  " functional test. Commands like :Emodel, :Eview, :Econtroller, are provided
  " to :edit files by type, along with S, V, and T variants for :split,
  " :vsplit, and :tabedit. Throw a bang on the end (:Emodel foo!) to
  " automatically create the file with the standard boilerplate if it doesn't
  " exist. :help rails-navigation
  "
  " Also provides an interface to Rake and Rails commands via :Rake and :Rails
  "
  " https://github.com/tpope/vim-rails
  Plug 'tpope/vim-rails'
  " The Rake.vim plugin does the same thing for non-Rails projects.
  "Plug 'tpope/vim-rake'

  " endwise.vim: wisely add 'end' in ruby, endfunction/endif/more in vim
  " script, etc.
  " https://github.com/tpope/vim-endwise
  Plug 'tpope/vim-endwise'

  " Ragtag is a plugin that provides a variety of tag-completion mappings
  " rooted on C-x.
  " https://github.com/tpope/vim-ragtag
  Plug 'tpope/vim-ragtag'

  " Runs Ruby tests in a reasonably smart way.
  "   Run current test file <leader>r
  "   Run nearest test in file <leader>R
  " https://github.com/skalnik/vim-vroom
  "Plug 'skalnik/vim-vroom'

  " Execute ruby in-line with code; some mappings are set up below.
  "   <leader>m to insert an 'execute' mark
  "   <leader>x to execute
  " Depends on gem rcodetools.
  " https://github.com/t9md/vim-ruby-xmpfilter
  "Plug 't9md/vim-ruby-xmpfilter'

  " Searches Dash.app for the word under the cursor with <leader>d
  " https://github.com/rizzatti/dash.vim
  Plug 'rizzatti/dash.vim'

  " This is a dependency of Dash.vim
  Plug 'rizzatti/funcoo.vim'

  " Vim-Grepper
  " https://github.com/mhinz/vim-grepper
  Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

  " Simplifies the transition between multiline and single-line code
  "   gS to split a one-liner into multiple lines
  "   gJ (with the cursor on the first line of a block) to join a block into a
  "   single-line statement.
  " https://github.com/AndrewRadev/splitjoin.vim
  Plug 'AndrewRadev/splitjoin.vim'

  " SnipMate aims to provide support for textual snippets, similar to TextMate
  " or other Vim plugins. Activate by typing some text and hitting <tab>.
  " Snipmate depends on tlib and mw-utils.
  " https://github.com/garbas/vim-snipmate
  "Plug 'tomtom/tlib_vim'
  "Plug 'MarcWeber/vim-addon-mw-utils'
  "Plug 'garbas/vim-snipmate'
  "Plug 'honza/vim-snippets'

  " GoldenView - attempt to auto-resize splits in a reasonable way
  " https://github.com/zhaocai/GoldenView.Vim
  "Plug 'zhaocai/GoldenView.Vim'

  " Lols
  "Plug 'koron/nyancat-vim'

  " Language syntax support
  Plug 'vim-ruby/vim-ruby'
  Plug 'kchmck/vim-coffee-script'
  Plug 'pangloss/vim-javascript'
  Plug 'tpope/vim-markdown'
  Plug 'tpope/vim-git'
  Plug 'elixir-lang/vim-elixir'
  Plug 'chrisbra/csv.vim'
  Plug 'hail2u/vim-css3-syntax'
  Plug 'othree/html5.vim'
  Plug 'lifepillar/pgsql.vim'

  " In-line syntax testing
  " https://github.com/vim-syntastic/syntastic
  Plug 'vim-syntastic/syntastic'

  " Hooks a variety of language-specific code formatters onto the
  " gq command (via formatprog).
  " see: https://github.com/Chiel92/vim-autoformat
  "Plug 'Chiel92/vim-autoformat'

  " Colorschemes
  Plug 'icymind/NeoSolarized'
  Plug 'tpope/vim-vividchalk'
  Plug 'vim-scripts/Zenburn'
  Plug 'junegunn/seoul256.vim'
  Plug 'tomasr/molokai'
  Plug 'romainl/flattened'

  let g:gruvbox_italic=1
  " let g:gruvbox_improved_strings=1
  " let g:gruvbox_improved_warnings=1
  Plug 'morhetz/gruvbox'

  "Plug 'reedes/vim-colors-pencil'
  "Plug 'whatyouhide/vim-gotham'
  Plug 'mhartington/oceanic-next'

  " Plugins to only load on non-gui vims
  if !has('gui_running')
    " Make working with Vim within TMUX more consistent
    " https://github.com/christoomey/vim-tmux-navigator
    Plug 'christoomey/vim-tmux-navigator'
  endif
endif

" Initialize plugin system
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS {{{1
" tpope/vim-sensible is inlined here & used as a baseline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
  set synmaxcol=200
  autocmd BufWinEnter * if line2byte(line("$") + 1) > 100000 | syntax clear | endif
endif

set autoindent   " preserve indent level on newlines
set tabstop=2    " a tab is two spaces
set shiftwidth=2 " an autoindent (with <<) is two spaces
set shiftround   " when indenting with >, round to nearest multiple of shiftwidth
set expandtab    " use spaces, not tabs
set smarttab     " use shiftwidth/tabstop based on context

set backspace=indent,eol,start

set ttyfast      " assume we are on a fast terminal
set lazyredraw   " don't echo non-typed characters (e.g., macro execution)

" By default, complete is set to: complete=.,w,b,u,t,i
" The 'i' means 'included files' and can result in major slowdowns
" set complete-=i
set complete+=kspell "Autocomplete with dictionary when spell is set

" Don't assume numbers starting with zero are octal
set nrformats-=octal

set ttimeout
set ttimeoutlen=100

set incsearch     " incremental searching
set hlsearch      " highlight matches
set ignorecase    " searches are case insensitive...
set smartcase     " ... unless they contain at least one capital letter

set laststatus=2  " always show the status line
set ruler         " show cursor position (overridden by statusline)
set showcmd       " show partial command in bottom-right
set showtabline=1 " Show tabline only when more than one tab exists

set wildmenu      " use tab completion on command line

" Controls the number of lines/chars to keep visible before scrolling
set scrolloff=1
set sidescrolloff=5
set sidescroll=1
set display+=lastline " show the last line that fits in window (vs '@@@@')

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

" Changes what Vim displays for special chars like trailing space & tabs
set list " Show invisible characters
let &listchars = "tab:>-,trail:\u2591,extends:>,precedes:<"


" Include guard-derived gem tags in tags search
set tags+=gems.tags

" The semicolon will cause Vim to search back (up) in the directory tree
if has('path_extra')
  setglobal tags-=./tags tags^=./tags;
endif

set autoread           " reload unchanged buffers when file changed outside vim
set fileformats+=mac   " should already be the default when compiled on mac

set history=1000       " remember more than 20 previous searches/commands

set tabpagemax=50      " max number of tab pages that can be opened

" Control what is preserved in the viminfo file
"   ! save and restore all-caps-named GLOBAL variables
"   ' number of files for which we should remember marks
"   < maximum line count of a register that is saved
"   s maximum byte count of a register that is saved
"   h disable the hlsearch when loading viminfo
"   no '/' specified means use value of 'history' for saving searches
"   no ':' specified means use value of 'history' for command line history
"   no '%' specified means don't save/reload the buffer list
"   no 'n<file>' specified means use default location for .viminfo
set viminfo=!,'100,<1000,s100,h

set sessionoptions-=options " exclude options from the :mksession command

" Load matchit.vim, but only if the user hasn't installed a newer version.
" Makes the % command jump to matching HTML tags, if/else/endif in Vim scripts, etc.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif


" Enable 24-bit color support
if $COLORTERM == 'truecolor'
  " next two lines a fix for Vim going black & white in tmux
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  set termguicolors
  set background=dark
  colorscheme NeoSolarized
end


if $TERM_PROFILE =~ "solarized_dark"
  set background=dark
  colorscheme NeoSolarized
elseif $TERM_PROFILE == "solarized_light"
  set background=light
  colorscheme NeoSolarized
elseif $TERM_PROFILE == "gruvbox"
  colorscheme gruvbox
" else
  " silent! colorscheme disco
endif

if has("gui_vimr")
  colorscheme NeoSolarized
endif


" Write swap and backup files in the event of a crash or accident
set swapfile
set directory=$TMPDIR,~/tmp,~/.vim/tmp,/tmp,/var/tmp
set backup
set backupdir=$TMPDIR,~/tmp,~/.vim/tmp,/tmp,/var/tmp

" Extend our undoable steps and preserve over restart (if available)
if has('persistent_undo')
  set undodir=$TMPDIR,~/tmp,~/.vim/tmp,/tmp,/var/tmp
  set undofile
  set undoreload=10000
end
set undolevels=10000

" Keep our custom dictionary on Dropbox to sync across systems
set spelllang=en
set spellfile=$HOME/Dropbox/vim/en.utf-8.add

" Line numbering
" Relativenumber treats the current line as line 0 and is helpful for motions
if exists('+relativenumber')
  if !has('gui_running')
    " Disabling because syntax + relnum on MacVim is slow
    " see: https://github.com/vim/vim/issues/282
    set relativenumber
  end
end
" Setting number after Relativenumber replaces the '0' with the true number
set number

set nowrap        " don't wrap lines (we map leader-W to toggle)
set linebreak     " when wrapping, wrap at word boundaries (vs last char)
if exists('+breakindent')
  set breakindent " preserves the indent level of wrapped lines
  set wrap        " wrapping with breakindent is tolerable
endif
" When on first/last char in a line, allow left/right to navigate
" through to the prev/next line.
set whichwrap+=<,>,h,l

" cpoptions is a sequence of single-char flags that make Vim do different
" things. The $ flag enables showing a $ marker at the end boundary of cw
set cpoptions+=$

" allow modified buffers to be hidden
set hidden

" exclusions from the autocomplete menu
set wildignore+=*.so
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.gif,*.jpg,*.png,*.log
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
set wildignore+=*/public/assets/*
set wildignore+=*.swp,*~,._*
set wildignore+=.DS_Store

" mouse works in most terminal software we use...
set mouse=a

" change the cursor shape depending on mode
" see: http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Use par to reflow text
" see: http://vimcasts.org/episodes/formatting-text-with-par/
" Using `gw` will reflow with Vim's built-in algorithm.
if executable('par')
  set formatprg="par -h -w78 -B=.,\?_A_a "
endif

" Use The Silver Searcher if available
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Folding
set foldmethod=manual "note: some methods, esp 'syntax' cause major slowdowns
" Sets the fold level: Folds with a higher level will be closed.  Setting
" this option to zero will close all folds.  Higher numbers will close fewer
" folds.
" set foldlevel=1
" set foldnestmax=10
" set foldlevel=9
set nofoldenable

" Remember last location in file, but not for commit messages.
" see :help last-position-jump
augroup RD_LastLocation
  autocmd!
  autocmd BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN-RELATED CONFIG {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw
" <Ctrl-^> should go to the last file, not to netrw.
" This also means that using vim-vinegar won't clobber the alt file.
let g:netrw_altfile = 1

" vim-ruby
let ruby_operators             = 1
let ruby_space_errors          = 1
let ruby_fold                  = 1
let ruby_spellcheck_strings    = 1
let g:rubycomplete_rails       = 1
let g:rubycomplete_use_bundler = 1

" FZF config
" nnoremap <C-P> :Files<CR>
nnoremap <C-P> :FilesPreview<CR>
nnoremap <C-B> :Buffers<CR>
nnoremap <C-T> :Tags<CR>

" Files with preview
command! -bang -nargs=? -complete=dir FilesPreview
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Some useful commands from :help fzf
" :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
" :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
nnoremap <leader>f :Rg!<space>

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Vim EasyAlign.
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <leader>a <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <leader>a <Plug>(EasyAlign)

" Syntastic config
" See also in Statusline area
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0
" let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}

" PGSql language config
" Make default for all .SQL files
let g:sql_type_default = 'pgsql'


" vim-expand-region config
" vmap v <plug>(expand_region_expand)
" vmap u <plug>(expand_region_shrink)
" Use the global default + the following for ruby
" call expand_region#custom_text_objects('ruby', {
"       \ 'im' :0,
"       \ 'am' :0,
"       \ 'ir' :0,
"       \ 'ar' :0,
"       \ })
" call expand_region#custom_text_objects('eruby', {
"       \ 'it' :0,
"       \ 'at' :0,
"       \ })

" GoldenView config
"
" don't map C-l by default; we use that!
" let g:goldenview__enable_default_mapping = 0
" nnoremap <leader>v :ToggleGoldenViewAutoResize<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE {{{1
" see: :help 'statusline'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=                 " reset
set statusline+=%#identifier#   " set color
set statusline+=[               " open bracket char
set statusline+=%n              " buffer number
set statusline+=%H%M%R%W        " flags: Help, Modified, RO, Preview
set statusline+=]%*             " close bracket & reset color
set statusline+=./%f\           " relative path of the filename
set statusline+=%<              " cut from here if line is too long
set statusline+=%y              " Filetype flag (displays in brackets)

set statusline+=%=              " left/right separator (everything from here is pulled right)

" show various error states that may apply
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%{StatuslineTrailingSpaceWarning()}
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

" display a warning if fileformat isn't unix or encoding isn't utf-8
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'[ff:\ '.&ff.']':''}
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'[enc:\ '.&fenc.']':''}
set statusline+=%*

if (has('nvim') && !empty("~/.local/share/nvim/plugged/syntastic")) || (!has('nvim') && !empty("~/.vim/plugged/syntastic"))
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
endif

set statusline+=[tab:\ %{&expandtab==1?'soft':'HARD'}\ %{&ts}] " tab info

set statusline+=%{fugitive#statusline()} " git info

set statusline+=\ col\ %2c,      " cursor column
set statusline+=\ ln\ %3l/%L     " cursor line/total lines
set statusline+=\ (%P)           " percent through file

" recalculate the trailing whitespace & tab warning when idle and after saving
augroup RD_StatusUpdates
  autocmd!
  autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning
  autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning
augroup END

" via: https://github.com/scrooloose/vimfiles
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")

        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[trailing spaces]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction

" via: https://github.com/scrooloose/vimfiles
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        " find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&expandtab) || (tabs && &expandtab)
            let b:statusline_tab_warning = '[&expandtab wrong?]'
        endif
    endif
    return b:statusline_tab_warning
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick ESC
" Some people map jk for this, but it makes Dijkstra sad.
imap kj <ESC>

" make Y behave similarly to D and C
nnoremap Y y$

" Insert the Ruby hashrocket with CTRL+l
imap <c-l> <space>=><space>

" map j to gj and k to gk, so line navigation ignores line wrap
" ...but only if the count is undefined (otherwise, things like 4j
" break if wrapped LINES are present)
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
xnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
xnoremap <expr> k (v:count == 0 ? 'gk' : 'k')

" Expand %% into the directory of the current file
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^

" Navigate splits more easily
" NOTE: In terminal vim, these are disabled in lieu of vim-tmux-navigator,
"       which handles this both in and out of TMUX
if has('gui_running')
  nmap <C-h> <C-w>h
  nmap <C-j> <C-w>j
  nmap <C-k> <C-w>k
  nmap <C-l> <C-w>l
endif

" Retain escape functionality in Terminal mode
tnoremap <ESC> <C-\><C-n>
tnoremap kj <C-\><C-n>

" Escape and page up on C-u
tnoremap <C-u> <C-\><C-n><C-u>

" Retain TMUX-navigator keys in terminal
tnoremap <C-h> <C-\><C-n>:TmuxNavigateLeft<cr>
tnoremap <C-j> <C-\><C-n>:TmuxNavigateDown<cr>
tnoremap <C-k> <C-\><C-n>:TmuxNavigateUp<cr>
tnoremap <C-l> <C-\><C-n>:TmuxNavigateRight<cr>

" NEOVIM Mappings
if has('nvim')
  " Assume that we want to enter Terminal Mode if we press UP in a terminal window
  au TermOpen * if &buftype == 'terminal' | nnoremap <buffer> <UP> i<UP> | endif
endif

" Key repeat hack for resizing splits, i.e., <C-w>+++- vs <C-w>+<C-w>+<C-w>-
" see: http://www.vim.org/scripts/script.php?script_id=2223
nmap <C-w>+ <C-w>+<SID>ws
nmap <C-w>- <C-w>-<SID>ws
nmap <C-w>> <C-w>><SID>ws
nmap <C-w>< <C-w><<SID>ws
nnoremap <script> <SID>ws+ <C-w>+<SID>ws
nnoremap <script> <SID>ws- <C-w>-<SID>ws
nnoremap <script> <SID>ws> <C-w>><SID>ws
nnoremap <script> <SID>ws< <C-w><<SID>ws
nmap <SID>ws <Nop>

" Allow writing via sudo
cnoremap w!! w !sudo tee > /dev/null %

" Allow for some common quit/write cmd typos
command! Q q        " Bind :Q to :q
command! W w        " Bind :W to :w
command! Qall qall

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LEADER MAPPINGS {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let spacebar double as our leader, for great justice
" xmap includes Visual mode but not Select mode (which we don't often use, but
" if we did we'd expect hitting space to replace the selected text with a
" space char).
nmap <space> <leader>
xmap <space> <leader>
nmap <space><space> <leader><leader>
xmap <space><space> <leader><leader>

" reload our .vimrc
nmap <leader>~ :source ~/.vimrc<CR>:redraw!<CR>:echo "~/.vimrc reloaded!"<CR>

" Write file
nmap <leader>w :w<CR>

nmap <leader>q :bd<CR>

" Toggle spelling
nmap <leader>s :echo "use `c o s` from vim-unimpaired" <CR>

" Toggle wrap
nmap <leader>W :echo "use `c o w` from vim-unimpaired" <CR>

" Toggle background light/dark
nmap <leader>B :echo "use `c o b` from vim-unimpaired" <CR>

" Toggle Cursor Column
nmap <leader>c :echo "use `c o x` from vim-unimpaired" <CR>

" Toggle paste mode
nmap <leader>p :set invpaste<CR>:set paste?<CR>

" upper/lower word
" (set a mark, visually select inner word, u/U, return to mark)
nmap <leader>U m`gUiw``
nmap <leader>L m`guiw``

" Reindent the entire file
nmap <leader>= gg=G``:echo "reindent global"<CR>

" Toggle buffer with <leader><leader>
nnoremap <leader><leader> <C-^>

" Toggle folds with <leader>z
nnoremap <leader>z za

" delete trailing whitespace
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
function! RD_RemoveTrailingSpaces()
  " set a mark to return to later
  normal m`
  " save the user's search register
  let _lastsearch=@/
  " find any space/tab at ends of lines & remove
  " the 'e' suppresses error if none found
  %s/\s\+$//e
  " restore the search register
  let @/=_lastsearch
  " jump back to the mark we set
  normal ``
  echo "removed trailing spaces (if any)"
endfunction
nmap <leader>tw :call RD_RemoveTrailingSpaces()<CR>

" Toggle match highlight
nmap <leader>l :echo "use `c o h` from vim-unimpaired" <CR>

" Ensure match highlight enabled on new search
nnoremap / :set hlsearch<CR>/

" Highlight matches when jumping to next
function! HLNext (blinktime)
  highlight WhiteOnRed ctermfg=white ctermbg=red
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#'.@/
  let ring = matchadd('WhiteOnRed', target_pat, 101)
  redraw
  exec 'sleep ' . a:blinktime . 'm'
  call matchdelete(ring)
  redraw
endfunction
" Now, remap n/N so they call themselves, center screen & call HLNext
nnoremap <silent> n nzz:call HLNext(100)<cr>
nnoremap <silent> N Nzz:call HLNext(100)<cr>

" Grepper mappings
nnoremap <leader>gg :Grepper<cr>
nnoremap <leader>* :Grepper -cword -noprompt<cr>

" BufferGator
" nmap <leader>b :BuffergatorOpen<CR>

" NERDTree stuff
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeHijackNetrw=0

" Fugitive mappings
nmap <leader>gs :Git<cr>
nmap <leader>gc :Git commit<cr>
nmap <leader>gd :Git diff<cr>
nmap <leader>gp :Git push<cr>

" Mappings for vim-ruby-xmpfilter
if executable('xmpfilter')
  augroup RD_XmpfilterCmds
    autocmd!
    autocmd FileType ruby nmap <buffer> <leader>m <Plug>(xmpfilter-mark)
    autocmd FileType ruby xmap <buffer> <leader>m <Plug>(xmpfilter-mark)
    autocmd FileType ruby imap <buffer> <leader>m <Plug>(xmpfilter-mark)
    autocmd FileType ruby nmap <buffer> <leader>x <Plug>(xmpfilter-run)
    autocmd FileType ruby xmap <buffer> <leader>x <Plug>(xmpfilter-run)
    autocmd FileType ruby imap <buffer> <leader>x <Plug>(xmpfilter-run)
  augroup END
endif

" Key mappings for vim-dragvisuals
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')

" Disable built-in v_u mapping
" ...we have a tendency to hit 'u' to undo while stuff is selected,
" which causes everything to become lowercase.
vnoremap u :echo "press ESC to clear selection"<CR>


" Mac OS X-only mappings
if has('mac')
  " Assume we have the Airline-patched font
  let g:airline_powerline_fonts = 1

  " Search for word under cursor in Dash.app
  nmap <leader>d <Plug>DashSearch
  nmap <leader>D <Plug>DashGlobalSearch

  " Use Marked.app to preview Markdown files...
  " http://stackoverflow.com/questions/9212340/is-there-a-vim-plugin-for-preview-markdown-file
  function! s:setupMarkedAppLeaderMapping()
    nmap <leader>M :silent !open -a Marked.app '%:p'<CR>:redraw!<CR>
  endfunction
  augroup RD_MarkedLauncher
    autocmd!
    autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkedAppLeaderMapping()
  augroup END
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILE TYPES {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some file types should wrap their text
function! RD_SetupWrapping()
  setlocal wrap
  setlocal linebreak
  setlocal textwidth=78
  setlocal nolist
endfunction

augroup RD_FileTypeCommands
  autocmd!

  " Make sure all markdown files have the correct filetype set and setup wrapping
  autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
  autocmd FileType markdown call RD_SetupWrapping()
  autocmd FileType markdown setlocal ts=4 sts=4 sw=4
  " Syntax highlight fenced code blocks (e.g., ```ruby...)
  let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

  " enable spell checking on certain files
  autocmd BufNewFile,BufRead COMMIT_EDITMSG set spell

  " Treat JSON files like JavaScript
  autocmd BufNewFile,BufRead *.json set ft=javascript

  " Support for ES6
  autocmd BufRead,BufNewFile *.es6 setfiletype javascript

  " Avoid syntax highlight issue on hyphenated CSS keywords
  autocmd FileType css,scss setlocal iskeyword+=-
augroup END

"}}}

" vim:set ft=vim et sw=2 foldmethod=marker:

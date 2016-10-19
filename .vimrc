set nocompatible
filetype off                  " required
let $LANG="zh_TW.UTF-8"
set langmenu=zh_tw.utf-8
set encoding=utf8

if has("gui_running")
    " GVIM
    if has("gui_win32")
        source $VIMRUNTIME/vimrc_example.vim
        source $VIMRUNTIME/mswin.vim
        behave mswin
        set diffexpr=MyDiff()
        function MyDiff()
          let opt = '-a --binary '
          if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
          if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
          let arg1 = v:fname_in
          if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
          let arg2 = v:fname_new
          if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
          let arg3 = v:fname_out
          if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
          let eq = ''
          if $VIMRUNTIME =~ ' '
            if &sh =~ '\<cmd'
              let cmd = '""' . $VIMRUNTIME . '\diff"'
              let eq = '"'
            else
              let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
            endif
          else
            let cmd = $VIMRUNTIME . '\diff'
          endif
          silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
        endfunction

        set rtp+=$VIMRUNTIME/../vimfiles/bundle/Vundle.vim/
        let path='$VIMRUNTIME/../vimfiles/bundle'
        call vundle#begin(path)

    endif
else
    " terminal VIM
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif

Plugin 'gmarik/Vundle.vim'

" useful function
" Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-repeat'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'mattn/emmet-vim'
Plugin 'godlygeek/tabular'
Plugin 'tomtom/tcomment_vim'
Plugin 'FredKSchott/CoVim'
Plugin 'dkprice/vim-easygrep'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-abolish'

" auto help
Plugin 'tpope/vim-endwise'
Plugin 'jiangmiao/auto-pairs'
Plugin 'amirh/HTML-AutoCloseTag'
" Plugin 'kien/rainbow_parentheses.vim'
Plugin 'luochen1990/rainbow'
Plugin 'Spaceghost/vim-matchit'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'Yggdroot/indentLine'
" Plugin 'nathanaelkane/vim-indent-guides'

" not yet learned
Plugin 'kien/ctrlp.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'rking/ag.vim'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'Chiel92/vim-autoformat'
Plugin 'mbbill/undotree'
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-fugitive'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/tlib'

" dunno..
Plugin 'spf13/vim-preview'
Plugin 'uguu-org/vim-matrix-screensaver'
Plugin 'zyedidia/vim-snake'

" language support
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'elzr/vim-json'
Plugin 'groenewege/vim-less'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'tpope/vim-haml'
Plugin 'digitaltoad/vim-jade'
Plugin 'tpope/vim-markdown'
Plugin 'alfredodeza/jacinto.vim'
Plugin 'mattn/webapi-vim'
Plugin 'beyondwords/vim-twig'
Plugin 'cakebaker/scss-syntax.vim'
" Plugin 'klen/python-mode'
" Plugin 'hynek/vim-python-pep8-indent'
" Plugin 'yssource/python.vim'
" Plugin 'python_match.vim'
" Plugin 'pythoncomplete'

" colorscheme
Plugin 'candy.vim'
Plugin 'dracula/vim' 
Plugin 'jacoborus/tender.vim'
Plugin 'mbbill/vim-seattle'
Plugin 'sonjapeterson/1989.vim'
Plugin 'vim-scripts/sift'


" Config {{{
" General, UI, UX
call vundle#end()            " required
filetype plugin indent on    " required
filetype on
syntax on                                     " enable syntax processing
" set mouse=
scriptencoding utf-8
set t_Co=256
set background=dark
colorscheme dracula
" colorscheme tender
colorscheme seattle

highlight CursorLine ctermbg=235 ctermfg=NONE
highlight Visual ctermbg=57
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
highlight Comment ctermbg=NONE
highlight LineNr ctermbg=NONE ctermfg=63
set ruler                                         " show the line number on the bar
set number                                        " show line numbers
set showcmd                                       " show command in bottom bar
set showmode
" set cursorline
set encoding=utf-8
set termencoding=utf-8
set synmaxcol=200
"syntax sync minlines=240
set to
set tm=500
set ttm=100
set updatetime=300
set ttyfast                                       " faster redraw
set ttyscroll=3
set lazyredraw
set linebreak
set cmdheight=2                                   " command line two lines high
set backspace=indent,eol,start                    " allow backspacing over everything in insert mode
set clipboard=unnamed
set history=1000                                  " remember more commands and search history
set undolevels=1000                               " use many muchos levels of undo
set updatecount=100                               " switch every 100 chars
set complete=.,w,b,u,U,t,i,d                      " do lots of scanning on tab completion
set title                                         " change the terminal's title
set noerrorbells                                  " don't beep    
set visualbell t_vb=                              " and don't make faces
set selection=exclusive
set selectmode=mouse,key
set noautowrite                                   " don't automagically write on :next
set scrolloff=8                                   " Start scrolling when we're 8 lines away from margins
set sidescrolloff=8
set sidescroll=1
set fileformat=unix
set fileformats=unix
set laststatus=2
set autoread
set binary
set list                                          " show invisible characters
set listchars=tab:\ \ ,trail:.
set autochdir
set fillchars=vert:\ ,stl:\ ,stlnc:\              " better view for split windows
set pastetoggle=<F12>                             " pastetoggle (sane indentation on pastes)"
set viewoptions=folds,options,cursor,unix,slash   " Better Unix / Windows compatibility"
set noswapfile

" Formatting
set tabstop=4                                     " 4 space tab
set expandtab                                     " use spaces for tabs
set softtabstop=4                                 " 4 space tab
" set smarttab                                      " tab and backspace are smart
set shiftwidth=4
set nowrap                                          " soft wrap long lines
set autoindent
set smartindent
"set copyindent                                    " copy the previous indentation on autoindenting
"set cindent
set modelines=1                                   " use the last line of file to use specified config
set formatoptions=tcrqn                           " auto formatting
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current

" Folding
" set foldmethod=marker                             " fold based on indent level
" set foldnestmax=10                                " max 10 depth
" set foldlevelstart=10                             " open most folds by default
set nofoldenable                                    " enable folding

" Completion
set wildmode=list:longest                         " set wildmenu to list choice
set wildmenu                                      " enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~                       " stuff to ignore when tab completing
set wildignore+=*.swp,*.bak,*.pyc,*.class
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" Searching
set ignorecase                                    " ignore case when searching
set smartcase                                     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set incsearch                                     " search as characters are entered
set hlsearch                                      " highlight all matches
set showmatch                                     " show matching bracket
"set gdefault                                      " search/replace globally (on a line) by default"
set diffopt=filler,iwhite                         " ignore all whitespace and sync

" Backups
set nobackup
set nowritebackup
" set backup
" set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set backupskip=/tmp/*,/private/tmp/*
" set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set writebackup

" gvim
if has("gui_running")
  if has("gui_win32")
    set guioptions-=L
    set guioptions-=e
    set guifont=Consolas:h10:cANSI
  endif
endif
" }}}


" Key (re)mapping {{{
let mapleader=","

" fast save file
inoremap <leader>; <esc> :w <cr>
noremap <leader>; <esc> :w <cr>

" disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" more natural movement with wrap on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap gV `[v`]

" Easy splitted window navigation
map <C-h>  <C-w>h
map <C-j>  <C-w>j
map <C-k>  <C-w>k
map <C-l>  <C-w>l

" resize split
map + <c-w>>
map - <c-w><

" fast open .vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>

" remove all ^M
if has("gui_running")
    if has("gui_win32")
        noremap <Leader>m :%s/\r\(\n\)/\1/g<CR><C-o>
    endif
else
    noremap <Leader>m :%s///g''
endif

" code reformatting
noremap <Leader>r gg=G''

" }}}


" Tricks {{{
" Auto reload .vimrc
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
" }}}


" PLUGIN CONFIGS {{{
" Nerdtree & Nerdtree-tabs
let NERDTreeDirArrows = 1
let NERDTreeChDirMode = 3
let g:NERDTreeWinSize = 30
let NERDTreeShowHidden = 1
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_focus_on_files = 1
map <leader>n <plug>NERDTreeTabsToggle<CR>

" AG
nnoremap <leader>a :Ag -i<space>

" Tmux
if exists('$TMUX') " allows cursor change in tmux mode
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" youcompleteme
let g:clang_library_path='/root/.vim/bundle/YouCompleteMe/python/libclang.so'
let g:clang_user_options='|| exit 0'

" python mode
" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin


" rainbow parenthesis
" let g:rbpt_colorpairs = [
"    \ ['brown',       'RoyalBlue3'],
"    \ ['Darkblue',    'SeaGreen3'],
"    \ ['darkgray',    'DarkOrchid3'],
"    \ ['darkgreen',   'firebrick3'],
"    \ ['darkcyan',    'RoyalBlue3'],
"    \ ['darkred',     'SeaGreen3'],
"    \ ['darkmagenta', 'DarkOrchid3'],
"    \ ['brown',       'firebrick3'],
"    \ ['gray',        'RoyalBlue3'],
"    \ ['black',       'SeaGreen3'],
"    \ ['darkmagenta', 'DarkOrchid3'],
"    \ ['Darkblue',    'firebrick3'],
"    \ ['darkgreen',   'RoyalBlue3'],
"    \ ['darkcyan',    'SeaGreen3'],
"    \ ['darkred',     'DarkOrchid3'],
"    \ ['red',         'firebrick3'],
"    \ ]
"let g:rbpt_max = 16
"let g:rbpt_loadcmd_toggle = 0
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

" vim-repeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" easymotion
map <Leader><Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s)

" indentLint
let g:indentLine_color_term = 239
let g:indentLine_color_tty_light = 7
let g:indentLine_color_dark = 1

" vim-indent-guides
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" emmet
map <C-e>  <C-y>,
" }}}

set encoding=utf-8
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Vundle help
""""""""""""""
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles


" VCS
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'

" System
Bundle 'vim-scripts/Gist.vim'
Bundle 'majutsushi/tagbar'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/snipmate-snippets'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'corntrace/bufexplorer'
Bundle 'vim-scripts/python_match.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-cucumber'

" Jekyll/Liquid
Bundle 'tpope/vim-liquid'

" Python bundles
" Bundle 'kevinw/pyflakes-vim'
Bundle 'fs111/pydoc.vim'
Bundle 'vim-scripts/pep8'
Bundle 'atourino/jinja.vim'

" Ruby specific
Bundle "vim-ruby/vim-ruby"

" Other
Bundle 'rodjek/vim-puppet'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-endwise'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'plasticboy/vim-markdown'
Bundle 'henrik/vim-markdown-preview'
Bundle 'emilkje/sparkup-bundle'

" github repos
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'git://github.com/vim-scripts/supertab.git'
Bundle 'https://github.com/drmingdrmer/xptemplate.git'

" Fun, but not useful
Bundle 'altercation/vim-colors-solarized'
Bundle 'skammer/vim-css-color'
Bundle 'groenewege/vim-less'
Bundle 'mgutz/vim-colors'
Bundle 'ehamberg/vim-cute-python'
Bundle 'tpope/vim-speeddating'

" Custom

filetype plugin indent on     " required!

" Configurations
""""""""""""""""
if has('gui_running')
	set background=light
else
	set background=dark
endif

" Wildmenu completion
"""""""""""""""""""""
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code
set wildignore=**.class                          " Cursed Java class files

" Save when losing focus
au FocusLost * :wa

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="


" Colours
colorscheme chance-of-storm

" Basic
syntax enable
set number        " always show line numbers
set hidden
set backspace=indent,eol,start
set directory=/tmp// " swap files
set ffs=unix,dos,mac "Default file types
set nowrap        " don't wrap lines
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

" Remove the toolbar if we're running under a GUI (e.g. MacVIM).
if has("gui_running")
  set guioptions=-t
endif

" Special characters for hilighting non-priting spaces/tabs/etc.
set list listchars=tab:→\ ,trail:·

" Tabs & spaces
set tabstop=4     " a tab is four spaces
set shiftwidth=4  " number of spaces to use for autoindenting
set softtabstop=4
set expandtab
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting

" General Code Folding
""""""""""""""""""""""
set foldmethod=indent
set foldlevel=99

" Highlight VCS conflict markers
""""""""""""""""""""""""""""""""
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" I CAN HAZ NORMAL REGEXES?
"""""""""""""""""""""""""""
nnoremap / /\v
vnoremap / /\v


" General auto-commands
"""""""""""""""""""""""
autocmd FileType * setlocal colorcolumn=0
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Markdown auto-commands
""""""""""""""""""""""""
autocmd FileType markdown setlocal wrap linebreak nolist

" Ruby Configurations
"""""""""""""""""""""
autocmd filetype ruby set shiftwidth=2 tabstop=2

" PHP Configurations
""""""""""""""""""""
autocmd FileType php setlocal colorcolumn=100

" Python configurations
"""""""""""""""""""""""
au BufNewFile,BufReadPost python setlocal shiftwidth=2 expandtab
autocmd FileType python setlocal colorcolumn=80
autocmd FileType python let g:pep8_map='<F4>'

" Coffeescript configurations
"""""""""""""""""""""""""""""
au BufNewFile,BufReadPost *.coffee setlocal foldmethod=indent
au BufNewFile,BufReadPost *.coffee setlocal shiftwidth=2 expandtab

" Javascript configurations
"""""""""""""""""""""""""""
au BufNewFile,BufReadPost *.js setlocal shiftwidth=2 expandtab

" Get jinja filetype selection working correctly for *.jinja.html files.
autocmd Filetype *.jinja.html setlocal filetype=htmljinja

" Make sure we hilight extra whitespace in the most annoying way possible.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Custom mappings
""""""""""""""""""

" Genral
noremap <silent> <F3> :QFix<CR>


" Change leader
let mapleader = ","
let g:mapleader = ","

" Get rid of search hilighting with ,/
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Fix those pesky situations where you edit & need sudo to save
cmap w!! w !sudo tee % >/dev/null


" Plugin configurations
""""""""""""""""""""""""

" Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 2
let g:gist_show_privates = 1

" TaskList
"map <leader>l <Plug>TaskList

" TagBar
nnoremap <silent> <F2> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_autoshowtag = 1

" Command-T
nnoremap <Leader>r :CommandT<CR>


" NERDTree
nnoremap <leader>g :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.vim$', '\~$', '.*\.egg-info']

" SnipMate
let g:snippets_dir = "~/.vim/bundle/snipmate-snippets"

" Sparkup
let g:sparkupExecuteMapping = '<leader><Tab>'
let g:sparkupNextMapping = '<leader>a'

" Double rainbow - What does it mean!?
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"Statusline
hi User1 guifg=#eea040 guibg=#000000
hi User2 guifg=#dd3333 guibg=#000000
hi User3 guifg=#ff66ff guibg=#000000
hi User4 guifg=#a0ee40 guibg=#000000
hi User5 guifg=#eeee40 guibg=#000000

set laststatus=2
set statusline=
set statusline +=%1*\ %n\ %*                              "buffer number
set statusline +=%5*%{&ff}%*                              "file format
set statusline +=%3*%y\ %*                                "file type
set statusline +=%5*%{fugitive#statusline()}%*            "Git status
set statusline +=%2*%#warningmsg#%*                       "Syntastic warning msg
set statusline +=%2*%{SyntasticStatuslineFlag()}%*        "Syntastic status
set statusline +=%4*\ %<%F%*                              "full path
set statusline +=%2*%m%*                                  "modified flag
set statusline +=%1*%=%5l%*                               "current line
set statusline +=%2*/%L%*                                 "total lines
set statusline +=%1*%4c\ %*                               "column number
set statusline +=%2*0x%04B\ %*                            "character under cursor

" Synctastic settings
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0

" SuperTab settings
let g:SuperTabDefaultCompletionType = "context"

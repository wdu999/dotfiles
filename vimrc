" let $HOME = $HOMEPATH

let mapleader = ","
let g:mapleader = ","

" map <leader>, :e! $vim/_vimrc<cr>  " windows
map <leader>, :e! ~/.vimrc<cr>  " linux

call plug#begin('~/vimfiles/plugged')
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" On-demand loading
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'tpope/vim-commentary'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'mechatroner/rainbow_csv'
Plug 'jlanzarotta/bufexplorer'
Plug 'preservim/tagbar'
Plug 'vim-syntastic/syntastic'
Plug 'itchyny/lightline.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'godlygeek/tabular'
Plug 'mhinz/vim-startify'
Plug 'ervandew/supertab'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'ayu-theme/ayu-vim'
" Plug 'nvie/vim-flake8'

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
" set codes for dynamic cursor type with vim modes
let &t_te="\e[0 q"
let &t_ti="\e[1 q"
let &t_EI="\e[1 q"
let &t_SI="\e[5 q"
let &t_SR="\e[3 q"

set nocompatible
set bsdir=buffer
set autochdir

syntax enable
syntax on

filetype on
filetype plugin on
filetype indent on

set foldenable
set foldlevelstart=99
"set foldmethod=syntax
set foldmethod=indent
set autoindent

set tabstop=4
set shiftwidth=4
set cindent shiftwidth=4
set autoindent shiftwidth=4
set expandtab
set smartindent

" C/C++ comments
set comments=://
" fix automatic C style comments
set comments=s1:/*,mb:*,ex0:/
" enchance index
set tags=./tags,./../tags,./**/tags
" save file format
set fileformats=unix,dos

set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*~,*.pyc

set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)

set clipboard+=unnamed
set ignorecase
set incsearch
set smartcase
set hlsearch
set syn=cpp
set lazyredraw
set magic
set nobackup
set number!
set showmatch
set mat=2
set history=1024
set nowrap
" set wrap
set linebreak
set breakindent
set mousemodel=popup
set backspace=indent,eol,start
set backspace=2
set whichwrap+=<,>,h,l
" set hid
set cmdheight=1
set scrolloff=5
set sidescrolloff=3
" start new line after 80 charators
" set tw=80 fo+=Mm

" Delete comment character when joining commented lines
set formatoptions+=j

" show commands as you type them
set sc

setlocal noswapfile
set relativenumber
set numberwidth=2
" set undofile

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

set tags=tags;
set autochdir

set autoread
" set mouse=a

" statusline color
" highlight StatusLine guifg=SlateBlue guibg=Yellow
" statusline color
" highlight StatusLineNC guifg=Gray guibg=White
set laststatus=2
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%d/%m/%Y-%H:%M\")}%=\ col:%c%V\ ascii:%b\ pos:%o\ lin:%l\,%L\ %P

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pep8']  " pep8, pycodestyle, pyflakes, pylint, python
let g:syntastic_python_pep8_args = "--ignore=E501,E701"
" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
" Ignore certain file types for syntastic
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['vim', 'txt', 'm'] }
" nnoremap <Leader>c :SyntasticCheck<CR>
" nnoremap <Leader>t :SyntasticToggleMode<CR>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

set tabpagemax=50
" Ctrl + TAB
noremap <C-Tab> :tabn<CR>
" Ctrl + SHIFT + TAB
noremap <C-S-TAB> :tabp<CR>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" "let g:ackprg = 'ag --vimgrep --smart-case'  % for linux???
" "let g:ackprg = 'ag -i --color '
" let g:ackprg = 'ag -i -t '
" cnoreabbrev ag Ack!
" cnoreabbrev aG Ack!
" cnoreabbrev Ag Ack!
" cnoreabbrev AG Ack!

" cnoreabbrev Ack Ack!
" nnoremap <Leader>s :Ack!<Space>

" " https://sts10.github.io/2016/02/12/best-of-my-vimrc.html
" " Easier page navigation
" nnoremap <C-e> <C-u>
" nnoremap <C-u> <C-e>

" vim-move set to <C-k> and <C-j>
"let g:move_key_modifier = 'C'

" Turn on auto-complete for various languages
set omnifunc=syntaxcomplete#Complete
set completeopt=preview,menu,longest
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complet

" per PEP 8, for Python, replace Tab with space, indent is four spaces

autocmd FileType python setlocal et sta sw=4 sts=4

if has("gui_running")
    set t_Co=256
    set encoding=utf-8
    "set fileencodings=ucs-bom,utf-8,chinese,prc,taiwan,latin-1
    set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
    let &termencoding=&encoding
    "set langmenu=zh_CN.UTF-8
    "let $LANG= 'zh_CN.UTF-8'
    "source $VIMRUNTIME/delmenu.vim
    "source $VIMRUNTIME/menu.vim
    set langmenu=en_US
    let $LANG= 'en_US'
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    " winpos 735 235
    " set lines=25 columns=120
    winpos 800 400
    set lines=40 columns=180
    set ai
    set encoding=utf-8

    " windows
    " set guifont=MesloLGM_Nerd_Font_Mono:h12

    " linux
    set guifont=MesloLGM\ Nerd\ Font\ Mono\ 12

endif

set list
set listchars=tab:..,trail:_,extends:>,precedes:<,nbsp:~
" set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→
set showbreak=\\ " [bonus]
" set showbreak=â€¦
" set showbreak=Ⅶ

"
" colorscheme
"
"let g:molokai_original=1
colo ayu

map <Up> gk
map <Down> gj
map <F9> zR
map <F10> zM
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" nnoremap <leader>w <C-w>v<C-w>l
" nnoremap <leader>q <C-w>s<C-w>j
nnoremap <leader>sv <C-w>v<C-w>l
nnoremap <leader>sh <C-w>s<C-w>j
nnoremap <leader>se <C-w>=
nnoremap <leader>sx :close<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j

vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" vmap <Leader>a= :Tabularize /=<cr>
" nmap <Leader>a= :Tabularize /=<cr>
" vmap <Leader>a: :Tabularize /:\zs<cr>
" nmap <Leader>a: :Tabularize /:\zs<cr>
" vmap <Leader>a: :Tabularize /:<cr>
" nmap <Leader>a: :Tabularize /:<cr>
" vmap <Leader>a; :Tabularize /;<cr>
" nmap <Leader>a; :Tabularize /;<cr>
" vmap <Leader>a% :Tabularize /%<cr>
" nmap <Leader>a% :Tabularize /%<cr>
" vmap <Leader>a# :Tabularize /#<cr>
" nmap <Leader>a# :Tabularize /#<cr>
" vmap <Leader>a] :Tabularize /]\zs<cr>
" nmap <Leader>a] :Tabularize /]\zs<cr>

" map <leader>f :LeaderfFile C:\Users\duwei\Documents\adm_project_mvx<CR>
" map <leader>f :LeaderfFile C:\Users\duwei\Documents\rdc_python_scripts<CR>
" map <leader>f :LeaderfFile C:\Users\duwei\Documents<CR>
" map <leader>b :LeaderfBuffer<CR>
" map <leader>b :LeaderfBufferAll<CR>
" map <leader>r :LeaderfMru<CR>

" hide menus, open it with F2 key
set guioptions-=m
set guioptions-=T
map <silent> <F2> : if &guioptions =~# 'T' <Bar>
    \set guioptions-=T <Bar>
    \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

" set winheight=30
" :silent! set winminheight=5
" set winminwidth=5
" nnoremap <silent> = :exe "resize " . (winheight(0) * 3/2)<CR>
" nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
" nnoremap <silent> ) :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
" nnoremap <silent> ( :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" Disable arrow movement, resize splits instead. Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1
if get(g:, 'elite_mode')
    " nnoremap <Up>    :resize +2<CR>
    " nnoremap <Down>  :resize -2<CR>
    " nnoremap <Left>  :vertical resize +2<CR>
    " nnoremap <Right> :vertical resize -2<CR>
    nnoremap <Up>  :exe "resize " . (winheight(0) * 2/3)<CR>
    nnoremap <Down>    :exe "resize " . (winheight(0) * 3/2)<CR>
    nnoremap <Left> :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
    nnoremap <Right>  :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
endif

"
" highlight over 79 words content, bind a key (leader+h) to toggle
"
hi LineProximity ctermfg=white ctermbg=gray guifg=white guibg=#757160
hi LineOverflow ctermfg=white ctermbg=red guifg=white guibg=#FF2270

let s:hilightline = 1

function! ToggleHighlightLine()
    if s:hilightline == 0
        call clearmatches()
        let s:hilightline = 1
    else
        let w:m1=matchadd('LineProximity', '\%<85v.\%>80v', -1)
        let w:m2=matchadd('LineOverflow', '\%>84v.\+', -1)
        let w:created=1
        let s:hilightline = 0
    endif
endfun

"
" Show TAB char and end space
"
set listchars=tab:>-,trail:~
set list
syntax match Trail " +$"
highlight def link Trail Todo

"
" tagbar
"
let g:tagbar_ctags_bin = 'ctags'
" autofocus on Tagbar open
let g:tagbar_autofocus = 0
let g:tagbar_autoclose = 0
" set tagbar width
let g:tagbar_width = 35
" open tagbar automatically when vim is open
" autocmd VimEnter * nested TagbarOpen
" tagbar on right
let g:tagbar_right = 1
" autocmd BufReadPost *.cpp,*.c,*.h,*.BAS,*.BAT,*.m,*.py,*.pl,*.hpp,*.cc,*.cxx nested TagbarOpen

"
" nerdtree
"
let NERDTreeWinPos='left'
let NERDTreeWinSize=31
let NERDTreeChDirMode=1
" "map <F4> :NERDTreeToggle<CR>
map <leader>e :NERDTreeToggle<cr>
" open NERDTree windows automatically when VIM is open
" autocmd VimEnter * nested NERDTree
" automatically active mouse in editor area
" autocmd VimEnter * wincmd p
" guarantees that the NERDTrees for all tabs will be one and the same
" autocmd BufEnter * NERDTreeMirror
" automatically locate the file when it's open; but it can not active mouse in editor area
" au VimEnter * NERDTreeFind

"
" run python
"
"map <F5> :!C:\Python32\python.exe %
"map <F5> :!C:\Python27\python.exe %
" map <F5> :!C:\Users\duwei\AppData\Local\Continuum\anaconda2\python.exe %
map <F5> :!C:\Users\duwei\Anaconda3\python.exe %

"
" Close all open buffers on entering a window if the only buffer that's left is the NERDTree buffer
"
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

if has("autocmd")
  autocmd BufRead *.txt set tw=78
  autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal g'\"" |
     \ endif
endif

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

"
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
"
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>b :BufExplorer<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!

" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc

" To go to the next search result do:
"   <leader>n

" To go to the previous search results do:
"   <leader>p

" map <leader>cc :botright cope<cr>
" map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
" map <leader>n :cn<cr>
" map <leader>p :cp<cr>

" => Helper functions
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" " Returns true if paste mode is enabled
" function! HasPaste()
"     if &paste
"         return 'PASTE MODE  '
"     en
"     return ''
" endfunction

" "
" " Don't close window, when deleting a buffer
" "
" command! Bclose call <SID>BufcloseCloseIt()
" function! <SID>BufcloseCloseIt()
"    let l:currentBufNum = bufnr("%")
"    let l:alternateBufNum = bufnr("#")

"    if buflisted(l:alternateBufNum)
"      buffer #
"    else
"      bnext
"    endif

"    if bufnr("%") == l:currentBufNum
"      new
"    endif

"    if buflisted(l:currentBufNum)
"      execute("bdelete! ".l:currentBufNum)
"    endif
" endfunction

map <silent> <leader><cr> :noh<cr>

" nnoremap <leader>t :%s/\s\+$//<cr>:let @/=''<CR>  " strip trailing whitespace

map <leader><tab> :bn<cr>
map <leader><s-tab> :bp<cr>
map <leader>bd :bdelete<cr>  " Close the current buffer
" map <leader>bd :Bclose<cr>  " Close the current buffer
map <leader>ba :1,1000 bd!<cr>  " Close all the buffers

" Opens a new tab with the current buffer's path Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
map <leader>t :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

map <leader>cd :cd %:p:h<cr>:pwd<cr>  " Switch CWD to the directory of the open buffer

"
" commentary settings
"
nmap <leader>l gcc
vmap <leader>l gcgv
imap <leader>l <ESC>gcc
autocmd FileType matlab setlocal commentstring=%\ %s

nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>  " open/close fold with space key

noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm  " Remove the Windows ^M - when the encodings gets messed up

iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>  Insert the current date and time (useful for timestamps):

nnoremap <leader>h :call ToggleHighlightLine()<CR>

map <leader>c :TagbarToggle<CR>  " toggle Tagbar display

map <leader>i :PlugInstall<CR>

nnoremap ; :
nnoremap <leader>q :qa!<CR>

" let g:rainbow_active = 1

augroup file_types
    autocmd!
    autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    " autocmd BufRead,BufNewFile *.txt set filetype=python
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
    autocmd BufNewFile,BufRead *.less set filetype=less
    autocmd BufRead,BufNewFile *.js set ft=javascript syntax=javascript
    autocmd BufRead,BufNewFile *.ts set ft=typescript syntax=typescript
    autocmd BufRead,BufNewFile *.es6 set ft=javascript syntax=javascript
    autocmd BufRead,BufNewFile *.json set ft=json syntax=javascript
    autocmd BufRead,BufNewFile *.twig set ft=htmldjango
    autocmd BufRead,BufNewFile *.rabl set ft=ruby
    autocmd BufRead,BufNewFile *.jade set ft=jade
augroup END

let g:startify_custom_header =[]

"
" background color
"
"set background=light
"set background=dark

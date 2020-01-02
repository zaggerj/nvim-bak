" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===
"set clipboard=unnamed
let &t_ut=''
set autochdir
" ===
" === Editor behavior
" ===
set number
"set relativenumber
set cursorline
hi cursorline guibg=NONE gui=underline
set tabstop=4 "number of spaces a <Tab> in the text stands for
set shiftwidth=4 "number of spaces used for each step of (auto)indent<Paste>
set softtabstop=4 " if non-zero, number of spaces to insert for a <Tab>
set smarttab "a <Tab> in an indent inserts 'shiftwidth' spaces"
set expandtab "tab to spaces"
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set ttimeoutlen=0
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
" set smartindent 
" set cindent
set foldlevel=99
set formatoptions-=tc
set splitright
set splitbelow
"设置在Vim中可以使用鼠标 防止在Linux终端下无法拷贝
set mouse=a
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set backspace=indent,eol,start
set nobackup
set noswapfile
"设置匹配模式 类似当输入一个左括号时会匹配相应的那个右括号
set showmatch
"指定配色方案为256色
set t_Co=256
" ===
" === Terminal Behavior
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
"tnoremap <C-N> <C-\><C-N>:q<CR>
" ===
" === Status bar behaviors
" ===
set noshowmode
set showcmd
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu

" Searching options
exec "nohlsearch"
set ignorecase
set smartcase
" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
" map ; :
" Save & quit
map Q :q<CR>
map S :w<CR>
" Visual copy
vmap <C-c> "+y
map <F12> gg=G
" ls
map ls :browse oldfiles<CR>
" Quick yanking to the end of the line
nnoremap Y y$
inoremap jj <Esc>
cnoremap w!! w !sudo tee % >/dev/null
" Open the vimrc file anytime
map tc :tabedit C:\Users\Administrator\AppData\Local\/nvim/init.vim<CR>
map R :source C:\Users\Administrator\AppData\Local\/nvim/init.vim<CR>
" Undo operations
" noremap l u
" Undo in Insert mode
inoremap <C-l> <C-u>
" <tab> use good
nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv
" Copy to system clipboard
vnoremap Y :w !pbcopy <CR>
" Search
map <LEADER><CR> :nohlsearch<CR>
noremap = nzz
noremap - Nzz
" Find duplicate words
map <LEADER>dw /\(\<\w\+\>\)\_s*\1
 "Folding
map <silent> <LEADER>o za
map <silent> <LEADER>y zc
map <silent> <LEADER>i zf
" ===
" === Cursor Movement
" ===
" U/E keys for 5 times u/e (faster navigation)
noremap E 5k
noremap K 5j
" N key: go to the start of the line
noremap N ^
" I key: go to the end of the line
noremap M $
" Faster in-line navigation
noremap W 5w
noremap B 5b
inoremap <s-up> <Esc>5ki
inoremap <s-down> <Esc>5ji
inoremap <s-left> <Esc>5hi
inoremap <s-right> <Esc>5li
vnoremap E 5k
vnoremap K 5j
vnoremap W 5w
vnoremap B 5b
" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>
"inoremap <C-U> <Esc>5<C-y>a
"inoremap <C-E> <Esc>5<C-e>a
" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l
" Disabling the default s key
noremap s <nop>
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
map su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
map se :set splitbelow<CR>:split<CR>
map sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
map si :set splitright<CR>:vsplit<CR>
" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H
" Resize splits with arrow keys
map <s-up> :res +5<CR>
map <s-down> :res -5<CR>
map <s-left> :vertical resize-5<CR>
map <s-right> :vertical resize+5<CR>
" show indentLine 
map <LEADER>\  :IndentLinesToggle <CR>
" Rotate screens
noremap bh <C-w>b<C-w>K
noremap bv <C-w>b<C-w>H
" ===
" === Tab management
" ===
" Create a new tab with tu
map tu :tabe<CR>
" shortcut to edit new tab
map te :tabedit 
" Move around tabs with tn and ti
map tn :-tabnext<CR>
map tm :+tabnext<CR>
" Move the tabs with tmn and tmi
map tj :-tabmove<CR>
map tk :+tabmove<CR>
" ===
" === Other useful stuff
" ===
" Opening a terminal window
map <LEADER>/ :set splitbelow<CR>:sp<CR>:term<CR>
" Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i
" Spelling Check with <space>sc
map <LEADER>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s
" Press ` to change case (instead of ~)
map ` ~
imap <C-c> <Esc>zza
nmap <C-c> zz
" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h
" Call figlet
map tx :r !figlet
" Compile function
map <LEADER>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    set splitright
    :vsp
    :vertical resize-20
    :term python3 %
  elseif &filetype == 'html'
    exec "!chromium % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  endif
endfunc
map <LEADER>R :call CompileBuildrrr()<CR>
func! CompileBuildrrr()
  exec "w"
  if &filetype == 'vim'
    exec "source $MYVIMRC"
  elseif &filetype == 'markdown'
    exec "echo"
  endif
endfunc
" ===
" === Install Plugins with Vim-Plug
" ===
call plug#begin('C:\Users\Administrator\AppData\Local\nvim\plugged')
" Pretty Dress
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'connorholyday/vim-snazzy'
Plug 'Yggdroot/indentLine'
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim'
Plug 'jacoborus/tender.vim'
Plug 'lvht/mru'
Plug 'edkolev/tmuxline.vim'
"File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
" Error checking
Plug 'w0rp/ale'
" Auto Complete
" Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-github'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-match-highlight'
Plug 'ncm2/ncm2-markdown-subscope'
" Undo Tree
Plug 'mbbill/undotree/'
" Other visual enhancement
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'
Plug 'tmhedberg/SimpylFold'
" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'
" Python
Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'
" For general writing
Plug 'reedes/vim-wordy'
Plug 'ron89/thesaurus_query.vim'
" Bookmarks
Plug 'kshenoy/vim-signature'
" Other useful utilities
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim' " distraction free writing mode
Plug 'ntpeters/vim-better-whitespace', { 'on': ['EnableWhitespace', 'ToggleWhitespace'] } "displays trailing whitespace (after :EnableWhitespace, vim slows down)
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line
" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'roxma/nvim-yarp'
Plug 'posva/vim-vue'
call plug#end()
" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
"let has_machine_specific_file = 1
"if empty(glob('C:\Users\Administrator\AppData\Local\nvim\_machine_specific.vim'))
"  let has_machine_specific_file = 0
"  silent! exec "!cp C:\Users\Administrator\AppData\Local\nvim\default_configs\_machine_specific_default.vim C:\Users\Administrator\AppData\Local\nvim\_machine_specific.vim"
"endif
"source C:\Users\Administrator\AppData\Local\nvim\_machine_specific.vim
" ===
" === Dress up my vim
" ===
"map <LEADER>c1 :set background=dark<CR>:colorscheme snazzy<CR>:AirlineTheme dracula<CR>
"map <LEADER>c2 :set background=light<CR>:colorscheme ayu<CR>:AirlineTheme ayu_light<CR>
" set termguicolors     " enable true colors support
" colorscheme snazzy
" set background=light
let g:onedark_transp_bg = 1
set background=dark
" colorscheme space_vim_theme
" colorscheme dracula
" colorscheme onedark
"let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu
let g:airline_theme='dracula'
let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }
" in your .vimrc or init.vim
" colorscheme github
" if you use airline / lightline
" let g:airline_theme = "github"
" let g:lightline = { 'colorscheme': 'github' }
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" ===
" === NERDTree
" ===
map <LEADER>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :NERDTreeFind<cr>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"
" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
" ===
" === NCM2
" ===
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>": "\<CR>")
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
let ncm2#popup_delay = 5
let g:ncm2#matcher = "substrfuzzy"
let g:ncm2_jedi#python_version = 3
let g:ncm2#match_highlight = 'sans-serif'
"let g:jedi#auto_initialization = 1
""let g:jedi#completion_enabled = 0
""let g:jedi#auto_vim_configuration = 0
""let g:jedi#smart_auto_mapping = 0
"let g:jedi#popup_on_dot = 1
"let g:jedi#completion_command = ""
"let g:jedi#show_call_signatures = "1"
" Some testing features
set shortmess+=c
set notimeout
" ===
" === vim-indent-guide
" ===
   " let g:indent_guides_guide_size = 1
   " let g:indent_guides_start_level = 1
   " let g:indent_guides_enable_on_vim_startup = 1
   " let g:indent_guides_color_change_percent = 1
   " silent! unmap <LEADER>ig
   " autocmd WinEnter * silent! unmap <LEADER>ig
   " let g:indent_guides_auto_colors = 0
   " autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
   " autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
" ===
" === some error checking
" ===
" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 1
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chrome'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0
" ===
" === Taglist
" ===
map <silent> T :TagbarOpenAutoClose<CR>
" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>
" ===
" === Goyo
" ===
map <LEADER>gy :Goyo<CR>
" ===
" === CtrlP
" ===
map <C-p> :CtrlP<CR>
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")':   ['<c-e>', '<down>'],
  \ 'PrtSelectMove("k")':   ['<c-u>', '<up>'],
  \ }
" ===
" === vim-signiture
" ===
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }
" ===
" === Undotree
" ===
let g:undotree_DiffAutoOpen = 0
map L :UndotreeToggle<CR>
" ==
" == vim-multiple-cursor
" ==
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<c-k>'
let g:multi_cursor_select_all_word_key = '<a-k>'
let g:multi_cursor_start_key           = 'g<c-k>'
let g:multi_cursor_select_all_key      = 'g<a-k>'
let g:multi_cursor_next_key            = '<c-k>'
let g:multi_cursor_prev_key            = '<c-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
" My snippits
"source C:\Users\Administrator\AppData\Local\/nvim/snippits.vim
" comfortable-motion
"nnoremap <silent> <C-e> :call comfortable_motion#flick(50)<CR>
"nnoremap <silent> <C-u> :call comfortable_motion#flick(-50)<CR>
"let g:comfortable_motion_no_default_key_mappings = 1
"let g:comfortable_motion_interval = 1
" Startify
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
" Far.vim
nnoremap <silent> <LEADER>f :F  %<left><left>
" Testring my own plugin
if !empty(glob('~/Github/vim-calc/vim-calc.vim'))
  source ~/Github/vim-calc/vim-calc.vim
endif
" map <LEADER>a :call Calc()<CR>
let g:user_emmet_leader_key='<C-f>'
" Open the _machine_specific.vim file if it has just been created
"if has_machine_specific_file == 0
"  exec "e C:\Users\Administrator\AppData\Local\/nvim/_machine_specific.vim"
"endif
" vim-indentline
let g:indentLine_enabled = 1
let g:indentLine_setColors = 0
let g:indentLine_color_term = 239
let g:indentLine_bgcolor_term = 202
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_gui = '#FF5F00'
let g:indentLine_color_tty_dark = 1
"对齐线颜色
let g:indentLine_char = '¦'
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
"对齐线符号, c表示任意ASCII码字符, 你还可以用下面这几个符号之一:  ¦, ┆, │, ⎸, 或 ▏
" all select copy
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" visual copy
vmap <C-c> "+y
" Quick yanking to the end of the line
nnoremap Y y$
" replace tpl
noremap <LEADER>' <Esc>:%s///g<left><left><left>
" ======
" ======tender theme modify
 " ======
" 开启 24 位真彩色支持
" 24位真彩色信息请参考 https://gist.github.com/XVilka/8346728
" set termguicolors
" 设置主题
" color tender
" tender 默认背景色是一种亮灰色，晚上特别不舒服，改成纯黑
" highlight Normal guibg=#000001
" 改背景后选中区域无法高亮，也得调一下
" highlight Visual guibg=#323232
" 灰色的状态栏很扎眼，调一下
" highlight StatusLine guibg=#444444 guifg=#b3deef
" vim 的 terminal 状态栏需要单独配置
" highlight StatusLineTerm guibg=#444444 guifg=#b3deef
" highlight StatusLineTermNC guibg=#444444 guifg=#999999
" ======
" ======mru setting
" ======
" set max lenght for the mru file list
let g:mru_file_list_size = 7 " default value
" set path pattens that should be ignored
let g:mru_ignore_patterns = 'fugitive\|\.git/\|\_^/tmp/' " default value
" 允许隐藏被修改过的 buffer
set hidden

" normal 模式下使用 bl 列出 Buffer 列表
nnoremap <silent> bl :ls<CR>

" normal 模式下使用 bo 打开一个新 Buffer
nnoremap <silent> bo :enew<CR>

" normal 模式下使用 bn 切换到下一个 Buffer
nnoremap <silent> bn :bnext<CR>

" normal 模式下使用 bn 切换到上一个 Buffer
nnoremap <silent> bp :bprevious<CR>

" normal 模式下使用 bd 关闭当前 Buffer
nnoremap <silent> bd :bdelete<CR>
nnoremap <silent> bc :e C:\Users\Administrator\AppData\Local\/nvim/init.vim<CR>

" 允许 airline 在顶部显示 Buffer 列表
let g:airline#extensions#tabline#enabled=1

" 显示 buffer 编号，方便切换
let g:airline#extensions#tabline#buffer_nr_show=1
" rename current filename
nnoremap sw :!mv % %:r.bak
" modify the file Suffix
nnoremap se :sav! %<.bak
" save as
nnoremap sa :sav! %
" reload current file
nnoremap fr :e<CR>
nnoremap fR :e!<CR>
" delete match /console/ line
nnoremap sg :g//d<left><left>
" sort invert
" :g/^/m 0
" delete even line 删除偶数行
" :g/^/+1 d
nnoremap td :r !date<CR>
" :r !date 在当前行中插入当前日期和时间

" =====
" ===== markdown config
" =====
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0
" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1
" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0
" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0
" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0
" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''
" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''
" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0
" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''
" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }
" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''
" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''
" use a custom port to start server or random for empty
let g:mkdp_port = ''
" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

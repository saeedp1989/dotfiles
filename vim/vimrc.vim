"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                preamble                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible

" Needed for vundle, will be turned on after vundle inits
filetype off

" Setup vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Vundle configuration                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" These need to come before the configuration options for the plugins since
" vundle will add the plugin folders to the runtimepath only after it has seen
" the plugin's Bundle command.

Bundle 'gmarik/vundle'
Bundle 'Valloric/vim-valloric-colorscheme'
Bundle 'L9'
Bundle 'xolox/vim-easytags'
Bundle 'xolox/vim-session'
Bundle 'xolox/vim-shell'
Bundle 'xolox/vim-pyref'
" Seems more active than tpope/vim-surround
Bundle 'anyakichi/vim-surround'
Bundle 'Raimondi/delimitMate'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'matchit.zip'
" We're using tcomment
Bundle 'indentpython.vim'
Bundle 'python.vim'
Bundle 'python_match.vim'
Bundle 'Rename'
Bundle 'tpope/vim-repeat'
Bundle 'tomtom/tlib_vim'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-fugitive'
Bundle 'SirVer/ultisnips'
Bundle 'godlygeek/tabular'
Bundle 'YankRing.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'bufexplorer.zip'
" requires compilation
Bundle 'git://git.wincent.com/command-t.git'
" Bundle 'robgleeson/hammer.vim'
Bundle 'tpope/vim-git'
" Bundle 'IndexedSearch'
Bundle 'mileszs/ack.vim'
" my fork makes sure the quickfix window is always full-width
Bundle 'Valloric/QFixToggle'
Bundle 'abudden/TagHighlight'
Bundle 'Valloric/vim-operator-highlight'
Bundle 'tomtom/tcomment_vim'
Bundle 'bufkill.vim'
Bundle 'FuzzyFinder'
Bundle 'FSwitch'
Bundle 'rson/vim-conque'
" requires that pyflakes (the app) is installed; we use kevinw's fork of
" pyflakes from https://github.com/kevinw/pyflakes
" Bundle 'kevinw/pyflakes-vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
" has a ftplugin folder with xml.vim in it; symlinking html.vim and xhtml.vim
" from that folder to that xml.vim is a good idea
Bundle 'nistude/xmledit'
Bundle 'helino/vim-json'
Bundle 'skammer/vim-css-color'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'groenewege/vim-less'
Bundle 'mattn/zencoding-vim'
Bundle 'xolox/vim-notes'

" TODO: use the Splice plugin (for Vim as mergetool)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           pre-filetype tweaks                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" these are for the xmledit plugin
let xml_use_xhtml = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        turn on filetype plugins                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable detection, plugins and indenting in one step
" This needs to come AFTER the Bundle commands!
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            General settings                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" for testing out custom vim scripts
set rtp+=$HOME/vim_test,$HOME/vim_test/after,$HOME/repos/YouCompleteMe

" Home away from home. We store some config files and snippets here and the
" whole dotfiles dir is a git repo. Should be the last entry in rtp (for
" UltiSnips).
set rtp+=$HOME/dotfiles/vim

" We want our cross-machine spell file to be used
set spellfile=$HOME/dotfiles/vim/spell/en.latin1.add

" TODO: transfer all our custom mapping to our vim_shortcuts file

" DISPLAY SETTINGS
colorscheme valloric    " sets the colorscheme
set background=dark     " enable for dark terminals
set scrolloff=2         " 2 lines above/below cursor when scrolling
set showmatch           " show matching bracket (briefly jump)
set matchtime=2         " reduces matching paren blink time from the 5[00]ms def
set showmode            " show mode in status bar (insert/replace/...)
set showcmd             " show typed command in status bar
set ruler               " show cursor position in status bar
set title               " show file in titlebar
set undofile            " stores undo state even when files are closed (in undodir)
set cursorline          " highlights the current line
set winaltkeys=no       " turns of the Alt key bindings to the gui menu

" When you type the first tab, it will complete as much as possible, the second
" tab hit will provide a list, the third and subsequent tabs will cycle through
" completion options so you can complete the file without further keys
set wildmode=longest,list,full
set wildmenu            " completion with menu
" This changes the default display of tab and CR chars in list mode
set listchars=tab:▸\ ,eol:¬

" The "longest" option makes completion insert the longest prefix of all
" the possible matches; see :h completeopt
set completeopt=menu,menuone,longest,preview
set switchbuf=useopen,usetab

" EDITOR SETTINGS
set ignorecase          " case insensitive searching
set smartcase           " but become case sensitive if you type uppercase characters
" this can cause problems with other filetypes
" see comment on this SO question http://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim/234578#234578
"set smartindent         " smart auto indenting
set autoindent          " on new lines, match indent of previous line
set copyindent          " copy the previous indentation on autoindenting
set cindent             " smart indenting for c-like code
set cino=b1,g0,N-s,t0,(0,W4  " see :h cinoptions-values
set smarttab            " smart tab handling for indenting
set magic               " change the way backslashes are used in search patterns
set bs=indent,eol,start " Allow backspacing over everything in insert mode
set nobackup            " no backup~ files.

set tabstop=2           " number of spaces a tab counts for
set shiftwidth=2        " spaces for autoindents
set softtabstop=2
set shiftround          " makes indenting a multiple of shiftwidth
set expandtab           " turn a tab into spaces
set laststatus=2        " the statusline is now always shown

" misc settings
set fileformat=unix     " file mode is unix
set fileformats=unix,dos,mac   " detects unix, dos, mac file formats in that order

set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo
                        " file -- 20 jump links, regs up to 500 lines'

set hidden              " allows making buffers hidden even with unsaved changes
set history=1000        " remember more commands and search history
set undolevels=1000     " use many levels of undo
set autoread            " auto read when a file is changed from the outside
set mouse=a             " enables the mouse in all modes

" toggles vim's paste mode; when we want to paste something into vim from a
" different application, turning on paste mode prevents the insertion of extra
" whitespace
set pastetoggle=<F7>

" Right-click on selection should bring up a menu
set mousemodel=popup_setpos

" With this, the gui (gvim and macvim) now doesn't have the toolbar, the left
" and right scrollbars and the menu.
set guioptions-=T
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=M

" this makes sure that shell scripts are highlighted
" as bash scripts and not sh scripts
let g:is_posix = 1

" tries to avoid those annoying "hit enter to continue" messages
" if it still doesn't help with certain commands, add a second <cr>
" at the end of the map command
set shortmess=a

" this solves the "unable to open swap file" errors on Win7
set dir=~/tmp,/var/tmp,/tmp,$TEMP
set undodir=~/tmp,/var/tmp,/tmp,$TEMP

" Look for tag def in a "tags" file in the dir of the current file, then for
" that same file in every folder above the folder of the current file, until the
" root.
set tags=./tags;/

" turns off all error bells, visual or otherwise
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" none of these should be word dividers, so make them not be
set iskeyword+=_,$,@,%,#

" Number of screen lines to use for the command-line
set cmdheight=2

" allow backspace and cursor keys to cross line boundaries
set whichwrap+=<,>,h,l
set nohlsearch          " do not highlight searched-for phrases
set incsearch           " ...but do highlight-as-I-type the search string
set gdefault            " this makes search/replace global by default

" enforces a specified line-length and auto inserts hard line breaks when we
" reach the limit; in Normal mode, you can reformat the current paragraph with
" gqap.
set textwidth=80

" this makes the color after the textwidth column highlighted
set colorcolumn=+1

" options for formatting text; see :h formatoptions
set formatoptions=tcroqn

" The alt (option) key on macs now behaves like the 'meta' key. This means we
" can now use <m-x> or similar as maps. This is buffer local, and it can easily
" be turned off when necessary (for instance, when we want to input special
" characters) with :set nomacmeta.
if has("gui_macvim")
  set macmeta
endif

" UltiSnips is missing a setf trigger for snippets on BufEnter
autocmd BufEnter *.snippets setf snippets

" In UltiSnips snippet files, we want actual tabs instead of spaces for indents.
" US will use those tabs and convert them to spaces if expandtab is set when the
" user wants to insert the snippet.
autocmd FileType snippets set noexpandtab

let google_path = $HOME . '/google/google_vim_settings.vim'
if filereadable( google_path )
  let at_google = 1
else
  let at_google = 0
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           More involved tweaks                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Unicode support (taken from http://vim.wikia.com/wiki/Working_with_Unicode)
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" Automatically delete trailing DOS-returns and whitespace on file open and
" write.
autocmd BufRead,BufWritePre,FileWritePre * silent! %s/[\r \t]\+$//

" this maximizes the gvim window on startup
if has("gui_win32")
  " this maximizes on windows
  au GUIEnter * simalt ~x
else
  " We want to maximize gvim always EXCEPT when we are running in Macvim AND we
  " are in vimdiff mode. The reason is that if we run this in those
  " circumstances, one of the vertical splits in vimdiff mode will get all the
  " width.
  if !( &diff && has("gui_macvim") )
    au GUIEnter * set lines=999 columns=999
  endif
endif

" Sets a font for the GUI
if has("gui_gtk2")
  set guifont=Consolas\ 11
elseif has("gui_macvim")
  " My Mac has a fairly high DPI so the font needs to be bigger
  set guifont=Consolas:h14
elseif has("gui_win32")
  set guifont=Consolas:h11
end

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
      \ | wincmd p | diffthis

" Sometimes, $MYVIMRC does not get set even though the vimrc is sourced
" properly. So far, I've only seen this on Linux machines on rare occasions.
if has("unix") && strlen($MYVIMRC) < 1
  let $MYVIMRC=$HOME . '/.vimrc'
endif

" Highlight Class and Function names
fun! s:HighlightFunctionsAndClasses()
  syn match cCustomFunc  "\w\+\s*\((\)\@="
  syn match cCustomClass "\w\+\s*\(::\)\@="

  hi def link cCustomFunc  Function
  hi def link cCustomClass Function
endfunction

" TODO: this should:
" a) not be called for every filetype
" b) be in a separate plugin
au Syntax * call s:HighlightFunctionsAndClasses()


" TODO: split this into separate plugin
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        execute "Ack " . l:pattern . ' %'
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"Basically you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
vnoremap <silent> gv :call VisualSearch('gv')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            custom mappings                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NOTE: a lot of these mappings won't make sense until you realize I'm using a
" "Dvorak-Qwerty Command" layout (and similar on Win/Lin). The layout is Dvorak
" unless you hold down Ctrl or Alt or Cmd; then it changes to Qwerty. This type
" of layout gives us Dvorak typing but Qwerty keyboard shortcuts.

" our <leader> will be the space key
let mapleader=" "

" this makes vim's regex engine "not stupid"
" see :h magic
nnoremap / /\v
vnoremap / /\v

" With this map, we can select some text in visual mode and by invoking the map,
" have the selection automatically filled in as the search text and the cursor
" placed in the position for typing the replacement text. Also, this will ask
" for confirmation before it replaces any instance of the search text in the
" file.
vnoremap <C-r> "hy:%s/<C-r>h//c<left><left>

" Fast saving
nnoremap <leader>w :w!<cr>

" <leader>v brings up .vimrc
" <leader>V reloads it and makes all changes active (file has to be saved first)
noremap <leader>v :e! $MYVIMRC<CR>
noremap <silent> <leader>V :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" with this, we can now type ",." to exit out of insert mode
" if we really wanted to type ",.", then just type one char, wait half a sec,
" type another
inoremap ,. <Esc>
vnoremap ,. <Esc>

" CTRL-U and CTRL-W in insert mode cannot be undone.  Use CTRL-G u to first
" break undo, so that we can undo those changes after inserting a line break.
" For more info, see: http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" This command will allow us to save a file we don't have permission to save
" *after* we have already opened it. Super useful.
cnoremap w!! w !sudo tee % >/dev/null

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" g<c-]> is jump to tag if there's only one matching tag, but show list of
" options when there is more than one definition
nnoremap <leader>g g<c-]>

" These create newlines like o and O but stay in normal mode
nnoremap <silent> zj o<Esc>k
nnoremap <silent> zk O<Esc>j

" Now we don't have to move our fingers so far when we want to scroll through
" the command history; also, don't forget the q: command (see :h q: for more
" info)
cnoremap <c-j> <down>
cnoremap <c-k> <up>

" Keep search matches in the middle of the window.
" zz centers the screen on the cursor, zv unfolds any fold if the cursor
" suddenly appears inside a fold.
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap n nzzzv
nnoremap N Nzzzv

" Also center the screen when jumping through the changelist
nnoremap g; g;zz
nnoremap g, g,zz

" In normal mode, we use : much more often than ; so lets swap them.
" WARNING: this will cause any "ordinary" map command without the "nore" prefix
" that uses ":" to fail. For instance, "map <f2> :w" would fail, since vim will
" read ":w" as ";w" because of the below remappings. Use "noremap"s in such
" situations and you'll be fine.
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" This makes j and k work on "screen lines" instead of on "file lines"; now, when
" we have a long line that wraps to multiple screen lines, j and k behave as we
" expect them to.
nnoremap j gj
nnoremap k gk

" Use Q for formatting the current paragraph (or visual selection)
vnoremap Q gq
nnoremap Q gqap

" $ is 'go to end of line content', ^ is 'go to start of line content'. I use
" these a lot, but I hate the finger contortions required to press these. They
" still won't work when supplied to commands as motions!
nnoremap <Leader>is $
nnoremap <Leader>ih ^

" This is quit all
noremap <Leader>q :qa<cr>

" key bindings for quickly moving between windows
" h left, l right, k up, j down
noremap <leader>h <c-w>h
noremap <leader>l <c-w>l
noremap <leader>k <c-w>k
noremap <leader>j <c-w>j

" for faster scrolling
" TODO: create a command for scrolling by ~70% of the window height
noremap <m-j> 15gj
noremap <m-k> 15gk

" on macs the alt key is inconvenient to press, so let's also map to ctrl
noremap <c-j> 15gj
noremap <c-k> 15gk

" Switches to the previous buffer that was shown in the current window, but also
" closes the current buffer before switching to the previous one
noremap <leader>bq <c-^> :bd #<cr>

" Switch to the directory of the open buffer
noremap <leader>cd :cd %:p:h<cr>

" Toggle and untoggle spell checking
noremap <leader>ss :setlocal spell! spelllang=en_us<cr>

" spelling shortcuts using <leader>
" ]s next misspelled word
" [s previous misspelled word
" zg add to dict
" z= get suggestions
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>su z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       ***  HERE BE PLUGINS  ***                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              BufExplorer                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

noremap <leader>o :BufExplorer<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Command-T                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:CommandTMaxHeight          = 30
let g:CommandTMatchWindowReverse = 1 " shows results in reverse order

" MacVim doesn't use tab focus to switch from command-t input field to the file
" list, so using j and k for next and prev screws everything up. But it does
" work on linux so let's use it there.
if has("gui_gtk2")
    let g:CommandTSelectNextMap  = [ '<down>' ]
    let g:CommandTSelectPrevMap  = [ '<up>' ]
endif

set wildignore+=*.o,*.obj,.git,*.pyc,*.so,blaze*,READONLY,llvm,Library*,CMakeFiles
nnoremap <leader>t :CommandT<cr>
nnoremap <leader>n :CommandTBuffer<cr>
nnoremap <leader>' :CommandTFlush<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Gundo                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" f5 toggles the Gundo plugin window
nnoremap <F5> :GundoToggle<CR>
let g:gundo_width=80

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                NERDTree                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" toggles the nerdtree window
nnoremap <F3> :NERDTreeToggle<cr>

" This makes the dir of the current file the root of the nerdtree;
" in effect, it re-centers the nerdtree on the current file's folder.
nnoremap <F2> :NERDTreeFind<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                yankring                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:yankring_history_dir = '$HOME/tmp/vim'
" this is so that single char deletes don't end up in the yankring
let g:yankring_min_element_length = 2
let g:yankring_window_height = 14
nnoremap <leader>r :YRShow<CR>

" this makes Y yank from the cursor to the end of the line, which makes more
" sense than the default of yanking the whole current line (we can use yy for
" that)
function! YRRunAfterMaps()
    nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                session                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" you also need to run :SaveSession once to create the default.vim session that
" will then be autoloaded/saved from then on

let g:session_autoload        = 'yes'
let g:session_autosave        = 'yes'
let g:session_default_to_last = 'yes'
let g:session_directory       = '~/tmp/vim/sessions'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                tabular                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" looks at the current line and the lines above and below it and aligns all the
" equals signs; useful for when we have several lines of declarations
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                UltiSnips                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" we can't use <tab> as our snippet key since we use that with neocomplcache
let g:UltiSnipsSnippetsDir         = $HOME . '/dotfiles/vim/UltiSnips'
let g:UltiSnipsExpandTrigger       = "<m-s>"
let g:UltiSnipsListSnippets        = "<c-m-s>"
let g:UltiSnipsJumpForwardTrigger  = "<m-h>"
let g:UltiSnipsJumpBackwardTrigger = "<m-t>"
let g:snips_author                 = 'Strahinja Val Markovic'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                easytags                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" this makes the easytags plugin use project/folder specific tag files instead
" of just dumping everything inside the main tag file
let g:easytags_dynamic_files = 1

" ctags will now also list members of C++ classes and structs
let g:easytags_include_members = 1

" we don't use easytags for tag highlighting, we use TagHighlight for that
let g:easytags_auto_highlight = 0

if has("gui_macvim")
    let g:easytags_cmd = '/usr/local/bin/ctags'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               easymotion                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:EasyMotion_leader_key = '<Leader>e'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 hammer                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

noremap <f8> :w<cr>:Hammer<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                ack.vim                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("gui_macvim")
  let g:ackprg="ack -H --nocolor --nogroup --column"
else
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               QFixToggle                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

noremap <silent> <leader>u :QFix<CR>
let g:QFixToggle_Height = 25

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                bufkill                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use the arrows for something useful
" :BB switches to the previous buffer shown in the current window, :BF switches
" to the next one; it's like a buffer history for every window
noremap <right> :BF<cr>
noremap <left> :BB<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              fuzzyfinder                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" This turns on the mrufile and mrucmd modes
let g:fuf_modesDisable    = []
let g:fuf_mrufile_maxItem = 1000
let g:fuf_mrucmd_maxItem  = 400
let g:fuf_file_exclude    = '\v\~$|\.(o|exe|dll|bak|class|meta|lock|orig|jar|swp)$|/test/data\.|(^|[/\\])\.(hg|git|bzr)($|[/\\])'

nnoremap <Leader>fm :FufMruFile<CR>
nnoremap <Leader>fc :FufMruCmd<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                fswitch                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" A "companion" file is a .cpp file to an .h file and vice versa

" Opens the companion file in the current window
nnoremap <Leader>sh :FSHere<cr>

" Opens the companion file in the window to the left (window needs to exist)
" This is actually a duplicate of the :FSLeft command which for some reason
" doesn't work.
nnoremap <Leader>sl :call FSwitch('%', 'wincmd l')<cr>

" Same as above, only opens it in window to the right
nnoremap <Leader>sr :call FSwitch('%', 'wincmd r')<cr>

" Creates a new window on the left and opens the companion file in it
nnoremap <Leader>sv :FSSplitLeft<cr>

" This handles c++ files with the ".cc" extension.
augroup googleccfiles
  au!
  au BufEnter *.cc let b:fswitchdst  = 'h,hxx'
  au BufEnter *.cc let b:fswitchlocs = './,reg:/src/include/,reg:|src|include/**|,../include'

  if !at_google
    au BufEnter *.h  let b:fswitchdst  = 'cpp,cc,c'
  else
    au BufEnter *.h  let b:fswitchdst  = 'cc,cpp,c'
  endif
  au BufEnter *.h  let b:fswitchlocs = './,reg:/include/src/,reg:/include.*/src/,../src'
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                vim-git                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn on spell checking by default for git commit messages
au FileType gitcommit setlocal spell! spelllang=en_us

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              vim powerline                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:Powerline_cache_file = $HOME . '/tmp/Powerline.cache'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                tagbar                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:tagbar_left = 1
let g:tagbar_sort = 0
if has("gui_macvim")
  let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
endif

nnoremap <F4> :TagbarToggle<cr><c-w>=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               vimpager                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vimpager is actually not a plugin but a shell file
" https://github.com/rkitover/vimpager
let vimpager_use_gvim = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               delimitMate                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au FileType html,xhtml let b:delimitMate_matchpairs = "(:),[:],{:}"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              vim-css-color                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:cssColorVimDoNotMessMyUpdatetime = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              zencoding-vim                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:user_zen_leader_key = '<c-n>'
let g:user_zen_settings = {
      \  'indentation' : '  '
      \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                vim-notes                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:notes_directory = '~/notes'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              VIMRC OVERRIDE                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" If we are at our google workstation, then do some things differently
if at_google
    exec 'source ' . google_path
endif

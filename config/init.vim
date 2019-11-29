" ------------------------------ PLUGINS ------------------------------
call plug#begin('~/.vim/plugged')
    Plug 'junegunn/vim-plug'                                                                        " This plugin manager
    Plug 'itchyny/lightline.vim'                                                                    " Light and configurable statusline
    Plug 'tpope/vim-fugitive'                                                                       " Git wrapper
    Plug 'rhysd/git-messenger.vim'                                                                  " Reveal the commit messages under the cursor in a 'popup window'
    Plug 'scrooloose/nerdtree'                                                                      " Directory tree explorer
    Plug 'w0rp/ale'                                                                                 " Asynchronous Lint Engine
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}                              " Intellisense engine; full language server protocol support; built from source code
    Plug '/usr/local/opt/fzf'                                                                       " Use brew installed fzf
    Plug 'junegunn/fzf.vim'                                                                         " Awesome fuzzy finder
    Plug 'jiangmiao/auto-pairs'                                                                     " Insert/delete brackets
    Plug 'tpope/vim-surround'                                                                       " Provides mappings to easily delete, change and add surroundings (parentheses, brackets, quotes, XML tags, and more) in pairs
    Plug 'JamshedVesuna/vim-markdown-preview'                                                       " Preview markdown files in the browser
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }                                              " Golang plugin
    Plug 'trayo/vim-ginkgo-snippets'                                                                " Add snippets for Ginkgo BDD testing library for go
    Plug 'SirVer/ultisnips'                                                                         " Add various code snippets
    Plug 'vim-ruby/vim-ruby'                                                                        " Ruby plugin
    Plug 'mhinz/vim-startify'                                                                       " Fancy start screen
    Plug 'zirrostig/vim-schlepp'                                                                    " Move lines (or bocks) of text around easily
    Plug 'tpope/vim-commentary'                                                                     " Comment stuff out
    Plug 'christoomey/vim-system-copy'                                                              " Add mappings to copy to clipboard
    Plug 'powerman/vim-plugin-AnsiEsc'                                                              " ANSI escape sequences concealed, but highlighted as specified
    Plug 'RRethy/vim-illuminate'                                                                    " Selectively illuminating other uses of the current word under the cursor
    Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }                                                        " Runs shfmt to auto format the current buffer
    Plug 'romainl/vim-cool'                                                                         " Make hlsearch more useful
    Plug 'mtth/scratch.vim'                                                                         " Unobtrusive scratch window
    Plug 'joshdick/onedark.vim'                                                                     " Dark colorscheme
    Plug 'majutsushi/tagbar'                                                                        " Displays file outline (variables, functions, etc)
call plug#end()
" ---------------------------------------------------------------------


" ------------------------------ GENERAL ------------------------------
set mouse=a                                                         "Enable mouse
set backspace=indent,eol,start                                      "Make backspace normal
set nocompatible                                                    "Disable vi compatibility. Because we're not in 1995
set tw=0                                                            "Disable automactic line wrapping
set list                                                            "Display whitespace characters
set listchars=tab:▸\ ,trail:~,extends:>,precedes:<,space:·          "Specify whitespace characters visualization
set noerrorbells                                                    "Disable beeping
set encoding=utf8                                                   "Encoding
set ffs=unix,dos                                                    "File formats that will be tried (in order) when vim reads and writes to a file
set splitbelow                                                      "Set preview window position to bottom of the page
set scrolloff=5                                                     "Show at least N lines above/below the cursor.
set hidden                                                          "Opening a new file when the current buffer has unsaved changes causes files to be hidden instead of closed
set undolevels=1000                                                 "Undo many times
set noshowmode                                                      "Do not show message on last line when in Insert, Replace or Visual mode

set termguicolors                                                   "Enable TrueColor

if !has('nvim')
  set ttymouse=sgr                                                    "Make the mouse work even in columns beyond 223
endif

let mapleader=","                                                   "Leader is comma
let maplocalleader=","                                              "Local leader is comma

"For pairing convenience (alternative esc sequences)
inoremap jk <esc>
inoremap ;; <esc>

" Increase the maximum amount of memory to use for pattern matching
set maxmempattern=2000

"show the changes after the last save
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction

com! DiffSaved call s:DiffWithSaved()

" Reload file
inoremap <silent> <leader>r :edit<CR>

" Save on enter
nnoremap <silent> <expr> <cr> empty(&buftype) ? ':w<cr>' : '<cr>'

" clear search highligt
nnoremap <silent> <space> :nohl<cr>

" be able to indent visual block multiple times
vnoremap > >gv
vnoremap < <gv

" ---------------------------------------------------------------------

" -------------------------- COLORSCHEME ------------------------------
"Enable syntax processing
syntax enable

" This colorscheme
colorscheme onedark

" ---------------------------------------------------------------------

" ------------------------------ SPACES & TABS ------------------------
set tabstop=4               "Number of visual spaces per TAB
set softtabstop=4           "Number of spaces in tab when editing
set expandtab               "Tabs are spaces
set shiftwidth=4            "Indent with 4 spaces
" ---------------------------------------------------------------------

" ------------------------------ UI CONFIG ----------------------------
set number                              "Show line numbers
filetype indent on                      "Load filetype-specific indent files
set wildmenu                            "Visual autocomplete for command menu
set wildmode=longest,full               "Complete till longest common string && Complete the next full match
set lazyredraw                          "Redraw only when we need to.
set showmatch                           "Highlight matching [{()}]
set fillchars+=vert:│                   "Solid vertical split line
set cursorline                          "Highlight current line


augroup CursorLine
    au!
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
" ---------------------------------------------------------------------

" ------------------------------ SEARCHING ----------------------------
set incsearch               "Incremental search
set hlsearch                "Highlight matches
set ignorecase              "Ignore case on search
" ---------------------------------------------------------------------


" ------------------------------ FOLDING ------------------------------
set foldenable              "Enable folding
set foldmethod=syntax       "Fold based on syntax highlighting
set foldlevelstart=99       "Do not close folds when a buffer is opened
" ---------------------------------------------------------------------
set incsearch               "Incremental search
set hlsearch                "Highlight matches
set ignorecase              "Ignore case on search
" ---------------------------------------------------------------------

" ------------------------------ MOVEMENT ------------------------------
"Move vertically (down) by visual line
nnoremap j gj
"Move vertically (up) by visual line
nnoremap k gk

" Movement in popup menu
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
" ---------------------------------------------------------------------

" =======================================================================================
" =============================== PLUGIN CONFIGURATIONS =================================
" =======================================================================================

" --------------------------------- NERDTree -------------------------------

" Toggle NERDTree
nnoremap <silent> \ :NERDTreeToggle<cr>

" Reveal the file being edited in nerdtree
nnoremap <silent> \| :NERDTreeFind<cr>

" Single mouse click will open any node
let g:NERDTreeMouseMode=3

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Automatically delete the buffer of the file you just deleted with NerdTree
let NERDTreeAutoDeleteBuffer = 1

" Do not show whitespace characters in NERDTree window
autocmd FileType nerdtree setlocal nolist

" Show hidden files
let NERDTreeShowHidden=1

" --------------------------------------------------------------------------

" --------------------------------- Lightline --------------------------------

" Show statusline
set laststatus=2

" Colors
let s:green = [ '#99ad6a', 107 ]
let s:red = [ '#dd1c1c', 167 ]
let s:yellow = [ '#ffb964', 215 ]
let s:blue = [ '#6A95EA', 103, 'bold' ]
let s:lightgrey = [ '#999494', 'none' ]
let s:blackish = [ '#1c1c1c', 'none' ]
let s:darkgrey = [ '#282525', 'none' ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

" Middle
let s:p.normal.middle = [ [ s:lightgrey, s:blackish ] ]

" Left
let s:p.normal.left = [ [ s:blue, s:blackish ], [ s:green, s:blackish ], [ s:red, s:blackish ], [ s:lightgrey, s:blackish ] ]
let s:p.insert.left = [ [ s:blue, s:blackish ], [ s:green, s:blackish ], [ s:red, s:blackish ], [ s:lightgrey, s:blackish ] ]
let s:p.replace.left = [ [ s:blue, s:blackish ], [ s:green, s:blackish ], [ s:red, s:blackish ], [ s:lightgrey, s:blackish ] ]
let s:p.visual.left = [ [ s:blue, s:blackish ], [ s:green, s:blackish ], [ s:red, s:blackish ], [ s:lightgrey, s:blackish ] ]

" Right
let s:p.normal.right = [ [ s:lightgrey, s:blackish ], [ s:lightgrey, s:blackish ], [ s:lightgrey, s:blackish ] ]

" Inactive
let s:p.inactive.middle = [ [ s:lightgrey, s:darkgrey ] ]
let s:p.inactive.right = [ [ s:darkgrey, s:darkgrey ], [ s:darkgrey, s:darkgrey ] ]

" Errors & warnings
let s:p.normal.error = [ [ s:red, s:blackish ] ]
let s:p.normal.warning = [ [ s:yellow, s:blackish ] ]

" Set the palette
let g:lightline#colorscheme#onedark#palette = lightline#colorscheme#flatten(s:p)

" Lightline configs
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch' ],
      \             [ 'readonly' ],
      \             [ 'relativepath', 'modified' ] ],
      \   'right': [ [ 'linter_warnings', 'linter_errors', 'linter_ok' ],
      \              [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype', 'encodingformat' ] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'LightlineBranch',
      \   'mode': 'LightlineMode',
      \   'encodingformat': 'LightlineFileEncodingFormat',
      \   'lineinfo': 'LightlineLineInfo',
      \   'percent': 'LightlinePercent',
      \   'filetype': 'LightlineFiletype',
      \   'relativepath': 'LightlineRelativePath',
      \   'modified': 'LightlineModified',
      \   'readonly': 'LightlineReadonly',
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'LightlineLinterWarnings',
      \   'linter_errors': 'LightlineLinterErrors',
      \ },
      \ 'component_type': {
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error'
      \ },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ }

" Custom functions
function! LightlineBranch()
  if &ft == 'nerdtree'
    return ''
  endif
  let branch = fugitive#head()
  return branch !=# '' ? ' ' . branch : ''
endfunction

function! LightlineMode()
  if &ft == 'nerdtree'
    return '« NERD »'
  endif
  return '« ' . lightline#mode() . ' »'
endfunction

function! LightlineFileEncodingFormat()
  if &ft == 'nerdtree'
    return ''
  endif
  let encoding = &fenc!=#""?&fenc:&enc
  let format = &ff
  return encoding . '[' . format . ']'
endfunction

function! LightlineLineInfo()
  if &ft == 'nerdtree'
    return ''
  endif
  return line('.').':'. col('.')
endfunction

function! LightlinePercent()
  if &ft == 'nerdtree'
    return ''
  endif
  return line('.') * 100 / line('$') . '%'
endfunction

function! LightlineFiletype()
  if &ft == 'nerdtree'
    return ''
  endif
  return &ft !=# "" ? &ft : "no ft"
endfunction

function! LightlineRelativePath()
  if &ft == 'nerdtree'
    return ''
  endif
  return expand("%")
endfunction

function! LightlineModified()
  if &ft == 'nerdtree'
    return ''
  endif
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  if &ft == 'nerdtree'
    return ''
  endif
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

" ALE integration

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

autocmd User ALELint call lightline#update()

augroup LightLineOnALE
  autocmd!
  autocmd User ALEFixPre   call lightline#update()
  autocmd User ALEFixPost  call lightline#update()
  autocmd User ALELintPre  call lightline#update()
  autocmd User ALELintPost call lightline#update()
augroup end
" -------------------------------------------------------------------------

" --------------------------------- Vim-Markdown-Preview --------------------------------

" Use Chrome
let vim_markdown_preview_browser='Google Chrome'

" Use github syntax
let vim_markdown_preview_github=1

" --------------------------------------------------------------------------

" --------------------------------- Vim-Go --------------------------------

" Highlight different language structs
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_build_constraints = 1

" disable the default mappings provided by the plugin
let g:go_def_mapping_enabled = 0

" Call goimports on save
let g:go_fmt_command = "goimports"

" Disable showing a location list when |'g:go_fmt_command'| fails
let g:go_fmt_fail_silently = 1

" Alternate toggles
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')              " Switch to test file
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')           " Vertical split with test file
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')            " Horizontal split with test file

" Show type info for word under the cursor
let g:go_auto_type_info = 1

" Highlight all uses of the identifier under the cursor
let g:go_auto_sameids = 1

" --------------------------------------------------------------------------

" --------------------------------- ALE -------------------------------

" Error sign in gutter
let g:ale_sign_error = '✗'

" Warning sign in gutter
let g:ale_sign_warning = '⚠'

" Warning sign color
highlight ALEWarningSign guifg=#8f9627
highlight ALEErrorSign guifg=#dd1c1c

" Format for echo messages
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Navigate between errors
nmap <silent> [a <Plug>(ale_previous_wrap)
nmap <silent> ]a <Plug>(ale_next_wrap)

" Do not run when typing
let g:ale_lint_on_text_changed = 'never'

" Show 5 lines of errors (default: 10)
let g:ale_list_window_size = 5

" Disable highlighting
let g:ale_set_highlights = 0

" --------------------------------------------------------------------------

" --------------------------------- FZF  -------------------------------

" Fuzzy find files
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <c-p> :Files<CR>

" Fuzzy find buffers
nnoremap <silent> <leader>b :Buffers<CR>

" Search for a string in all files
nnoremap <silent> <leader>s :execute 'Rg ' . input('Search for --> ')<CR>

" Search the word under the cursor
nnoremap <silent> <leader>c :execute 'Rg' expand('<cword>')<CR>

" Layout config
let g:fzf_layout = { 'down': '~30%' }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Show preview when searching files
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Use Rg for searching for contents and show preview
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!vendor/" '.shellescape(<q-args>), 1,
  \    fzf#vim#with_preview({'down': '60%', 'options': '--bind alt-down:preview-down --bind alt-up:preview-up'},'right:50%', '?'),
  \   <bang>0)

" Extra key bindings
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }

" hide the statusline of the containing buffer
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" --------------------------------------------------------------------------

" --------------------------------- Coc  -------------------------------

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes



" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Confirm completion
inoremap <silent><expr> <C-o> pumvisible() ? coc#_select_confirm() :
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" --------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" opening files
Plug 'preservim/nerdtree'
" theme
Plug 'joshdick/onedark.vim'
" git
Plug 'airblade/vim-gitgutter'
" syntax
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
" async linting
Plug 'w0rp/ale'
" language client
"Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'npm install -g javascript-typescript-langserver@latest && bash install.sh' }
" status bar
Plug 'vim-airline/vim-airline'

" autocomplete in editor
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', {'do': 'npm install -g tern@latest', 'for': ['javascript', 'typescript']}

"autocomplete for brackets
Plug 'jiangmiao/auto-pairs'

" make me prettier 
Plug 'prettier/vim-prettier'

"" fuzzy searching for things
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim', { 'do': { -> fzf#install() } }

" markdown
Plug 'plasticboy/vim-markdown'

" avro syntax
Plug 'gurpreetatwal/vim-avro'

"" ctags
Plug 'ludovicchabant/vim-gutentags'
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

" window resizing automatically
"Plug 'camspiers/animate.vim'
"Plug 'camspiers/lens.vim'

" random languages
Plug 'sheerun/vim-polyglot'

" terraform
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'

call plug#end()

" turn syntax highlighting on 
syntax on
filetype on
filetype indent on
filetype plugin on

" auto update file while editing
set autoread

" enable 24 bit colors
set termguicolors               

" color scheme dawg
set background=dark
colorscheme onedark

" autocomplete
let g:deoplete#enable_at_startup = 1

" vim-javascript
set conceallevel=1
let g:javascript_conceal_function = "ƒ"
let g:javascript_plugin_jsdoc = 1

" shows lines below cursor while scrolling
set scrolloff=8

" encoding things
set encoding=utf-8

" enable mouse control
set mouse=a

" numbers on lines and relative numbers
set number relativenumber

" show partial command in status line
set showcmd

" show matching brackets
set showmatch

" for searching, case insensitive set ignorecase
set incsearch

" autocomplete commands
set wildmenu

" wrap text 
set wrap

" indenting
set autoindent
set expandtab
set smarttab
set shiftwidth=2
set tabstop=8
set softtabstop=2

" Plugin Config
 
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root  = ['package.json', '.git', '.hg', '.svn']
let g:gutentags_cache_dir = expand('~/.gutentags_cache')
let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_extra_args = ['--tag-relative=yes', '--fields=+ailmnS']
let g:gutentags_ctags_exclude = [
\  '*.git', '*.svn', '*.hg',
\  'cache', 'build', 'dist', 'bin', 'node_modules', 'bower_components',
\  '*-lock.json',  '*.lock',
\  '*.min.*',
\  '*.bak',
\  '*.zip',
\  '*.pyc',
\  '*.class',
\  '*.sln',
\  '*.csproj', '*.csproj.user',
\  '*.tmp',
\  '*.cache',
\  '*.vscode',
\  '*.pdb',
\  '*.exe', '*.dll', '*.bin',
\  '*.mp3', '*.ogg', '*.flac',
\  '*.swp', '*.swo',
\  '.DS_Store', '*.plist',
\  '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png', '*.svg',
\  '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
\  '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx', '*.xls',
\]


"ALE Fix Settings
let g:ale_fix_on_save=1
let g:ale_fixers = {
\   'sass': ['prettier', 'remove_trailing_lines'],
\   'javascript': ['eslint', 'remove_trailing_lines'],
\   'python': ['trim_whitespace', 'remove_trailing_lines'],
\   'terraform': ['terraform', 'trim_whitespace'],
\ }
let g:ale_sign_column_always=1
let g:ale_javascript_eslint_use_global=1
let g:ale_javascript_eslint_options='--cache'
"let g:ale_javascript_eslint_executable='eslint_d'
let g:ale_javascript_eslint_executable='eslint'


"" LanguageClient Settings
"set hidden
"let g:LanguageClient_autoStart = 1
"let g:LanguageClient_diagnosticsList = "Location"      " use Location list instead of window list as errors are scoped to one file

" Minimal LSP configuration for JavaScript
"let g:LanguageClient_serverCommands = {
"      \ 'javascript.jsx': ['javascript-typescript-stdio'],
"      \ 'typescript': ['javascript-typescript-stdio'],
"      \ }
"autocmd FileType javascript.jsx setlocal omnifunc=LanguageClient#complete
"nnoremap <F5> :call LanguageClient_contextMenu()<CR>
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>

"" fzf + ripgrep
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

nnoremap <silent> <c-p> :Files<CR>
nnoremap <silent> <c-f> :Tags<CR>

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
""

set backspace=indent,eol,start

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" opens nerd tree if no file is specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" use F2 to open/close NerdTree
map <F2> :NERDTreeToggle<CR>

"" Tagbar settings
nmap <F3> :TagbarToggle<CR>

" Git stuff
"function! GitStatus()
"  let [a,m,r] = GitGutterGetHunkSummary()
"  return printf('+%d ~%d -%d', a, m, r)
"endfunction

" terraform settings
let g:terraform_fmt_on_save=1

" Building Status Line
set statusline=
"set statusline+=%{GitStatus()}

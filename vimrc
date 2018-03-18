set termguicolors
syntax enable

set expandtab
set shiftwidth=4
set background=dark
set showmatch
set mouse=a
set hlsearch
set backspace=2

set wrap
"set tw=75
"set fo=cqt
set wm=0
setlocal foldcolumn=0


" mappings
let mapleader = " "
map - dd
map <C-n> :NERDTreeToggle<CR>
nmap oo o<Esc>k
map j gj
map k gk
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nmap <Leader>w :w<CR>
nmap <Leader>e :e#<CR>
nmap <Leader>b :b#<CR>
nmap <Leader>q :q<CR>
nmap <Leader>x :wq<CR>
nnoremap <Leader>f za

"----- writing -----
function! WordProcessorMode()
    set wrap linebreak nolist 
    set tw=0
    set fo=cqt
    set wm=0

    setlocal formatoptions=1 
    setlocal noexpandtab 
    setlocal spell spelllang=en_us 
    set complete+=s
    set formatprg=par
    setlocal linebreak 
    set nonumber

    imap <c-f> <c-g>u<Esc>[s1z=`]a<c-g>u
    nmap <Leader>s 1z=<c-o>

    " press map 't' to thesaurus
    let g:online_thesaurus_map_keys = 0
    nnoremap <Leader>t :OnlineThesaurusCurrentWord<CR>
endfu 
com! Writing call WordProcessorMode()


set noruler
" status line
function! WordCount()
  let s:old_status = v:statusmsg
  let position = getpos(".")
  exe ":silent normal g\<c-g>"
  let stat = v:statusmsg
  let s:word_count = 0
  if stat != '--No lines in buffer--'
    let s:word_count = str2nr(split(v:statusmsg)[11])
    let v:statusmsg = s:old_status
  end
  call setpos('.', position)
  return s:word_count 
endfunction

set laststatus=2
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=wc:%{WordCount()},
set statusline+=\ c:%c,     "cursor column
set statusline+=\ r:%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" ----- extensions -----
execute pathogen#infect()
filetype plugin indent on
" colorscheme carbonized-dark

colorscheme gruvbox
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_termcolors=256

let g:netrw_liststyle=3
let g:templates_empty_files = 1

"let g:markdown_syntax_conceal = 0
"let g:vim_markdown_folding_level = 6
"let g:vim_markdown_toc_autofit = 1
"let g:markdown_fold_style = 'stacked'



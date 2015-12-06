syntax enable

set expandtab
set shiftwidth=4
set background=dark
set showmatch
set iskeyword-=_
set mouse=a


" mappings
map - dd
map <C-n> :NERDTreeToggle<CR>
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

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

set noruler
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

" Use ranger as vim file manager
function! Ranger()
    " Get a temp file name without creating it
    let tmpfile = substitute(system('mktemp -u'), '\n', '', '')
    " Launch ranger, passing it the temp file name
    silent exec '!RANGER_RETURN_FILE='.tmpfile.' ranger'
    " If the temp file has been written by ranger
    if filereadable(tmpfile)
        " Get the selected file name from the temp file
        let filetoedit = system('cat '.tmpfile)
        exec 'edit '.filetoedit
        call delete(tmpfile)
    endif
    redraw!
endfunction

nmap <leader>r :call Ranger()<cr>


" extensions
execute pathogen#infect()
colorscheme gruvbox
filetype plugin indent on

let g:netrw_liststyle=3

autocmd FileType python setlocal shiftwidth=4 tabstop=4

autocmd FileType python compiler pylint
let g:pylint_show_rate = 0

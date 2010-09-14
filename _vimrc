set nocompatible
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

"Configurations
set tabstop=2 "set tabstop to 2 spaces
set shiftwidth=2 "indent level
set guifont=Consolas "set font to Consolas
set nowrap "do not wrap text
au GUIEnter * simalt ~x "maximize gvim window on startup
set ic "perform case insensitive searches
set smartindent "auto indent new lines
set nobackup "do not leave a .swp file behind
set noswapfile "do not create a .swp file
set number "show line numbers

"Mappings
map <F2> :NERDTreeToggle<CR>
imap <F2> <Esc> :NERDTreeToggle<CR>
map <C-F2> :NERDTreeMirror<CR>
imap <C-F2> <Esc> :NERDTreeMirror<CR>

nmap <C-tab> tabnext<CR>
nmap <C-S-tab> tabprevious<CR>
map <C-S-tab> :tabprevious<CR>
map <C-tab> :tabnext<CR>
imap <C-S-tab> <Esc>:tabprevious<CR>i
imap <C-tab> <Esc>:tabnext<CR>i
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>

map <C-Right> <C-W><Right>
imap <Esc><C-Right> <C-W><Right>
map <C-Left> <C-W><Left>
imap <Esc><C-Left> <C-W><Left>
map <C-Up> <C-W><Up>
imap <Esc><C-Up> <C-W><Up>
map <C-Down> <C-W><Down>
imap <Esc><C-Down> <C-W><Down>

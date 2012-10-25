set nocompatible                  " Must come first because it changes other options.
filetype off                      " required for vundle

set hidden
":options shows all possible options
":set on its own shows all non-default options 

" TODO: watch smash into vim for extra plugins
" TODO: rooter-vim on github searches up the directory tree for a .git directory, and sets that as the current directory

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'wincent/Command-T'
"Bundle 'mileszs/ack'

" possibly useful plugins, all of these are github repos:
" tpope/vim-fugitive -- git vim integration
" Lokaltog/vim-easymotion
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" wincent/Command-T -- requires vim compiled with ruby
" tpope/vim-rails -- rails helpers
" tpope/vim-markdown -- syntax highlighting for markdown
" garbas/vim-snipmate -- snippets

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set clipboard=unnamed             " use system clipboard

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set mouse=a                       " mouse enabled in terminal
set cursorline


" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set softtabstop=2                " Global soft tab width.
set shiftwidth=2                 " Indent and dedent increments
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time

" colorscheme topfunky-light
colorscheme vividchalk


"""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetypes
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Associate *.thor with ruby filetype
au BufRead,BufNewFile *.thor set filetype=ruby

" Associate *.txx with C++ filetype
au BufRead,BufNewFile *.txx set filetype=cpp

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
" au BufRead,BufNewFile *_spec.rb compiler rspec

" Set filetype-specific whitespace
au FileType python setlocal ts=4 sts=4 sw=4 expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""

" search tree with <Leader>t
"nmap <silent> <Leader>t :CommandT<CR>

" search buffers with <Leader>r
"nmap <silent> <Leader>r :CommandTBuffer<CR>

" Window mappings.
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove<cr>

" buffer next/prev
nnoremap <leader>z :bp<CR>
nnoremap <leader>x :bn<CR>

" swap colon and semicolon for easier commands
nnoremap ; :

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>
                                
                                
"""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""
nmap ,n :NERDTreeToggle<CR>
let NERDTreeWinSize = 30

" single click to open directory or file
let NERDTreeMouseMode = 3

" automatically open NERDTree
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
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
"""""""""""""""""""""""""""""""""""""""""""""""""""

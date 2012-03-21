set nocompatible                  " Must come first because it changes other options.

set hidden
":options shows all possible options
":set on its own shows all non-default options 

" TODO: watch smash into vim for extra plugins
" TODO: rooter-vim on github searches up the directory tree for a .git directory, and sets that as the current directory

" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'

" possibly useful plugins, all of these are github repos:
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
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time

" Or use vividchalk
" colorscheme topfunky-light
colorscheme vividchalk

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

" swap colon and semicolon for easier commands
nnoremap ; :

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec

" Associate *.thor with ruby filetype
au BufRead,BufNewFile *.thor set filetype=ruby

" Associate *.thor with ruby filetype
au BufRead,BufNewFile *.txx set filetype=cpp


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

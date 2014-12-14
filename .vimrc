" Essential Configuration {
    set nocompatible              " be iMproved, required
    filetype off                  " required
" }

" General Setting {

    syntax on
    set background=dark         " Assume a dark background
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8
    set hlsearch

    set number
    set numberwidth=1
    " set TAB to four blank
    set expandtab
    set shiftwidth=4
    set tabstop=4
    set completeopt=menuone,longest,preview " Insert Completion
    set pumheight=6  " Keep a small completeion window
    " set backspace=4  " Allow backspacing over autoindent, EOL, and BOL
    set autoindent              " always set autoindenting on
    set foldmethod=indent       " allow us to fold on indents
    set ls=2                    " allways show status line
 

    set ignorecase smartcase   " ignore case when search
    set foldenable   " set fold
    set showmode     " Display the current mode
    set cursorline   " Highlight current line
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too

    " highlight clear SignColumn " SignColumn should match background
    " highlight clear LineNr " Current line number row will have same background

     if has('statusline')
         " set laststatus=2
         
         set statusline=%<%f\    " Filename
         set statusline+=%w%h%m%r " Options
         set statusline+=\ [%{&ff}/%Y]   " Filetype
         set statusline+=\ [%{getcwd()}] " Current dir
         set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
     endif
     
    set autochdir     " automatically change current directory to directory where the open file located
    " Set Map {
   
        let mapleader=","
        let g:mapleader=","

    " } 
    map <C-n> :NERDTreeToggle<CR> " use ctrl+n to open NerdTree
    " encoding {
        set encoding=utf-8
        set fileencoding=utf-8
        set fileencodings=utf-8,prc
    " }
    
    " Setting up the directories {
    " [note] please add Undotree plugin, you can watch all your modification.
        set backup                  " Backups are nice ...
        set backupdir=~/.vim/backupdir
        if has('persistent_undo')
            set undodir=~/.vim/undodir
            set undofile                " So is persistent undo ...
            set undolevels=1000         " Maximum number of changes that can be undone
            set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
        endif
    " }

" }
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
" Plugin 'shougo/neocomplcache.vim' " need version no less than than 7.2
Plugin 'scrooloose/nerdtree'
Plugin 'mbbill/undotree'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/phpfolding.vim'     " get from www.vim.org
Plugin 'vim-scripts/project.tar.gz'
Plugin 'vim-scripts/PDV'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'shawncplus/phpcomplete.vim'
" Plugin 'majutsushi/tagbar' " vim 7.0.237 is lower than its require
Plugin 'gcmt/wildfire.vim'
" Plugin 'Valloric/YouCompleteMe' " vim7.3 is needed
Plugin 'godlygeek/tabular'
Plugin 'bling/vim-airline'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" *** Plugin **** PHP-Folding {
    let php_folding = 1
" }

" *** Plugin NerdTree *** {
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" }

" Set Fold of c and cpp {
    autocmd FileType c,cpp  setl fdm=syntax | setl fen 
" }

" *** Plugin **** CTRL_P Plugin {
    let g:ctrlp_map = '<c-p>' " invoke CtrlP in Normal mode
    let g:ctrlp_cmd = 'CtrlP' " Set the default opening command to use when pressing the above mapping
    let g:ctrlp_working_path_mode = 'ra' " set its local working directory
    let g:ctrlp_open_multiple_files = 'v' " vetically split window
   " Exclude files {
        set wildignore+=*/tmp/*,*.so,*.swp,*.zip
        let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
        " let g:ctrlp_custom_ignore = {
        "     \ 'dir': '\v[\/]\.(git|hg|svn)$',
        "     \ 'file': '\v[\/]\.(exe|so|dll)$',
        "     \ }
   " }
" }

" *** Plugin **** Vim UI {
     if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
         let g:solarized_termcolors=256
         let g:solarized_termtrans=1
         let g:solarized_contrast="normal"
         let g:solarized_visibility="normal"
         colorscheme solarized
     endif
" }


" *** Plugin ** Air Line ** {
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'
" }

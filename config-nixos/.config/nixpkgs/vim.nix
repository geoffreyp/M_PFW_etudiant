{pkgs}:

pkgs.vim_configurable.customize {

  name = "vim";

  vimrcConfig.customRC = ''
    " Use Vim settings, rather then Vi settings. 
    " This setting must be as early as possible, as it has side effects.
    set nocompatible

    " Leader - ( Spacebar )
    let mapleader = " "

    " display options
    set t_Co=256
    set gfn=Monospace\ 13
    syntax on
    colorscheme burnttoast256

    set number
    set cursorline
    set colorcolumn=80
    set ruler         " show the cursor position all the time
    set showcmd       " display incomplete command

    " search
    set hlsearch
    set incsearch     " do incremental searching
    set ignorecase    " case insensitive searching (unless specified)
    set smartcase

    " backup and undo
    set undofile
    set history=100

    " completion
    set wildmode=longest:full,full
    set wildmenu

    " mouse and scrolling
    set mouse=a
    set scrolloff=8 

    " tabulation
    set tabstop=2
    set expandtab
    set shiftwidth=2

    " Open new split panes to right and bottom, which feels more natural
    set splitbelow
    set splitright

    " HTML Editing
    set matchpairs+=<:>

    " Quicker window movement
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-h> <C-w>h
    nnoremap <C-l> <C-w>l

    " Always use vertical diffs
    set diffopt+=vertical

    " resize panes
    nnoremap <silent> <Right> :vertical resize +5<cr>
    nnoremap <silent> <Left> :vertical resize -5<cr>
    nnoremap <silent> <Up> :resize +5<cr>
    nnoremap <silent> <Down> :resize -5<cr>

    " navigate through compilation errors
    nmap <F4> :cp<cr>
    nmap <F5> :cn<cr>

    " spell checking
    map <silent> <F10> "<Esc>:silent setlocal spell! spelllang=fr<CR>"
    map <silent> <F11> "<Esc>:silent setlocal spell! spelllang=en<CR>"
    nnoremap <F8> [s
    nnoremap <F9> ]s
    nnoremap <F1> z=

    " delete buffer without losing the split window
    nnoremap <C-c> :bp\|bd #<CR>

    " ---- plugins ----- "

    " airline
    set laststatus=2

    " nerdtree
    nmap <F6> :NERDTreeToggle<CR>

    " tagbar
    nmap <F7> :TagbarToggle<CR>

    " vim-buffergator
    nmap <F2> gb
    nmap <F3> gB

    " youcompleteme
    let g:ycm_global_ycm_extra_conf = "~/.config/nixpkgs/ycm_extra_conf2.py"
    "let g:ycm_python_binary_path = '~/.nix-profile/bin/python3'

    '';

  vimrcConfig.packages.myVimPackage = with pkgs.vimPlugins; {
    start = [ 
      airline 
      easymotion
      nerdtree
      tagbar
      vim-buffergator
      vim-nix
      youcompleteme 
      vim-colorschemes
    ];
  };

}


" Vundle {

    set nocompatible              " be iMproved, required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    Plugin 'majutsushi/tagbar'
    Plugin 'scrooloose/nerdtree'
    Plugin 'jistr/vim-nerdtree-tabs'
    Plugin 'fatih/vim-go'
    Plugin 'cespare/vim-toml'
    Plugin 'fholgado/minibufexpl.vim'
    Plugin 'guns/xterm-color-table.vim'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'hukl/Smyck-Color-Scheme'
    Plugin 'octol/vim-cpp-enhanced-highlight'
    Plugin 'vim-scripts/TaskList.vim'
    Plugin 'python-mode/python-mode', { 'branch': 'develop' }
    Plugin 'tpope/vim-markdown'
    Plugin 'xolox/vim-misc'  " for vim-lua-ftplugin
    Plugin 'xolox/vim-lua-ftplugin'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    "Plugin 'Lokaltog/vim-powerline'
    Plugin 'powerline/fonts'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'tacahiroy/ctrlp-funky'  " Search functions
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    "Plugin 'jiangmiao/auto-pairs'
    Plugin 'tpope/vim-surround'
    Plugin 'ntpeters/vim-better-whitespace'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'rdnetto/YCM-Generator'
    Plugin 'terryma/vim-multiple-cursors'  " Sublime text style multiple selections
    Plugin 'vim-scripts/DrawIt'
    Plugin 'matchit.zip'

    " All of your Plugins must be added before the following line
    call vundle#end()            " required

" }


" Environment {

    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win32') || has('win64'))
        endfunction
    " }

    " Basics {
        set nocompatible        " Must be first line
        if !WINDOWS()
            set shell=/bin/sh
        endif
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if WINDOWS()
          set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }

    " Arrow Key Fix {
        " https://github.com/spf13/spf13-vim/issues/780
        if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
            inoremap <silent> <C-[>OC <RIGHT>
        endif
    " }

" }


" Tagbar
let g:tagbar_width = 35
let g:tagbar_left = 1
let g:tagbar_sort = 0

" Nerdtree
let NERDTreeWinPos = "right"
"let g:NERDTreeNodeDelimiter = "\u00a0"

" AirLine
let g:airline_powerline_fonts = 1

" Golang
let g:go_version_warning = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 0
let g:go_mod_fmt_autosave = 0
let g:go_imports_autosave = 0
let g:go_play_open_browser = 0
let g:go_get_update = 0

" Python
let g:pymode_options = 0
let g:pymode_trim_whitespaces = 0

" CtrlP
let g:ctrlp_map = '<C-i>'

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-[>"
"let g:UltiSnipsJumpBackwardTrigger="<c-o>"

" Nerdcommenter
let g:mapleader = ","
let g:NERDSpaceDelims=1

" YCM
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_auto_hover = ''  " not display doc
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
nmap gc :YcmCompleter GoToDefinitionElseDeclaration<CR>


" Syntax and Indent
filetype plugin indent on
syntax on


" Color
syntax enable
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_visibility="normal"
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
colorscheme solarized
"colorscheme smyck

set colorcolumn=78
hi ColorColumn ctermbg=187 ctermfg=NONE guibg=NONE guifg=NONE

set cursorline  " must after 'Syntax and Indent'
hi CursorLine ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

" line number color: light
"hi LineNr ctermbg=187 ctermfg=darkgrey guibg=NONE guifg=NONE
"hi CursorLineNr ctermbg=187 ctermfg=red guibg=NONE guifg=NONE

" line number color: dark
hi LineNr ctermbg=012 ctermfg=darkgrey guibg=NONE guifg=NONE
hi clear CursorLineNr
hi CursorLineNr ctermbg=012 ctermfg=187 guibg=NONE guifg=NONE

"set cursorcolumn
"hi CursorColumn cterm=NONE ctermbg=lightgray ctermfg=black guibg=NONE guifg=NONE
"hi Pmenu ctermbg=cyan ctermfg=darkgrey guibg=darkblue guifg=white

" comment color
hi Comment ctermfg=95

" minibufexpl
" hi MBENormal              ctermfg=darkgrey
" hi MBEChanged             ctermfg=red
" hi MBEVisibleNormal       ctermfg=blue
" hi MBEVisibleChanged      ctermfg=cyan
" hi MBEVisibleActiveNormal ctermfg=cyan


" Key map
nmap wm :TagbarToggle<cr>
nmap wf :NERDTreeToggle<cr>
nmap wt :TaskList<cr>
nmap j gj
nmap k gk


" encoding
set encoding=utf-8
let &termencoding=&encoding
set fileencodings=utf-8,gbk,gb2312,gb18030,big5,cp1256,cp1253,cp10006,cp20423,cp28597,cp1255,cp1256


" Line number and Ruler
set number
set numberwidth=5
set ruler


" Tab
set shiftwidth=4
set expandtab
set tabstop=8
"set cindent


" Fold
nmap fmi :set foldmethod=indent<cr>
nmap fmm :set foldmethod=marker<cr>


" Ctags
set tags=tags;
nmap <c-]> g<c-]>


" Cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <C-_>0 :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>1 :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>3 :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>4 :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>6 :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>7 :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>8 :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>2 :cs find d <C-R>=expand("<cword>")<CR><CR>


" For mutt
"set tw=99999999
autocmd BufEnter mutt-* 0r ~/mail/files/signature


" vim-better-whitespace
nmap ws :ToggleWhitespace<CR>
hi ExtraWhitespace ctermbg=grey


" Other
"set updatetime=500
set incsearch
set backspace=indent,eol,start


" Jump to the last position when reopening a file
if has("autocmd")
    " In text files, always limit the width of text to 78 characters
    " autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

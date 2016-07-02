set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'whatyouhide/vim-gotham'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'moll/vim-node'
Plugin 'othree/html5-syntax.vim'
Plugin 'othree/html5.vim'
Plugin 'groenewege/vim-less'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'scrooloose/nerdtree'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-obsession'
Plugin 'mattn/emmet-vim'

call vundle#end()            " required

filetype plugin indent on    " required

set number
set expandtab
set tabstop=4
set shiftwidth=4
set t_Co=256
syntax on
set background=dark
colorscheme solarized
set backspace=indent,eol,start

" vim-less
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd FileType less set omnifunc=csscomplete#CompleteCSS

" javascript-libraries-syntax
let g:used_javascript_libs = 'underscore,react'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint'


let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

imap <C-c> <CR><Esc>O


" open nerdtree when not specify file path
function! StartUpNerdTree()
	    if 0 == argc()
		 NERDTre  
	    end
endfunction

" js format
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>


set rtp+=~/mydeps/powerline/powerline/bindings/vim/


" Always show statusline
set laststatus=2

filetype plugin indent on " Enable automatic filetype detection, filetype-specific plugins/indentation

set autoread

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugin 'shougo/neocomplete.vim'
"Plugin 'taglist.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'juneedahamed/vc.vim'
Plugin 'highlight.vim'
Plugin 'mileszs/ack.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'SyntaxAttr.vim'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'tpope/vim-commentary'
Plugin 'bogado/file-line'
Plugin 'chromium/vim-codesearch'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive.git'
Plugin 'inkarkat/vim-mark'
Plugin 'vim-colors-pencil'


call vundle#end()
filetype plugin indent on

set hidden " for chromium/vim-codesearch
let g:codesearch_source_root = '~/opera/work/chromim/src'
so ~/opera/work/chromium/src/tools/vim/filetypes.vim
so ~/opera/work/chromium/src/tools/vim/clang-format.vim
"so ~/opera/work/chromium/src/tools/vim/ninja-build.vim

g:ycm_confirm_extra_conf



"colorscheme zenburn_modified
"colorscheme pacific
colorscheme pencil
"set background=dark
set background=light
let g:pencil_neutral_code_bg = 1
hi Normal ctermbg=white

set pastetoggle=<F4>
set noswapfile "slow past possible workaround
let g:ackprg = 'ag --vimgrep'
"let g:ackprg = 'ag --nogroup --nocolor --column'
"hi StatusLineNC ctermbg=0
"hi StatusLine ctermfg=0
set nocp
syn on
set bs=2
set t_Co=256
set nu
set autoindent
set ruler
set cursorline
set hls
filetype plugin indent on
set nobackup                    " nie trzymaj kopii zapasowych, u.ywaj wersji
set showcmd
set wildmenu                    " wy.wietlaj linie z menu podczas dope.niania
set showmatch                   " pokaz otwieraj.cy nawias gdy wpisze zamykaj.cy
set so=5                        " przewijaj juz na 5 linii przed ko.cem
"set statusline=%y[%{&ff}]\ \ ASCII=\%03.3b,HEX=\%02.2B\ %=%m%r%h%w\ %t%*\ %l:%v\ (%p%%)
set laststatus=2                " zawsze pokazuj lini. statusu
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#whitespace#enabled = 1
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])
set mouse=a
set tabstop=2 shiftwidth=2 expandtab
set smartcase
set ignorecase
set runtimepath^=~/.vim/bundle/ctrlp.vim
set ttym=urxvt
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
vmap <leader>y :w! /tmp/vitmp.mz<CR>
nmap <leader>p :r! cat /tmp/vitmp.mz<CR>
augroup vimrc
  autocmd QuickFixCmdPost * botright copen 8
augroup END
noremap <F9> :call asyncrun#quickfix_toggle(8)<cr>


set tags+=cTAGS
execute "set tags+=".system("tagdir"). "/tags"

"source ~/.vim/AnsiEsc_v2.vim
syntax on
"au BufRead,BufNewFile *.ttcn* set filetype=ttcn
"au BufNewFile,BufRead *.LOG,*.out  setf out
"au BufNewFile,BufRead *.k3.txt  setf log
"au! Syntax ttcn source ~/.vim/syntax/ttcn.vim

autocmd FileType text setlocal textwidth=78
set hlsearch
set formatoptions=l
set foldcolumn=1
"let g:indentLine_char = '⋮'
" Vim
" let g:indentLine_color_term = 239
"
" "GVim
" let g:indentLine_color_gui = '#A4E57E'
"
" " none X terminal
" let g:indentLine_color_tty_light = 7 " (default: 4)
" let g:indentLine_color_dark = 1 " (default: 2)

set foldmethod=syntax
set foldlevelstart=99

"fun! ShowFuncName()
"	let lnum = line(".")
"	let col = col(".")
"	echohl ModeMsg
"	echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
"	echohl None
"	call search("\\%" . lnum . "l" . "\\%" . col . "c")
"endfun
"
"fun! GetTestCaseName()
"	let line_num = line('.')
"	let target_pattern = '\%<' . line_num  . 'l' . '\_^\s*testcase'
"	let target_line_num = search(target_pattern, 'bcWn')
"
"	let test_name=getline(target_line_num)
"	let test_name=substitute(test_name,"\\s*testcase\\s\\+\\(\\w\\+\\).*$","\\1", "")
"
"	echo 'line '.target_line_num.":".test_name
"	return test_name
"endfun
"
"let g:testcase_name="none"
"
"fun! RunCurrentTestCase()
"	let g:testcase_name=GetTestCaseName()
"    echom "Running " g:testcase_name
""    execute "!" "echo ========================::: executing: ".g:testcase_name
"	execute "!"."echo ========================::: executing: ".g:testcase_name.";read -p 'Are you sure [y/n]? [y]: ' -n 1 -r -t 3; [[ $REPLY =~ ^[Nn]$ ]] || ( ./build.sh clean && ./build.sh  -DTCSELECTOR=*".g:testcase_name." ) &> .build.out.tmp &"
"endfun
"
"fun! RunLastTestCase()
"    echom "Running " g:testcase_name
""    execute "!" "echo ========================::: executing: ".g:testcase_name
""    execute "!" ."./build.sh -DTCSELECTOR=*".g:testcase_name
"	execute "!"."echo ========================::: executing: ".g:testcase_name.";read -p 'Are you sure [y/n]? [y]: ' -n 1 -r -t 3; [[ $REPLY =~ ^[Nn]$ ]] || ( ./build.sh clean && ./build.sh  -DTCSELECTOR=*".g:testcase_name." ) &> .build.out.tmp &"
"
"endfun
"
"imap <S-F9> <Esc> :w <bar> call RunCurrentTestCase() <CR>
"imap <F9> <Esc> :w <bar> call RunLastTestCase() <CR>
"
"map <S-F9> :w <bar> call RunCurrentTestCase() <CR>
"map <F9>  :w <bar> call RunLastTestCase() <CR>
"
"map <F2> :call Svndiff("next") <CR>
"map <F1> :call Svndiff("prev") <CR>
"

:map gb :VCBlame

let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_max_files = 1000000
let g:ctrlp_max_depth = 90
let g:ctrlp_user_command = 'find %s -type f'

let g:ctrlp_regexp = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30,results:100'
"let g:ctrlp_user_command = 'find %s/C_* -type f  ! -wholename *.svn*  ! -wholename *.git* ! -name *.o ! -name *.cmd ! -name *.pyc ! -name *.swp'
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>



"au BufAdd,BufNewFile * nested tab sball
map     <C-Q>       :confirm bdelete<CR>
map <2-LeftMouse> :exe "tag ". expand("<cword>")<CR>
"map <silent> <F12> <C-o>:set syntax=robot<CR>
nmap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 63
autocmd VimEnter * nested :TagbarOpen
"imap <silent> <F8> <C-o>:TlistToggle<CR>
"let Tlist_Compact_Format = 1
"let Tlist_File_Fold_Auto_Close = 1
"let Tlist_Auto_Highlight_Tag = 1
"let Tlist_Use_SingleClick = 1
"let Tlist_Display_Tag_Scope = 0
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_Enable_Fold_Column = 0
"let Tlist_Sort_Type = "name"
"let Tlist_Use_Right_Window = 0
"let Tlist_WinWidth = 40
"let Tlist_Auto_Open = 1


" Add highlighting for function definition in C++
"function! EnhanceCppSyntax()
"  syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
"  hi def link cppFuncDef Special
"endfunction

"autocmd Syntax cpp call EnhanceCppSyntax()

" FIX FOR MIXED LINE STYLE
"autocmd BufReadPost * nested
"      \ if !exists('b:reload_dos') && !&binary && &ff=='unix' && (0 < search('\r$', 'nc')) |
"      \   let b:reload_dos = 1 |
"      \   e ++ff=dos |
"      \ endif

function! HighlightRepeats() range
  let lineCounts = {}
  let lineNum = a:firstline
  while lineNum <= a:lastline
    let lineText = getline(lineNum)
    if lineText != ""
      let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
    endif
    let lineNum = lineNum + 1
  endwhile
  exe 'syn clear Repeat'
  for lineText in keys(lineCounts)
    if lineCounts[lineText] >= 2
      exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
    endif
  endfor
endfunction
command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()

"map F5 as header/source CtrlP helper
nmap <F5> :let g:ctrlp_default_input = substitute(expand('%:t:r'), 'Test', '', '') \|
      \ call ctrlp#init(0) \| unlet g:ctrlp_default_input<CR>
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1

"autocmd VimEnter,ColorScheme * :hi cCustomAngleBrackets ctermfg=189
"autocmd VimEnter,ColorScheme * :hi IndentGuidesOdd  ctermbg=235
"autocmd VimEnter,ColorScheme * :hi IndentGuidesEven ctermbg=236
"autocmd VimEnter,ColorScheme * :hi Function         ctermfg=117
"autocmd VimEnter,ColorScheme * :hi cCustomClass     ctermfg=159
"autocmd VimEnter,ColorScheme * :hi cinclude         ctermfg=6
"autocmd VimEnter,ColorScheme * :hi cCustomMemVar    ctermfg=115
"autocmd VimEnter,ColorScheme * :hi String           ctermbg=234
"autocmd VimEnter,ColorScheme * :hi Number           ctermfg=121 ctermbg=0
"autocmd VimEnter,ColorScheme * :hi Repeat           ctermfg=217 cterm=bold
"autocmd VimEnter,ColorScheme * :hi cppAccess        ctermfg=122 cterm=underline
"autocmd VimEnter,ColorScheme * :hi cConditional     ctermfg=14  cterm=bold
"autocmd VimEnter,ColorScheme * :hi cformat          ctermfg=219 ctermbg=0
"autocmd VimEnter,ColorScheme * :hi Visual           ctermbg=238 ctermfg=NONE cterm=bold
autocmd VimEnter,ColorScheme * :hi Normal           ctermbg=NONE
autocmd VimEnter,ColorScheme * :hi Todo             ctermfg=10  cterm=underline
"
"autocmd VimEnter,ColorScheme * :hi VertSplit ctermfg=DarkGray ctermbg=NONE
set fillchars=vert:\│

set colorcolumn=81

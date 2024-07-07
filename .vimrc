" Path
" ~/.zshrc
" ~/.aliasrc
" ~/.functionrc

" 파일에 따른테마설정
"au BufReadPost,BufNewFile *.*rc colorscheme slate
" 파일명에 대해 파일타입설정
"au BufNewFile,BufRead *.*rc set filetype=rc

au BufRead,BufNewFile .aliasrc,.functionrc set filetype=sh
"아래 방식으로 하면 여러번 버퍼전환시 specific 설정으로 수렴된다. 
"au BufReadPost,BufNewFile colorscheme desert 
"au BufReadPost,BufNewFile *rc colorscheme slate 

function! SetColorscheme()
    if expand('%:t') !~? '\v.*rc$'
        colorscheme jellybeans " for except .*rc
    else
        colorscheme slate " for .*rc
    endif
endfunction

" bufenter: 버퍼이벤트 발생시 발동
au BufEnter * call SetColorscheme()

"au BufEnter * if expand('%:t') !~? '\v.*rc$' | colorscheme jellybeans | else | colorscheme slate | endif

syntax on
filetype indent on

" Output the current syntax group
nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

"특정 키워드를 정의하고 강조하기 
"syntax keyword AliasKeyword alias
"highlight AliasKeyword guifg=Red




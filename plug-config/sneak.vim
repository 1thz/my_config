
let g:sneak#label = 1

" case insensitive sneak
"let g:sneak#use_ic_scs = 1

" press 's' will jump to the next instance of searched term
"let g:sneak#s_next = 1

" Change the colours
"highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
"highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow

" Cool prompts
" let g:sneak#prompt = ''
" let g:sneak#prompt = ''

" horizontal motion
" similar to quickscope
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" map f <Plug>Sneak_s
" map F <Plug>Sneak_S

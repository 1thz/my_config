"VSCode
function! s:split(...) abort
    let direction = a:1
    if a:0 == 2
      let file = a:2
      call VSCodeCall(direction == 'h' ? 'workbench.action.splitEditorDown' : 'workbench.action.splitEditorRight')
      call VSCodeExtensionNotify('open-file', expand(file), 'all')
    else
      call VSCodeCall(direction == 'h' ? 'workbench.action.splitEditorDown' : 'workbench.action.splitEditorRight')
    endif
endfunction

function! s:splitNew(...)
    let file = a:2
    call s:split(a:1, file == '' ? '__vscode_new__' : file)
endfunction

function! s:closeOtherEditors()
    call VSCodeNotify('workbench.action.closeEditorsInOtherGroups')
    call VSCodeNotify('workbench.action.closeOtherEditors')
endfunction

function! s:closeOtherEditorsInGroup()
  call VSCodeNotify('workbench.action.closeOtherEditors')
endfunction


command! -complete=file -nargs=? Split call <SID>split('h', <q-args>)
command! -complete=file -nargs=? Vsplit call <SID>split('v', <q-args>)
command! -complete=file -nargs=? New call <SID>split('h', '__vscode_new__')
command! -complete=file -nargs=? Vnew call <SID>split('v', '__vscode_new__')
command! -bang Only if <q-bang> == '!' | call <SID>closeOtherEditors() | else | call VSCodeNotify('workbench.action.joinAllGroups') | endif
command! Other call <SID>closeOtherEditorsInGroup()

" nnoremap => Normal Mode
" xnoremap => Visual Mode

nnoremap <silent> <C-w>s :call <SID>split('h')<CR>
xnoremap <silent> <C-w>s :call <SID>split('h')<CR>

nnoremap <silent> <C-w>v :call <SID>split('v')<CR>
xnoremap <silent> <C-w>v :call <SID>split('v')<CR>

nnoremap <silent> <C-w>n :call <SID>splitNew('h', '__vscode_new__')<CR>
xnoremap <silent> <C-w>n :call <SID>splitNew('h', '__vscode_new__')<CR>

nnoremap <silent> <C-w>= :<C-u>call VSCodeNotify('workbench.action.evenEditorWidths')<CR>
xnoremap <silent> <C-w>= :<C-u>call VSCodeNotify('workbench.action.evenEditorWidths')<CR>

nnoremap O :call VSCodeNotify('editor.action.insertLineBefore')<CR>i
xnoremap O :call VSCodeNotify('editor.action.insertLineBefore')<CR>i

nnoremap o :call VSCodeNotify('editor.action.insertLineAfter')<CR>i
xnoremap o :call VSCodeNotify('editor.action.insertLineAfter')<CR>i

" Better Navigation
nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

" Vim folding doesn't work in VSCode
nnoremap zM :call VSCodeNotify('editor.foldAll')<CR>
nnoremap zR :call VSCodeNotify('editor.unfoldAll')<CR>
nnoremap zc :call VSCodeNotify('editor.fold')<CR>
nnoremap zC :call VSCodeNotify('editor.foldRecursively')<CR>
nnoremap zo :call VSCodeNotify('editor.unfold')<CR>
nnoremap zO :call VSCodeNotify('editor.unfoldRecursively')<CR>
nnoremap za :call VSCodeNotify('editor.toggleFold')<CR>
nnoremap zV :call VSCodeNotify('editor.foldAllExcept')<CR>
nnoremap zj :call VSCodeNotify('editor.gotoNextFold')<CR>
nnoremap zk :call VSCodeNotify('editor.gotoPreviousFold')<CR>
nnoremap <silent> z1 :call VSCodeNotify('editor.foldLevel1')<CR>
nnoremap <silent> z2 :call VSCodeNotify('editor.foldLevel2')<CR>
nnoremap <silent> z3 :call VSCodeNotify('editor.foldLevel3')<CR>
nnoremap <silent> z4 :call VSCodeNotify('editor.foldLevel4')<CR>
nnoremap <silent> z5 :call VSCodeNotify('editor.foldLevel5')<CR>
nnoremap <silent> z6 :call VSCodeNotify('editor.foldLevel6')<CR>
nnoremap <silent> z7 :call VSCodeNotify('editor.foldLevel7')<CR>

function! MoveCursor(direction) abort
  if(reg_recording() == '' && reg_executing() == '')
      return 'g'.a:direction
  else
      return a:direction
  endif
endfunction

nmap <expr> j MoveCursor('j')
nmap <expr> k MoveCursor('k')


" Bind C-/ to vscode commentary since calling from vscode produces double comments due to multiple cursors
" xnoremap <silent> <C-/> :call Comment()<CR>
" nnoremap <silent> <C-/> :call Comment()<CR>

nnoremap <silent> <C-w>_ :<C-u>call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>

nnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>
xnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>

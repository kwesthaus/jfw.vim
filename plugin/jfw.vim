""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jfw.vim
"
" Encourages you to Just Fucking Write or it starts undoing every 5
" seconds
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Avoid double source
if !exists('g:JFW_loaded')
    let g:JFW_loaded=1
    let b:timer_num=-1

    function! NextUndo(timer_num)
        normal! u
    endfunc

    "Writing has stopped
    "CursorHold does not repeat, so set a repeating timer to undo every
    "5 seconds along with a CursorMoved autocmd to stop undoing when
    "writing continues
    function! StartUndoing()
        let b:timer_num = timer_start(5000, 'NextUndo', {'repeat': -1})
        augroup JFW
            autocmd!
            autocmd CursorMovedI,CursorMoved <buffer> call StopUndoing()
        augroup END
    endfunc

    "Writing has resumed
    "Get rid of the undo timer and CursorMoved autocmd, set the
    "CursorHold autocmd
    function! StopUndoing()
        call timer_stop(b:timer_num)
        augroup JFW
            autocmd!
            autocmd CursorHoldI,CursorHold <buffer> call StartUndoing()
        augroup END
    endfunc

    "Start requested
    "Set the initial CursorHold autocmd
    function! StartJFW()
        let &updatetime=5000
        augroup JFW
            autocmd!
            autocmd CursorHoldI,CursorHold <buffer> call StartUndoing()
        augroup END
    endfunc

    "Stop requested
    "Stop the timer and remove all relevant autocmds
    "Don't have to check if a timer was running since timer_stop() 
    "doesn't care if b:timer_num exists
    function! EndJFW()
        call timer_stop(b:timer_num)
        augroup JFW
            autocmd!
        augroup END
    endfunc

    "Just Fucking Write
    command! JFW call StartJFW()
    "I Fucking Wrote
    command! IFW call EndJFW()

endif

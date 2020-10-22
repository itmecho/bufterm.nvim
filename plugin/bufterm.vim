let g:bufterm_shell = $SHELL
let g:bufterm_clear_on_exec = 1

command! -bang          BufTermToggle call bufterm#toggle()
command! -bang -nargs=+ BufTermExec   call bufterm#exec('<args>')

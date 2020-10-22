let g:bufterm_shell = $SHELL

command! -bang          BufTermToggle call bufterm#toggle()
command! -bang -nargs=+ BufTermExec   call bufterm#exec('<args>')

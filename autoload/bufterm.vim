function! bufterm#toggle()
    lua require('bufterm').toggle()
endfunction

function! bufterm#exec(cmd)
    call v:lua.require('bufterm').exec(a:cmd)
endfunction

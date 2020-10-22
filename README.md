# BufTerm

A simple neovim plugin to manage a terminal buffer for your session. It provides functionality to toggle the buffer as well as sending commands directly to the terminal.

This was created to learn more about neovim plugins and lua after watching [ThePrimeagen's video](https://www.youtube.com/watch?v=9L4sW047oow).

## Commands
| Command | Description | Example |
|---|---|---|
| `BufTermToggle` | Toggles the terminal buffer. When called from the terminal buffer, it will jump back to the previous buffer. | `:BufTermToggle` |
| `BufTermExec` | Jump to the terminal buffer and execute a command. If the terminal doesn't exist, a new one will be created. | `:BufTermExec cargo test` |

## Configuration
| Setting | Description | Default |
|---|---|---|
| `g:bufterm_shell` | The shell that will be used when creating a new terminal | `$SHELL` |
| `g:bufterm_clear_on_exec` | Controls whether or not to clear the screen before running the command passed to `BufTermExec` | `1` |

## Example keybindings
```vim
" Terminal Toggle
nnoremap <silent> <leader>tt <cmd>BufTermToggle<cr>
tnoremap <silent> <leader>tt <cmd>BufTermToggle<cr>

" Exec commands in the terminal
nnoremap <silent> <leader>cc <cmd>BufTermExec cargo clippy<cr>
nnoremap <silent> <leader>ct <cmd>BufTermExec cargo test<cr>
```

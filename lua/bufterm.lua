local bufh = nil
local job_id = nil
local api = vim.api

local function create_terminal_buffer()
    bufh = api.nvim_create_buf(false, false)
    api.nvim_set_current_buf(bufh)
    vim.fn.termopen(vim.g["bufterm_shell"])
    job_id = api.nvim_buf_get_var(bufh, "terminal_job_id")
    api.nvim_buf_set_option(bufh, 'buflisted', false)

    -- Can't find a way to set this only in the terminal buffer using the API
    -- nvim_buf_set_option says that rnu, nu, and signcolumn are invalid commands
    api.nvim_command('setlocal nornu nonu signcolumn=no')
end

local function toggle()
    if bufh == nil or api.nvim_buf_is_valid(bufh) == false then
        create_terminal_buffer()
        api.nvim_command('startinsert')
    elseif bufh == api.nvim_get_current_buf() then
        if api.nvim_get_mode().mode == 't' then
            local keys = api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true)
            api.nvim_feedkeys(keys, 'n', true)
        end

        local keys = api.nvim_replace_termcodes("<C-^>", true, false, true)
        api.nvim_feedkeys(keys, 'n', true)
    else
        api.nvim_set_current_buf(bufh)
        if api.nvim_get_mode().mode == 'n' then
            api.nvim_command('startinsert')
        end
    end
end

local function exec(cmd)
    if bufh == nil or api.nvim_buf_is_valid(bufh) == false then
        create_terminal_buffer()
        -- Sending the command in this new terminal can result in the command
        -- appearing before the prompt when the prompt takes a while to start up
    end

    api.nvim_set_current_buf(bufh)
    api.nvim_command('startinsert')
    vim.fn.chansend(job_id, cmd .. "\n")
end

return {
    toggle = toggle;
    exec = exec;
}

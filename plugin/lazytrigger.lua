-- You can use this loaded variable to enable conditional parts of your plugin.
if _G.LazyTriggerLoaded then
    return
end

_G.LazyTriggerLoaded = true

-- Useful if you want your plugin to be compatible with older (<0.7) neovim versions
if vim.fn.has("nvim-0.7") == 0 then
    vim.cmd("command! LazyTrigger lua require('lazytrigger').toggle()")
else
    vim.api.nvim_create_user_command("LazyTrigger", function()
        require("lazytrigger").toggle()
    end, {})
end

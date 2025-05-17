local status, context = pcall(require, "treesitter-context")
if not status then
    vim.notify("No nvim-treesitter-context")
    return
end

context.setup({
    enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 5,            -- How many lines the window should span. Values <= 0 mean no limit.
})

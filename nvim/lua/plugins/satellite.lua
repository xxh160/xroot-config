local status, satellite = pcall(require, "satellite")
if not status then
    vim.notify("No satellite")
    return
end

satellite.setup({
    current_only = false,
    winblend = 50,
    zindex = 40,
    excluded_filetypes = {},
    width = 2,
    handlers = {
        search = { enable = true },
        diagnostic = { enable = true },
        gitsigns = {
            enable = false,
            signs = { -- can only be a single character (multibyte is okay)
                add = '│',
                change = '│',
                delete = '-',
            },
        },
        marks = {
            enable = true,
            show_builtins = false, -- shows the builtin marks like [ ] < >
        },
    },
})

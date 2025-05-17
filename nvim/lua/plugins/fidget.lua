local status, fidget = pcall(require, "fidget")
if not status then
    vim.notify("No fidget")
    return
end

fidget.setup({
    notification = {
        window = {
            max_width = 80,
            x_padding = 2,
            y_padding = 1,
        },
    },
})

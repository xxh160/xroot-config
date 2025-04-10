local status, rose = pcall(require, "rose-pine")
if not status then
    vim.notify("No rose-pine")
    return
end

rose.setup({
    variant = "dawn",
})

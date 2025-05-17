local status, persisted = pcall(require, "persisted")
if not status then
    vim.notify("No persisted")
    return
end

persisted.setup({
    autostart = false,
    autoload = false
})

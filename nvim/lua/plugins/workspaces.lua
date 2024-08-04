local status, workspaces = pcall(require, "workspaces")
if not status then
    vim.notify("No workspaces")
    return
end

workspaces.setup({
    hooks = {
        open = "NvimTreeOpen",
    }
})

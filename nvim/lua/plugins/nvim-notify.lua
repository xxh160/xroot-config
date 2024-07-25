local status, notify = pcall(require, "notify")
if not status then
	vim.notify("No notify")
	return
end

notify.setup({
    timeout = 1000,
    background_colour = "#000000"
})

vim.notify = notify

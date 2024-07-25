local status, max = pcall(require, "maximize")
if not status then
	vim.notify("No maximize")
	return
end

max.setup({})

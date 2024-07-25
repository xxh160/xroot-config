local status, symbols = pcall(require, "symbols-outline")
if not status then
	vim.notify("No symbols-outline")
	return
end

symbols.setup()

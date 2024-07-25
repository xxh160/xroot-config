local status, nvim_surround = pcall(require, "nvim-surround")
if not status then
	vim.notify("No nvim-surround")
	return
end

nvim_surround.setup({})

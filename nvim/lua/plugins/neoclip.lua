local status, neoclip = pcall(require, "neoclip")
if not status then
	vim.notify("No neoclip")
	return
end

neoclip.setup({})

local status, onedark = pcall(require, "onedark")
if not status then
	vim.notify("No onedark")
	return
end

onedark.setup ({
    style = "warmer"
})

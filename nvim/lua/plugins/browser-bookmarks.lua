local status, browser_bookmarks = pcall(require, "browser_bookmarks")
if not status then
	vim.notify("No browser_bookmarks")
	return
end

browser_bookmarks.setup({
    selected_browser = "chrome",
})

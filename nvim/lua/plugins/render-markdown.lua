local status, md = pcall(require, "render-markdown")
if not status then
	vim.notify("No render-markdown")
	return
end

md.setup({
    -- Whether Markdown should be rendered by default or not
    start_enabled = false,
    -- Whether LaTeX should be rendered, mainly used for health check
    latex_enabled = false,
})

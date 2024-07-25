local status, neodim = pcall(require, "neodim")
if not status then
	vim.notify("No neodim")
	return
end

neodim.setup({
    alpha = 0.75,
    blend_color = "#000000",
    hide = {
        underline = true,
        virtual_text = true,
        signs = true,
    },
    regex = {
        "[uU]nused",
        "[nN]ever [rR]ead",
        "[nN]ot [rR]ead",
    },
    priority = 128,
    disable = {},
})

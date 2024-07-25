local status, lspsaga = pcall(require, "lspsaga")
if not status then
	vim.notify("No lspsaga")
	return
end

lspsaga.setup({
	ui = {
		border = "rounded",
		devicon = true,
		foldericon = true,
		title = true,
		expand = "⊞",
		collapse = "⊟",
		code_action = "💡",
		actionfix = " ",
		lines = { "┗", "┣", "┃", "━", "┏" },
		kind = nil,
		imp_sign = "󰳛 ",
	},
	code_action = {
		num_showcut = true,
		show_server_name = false,
		keys = {
			quit = "q",
			exec = "<cr>",
		},
	},
	lightbulb = {
		enable = true,
		enable_in_insert = true,
		sign = true,
		sign_priority = 40,
		virtual_text = true,
	},
	rename = {
		quit = "<C-c>",
		exec = "<cr>",
		mark = "x",
		confirm = "<cr>",
		in_select = true,
	},
	symbol_in_winbar = {
		enable = false,
		ignore_patterns = {},
		hide_keyword = true,
		show_file = true,
		folder_level = 2,
		respect_root = false,
		color_mode = true,
        left_offset = 5,
	},
	implement = {
		enable = true,
		sign = true,
		virtual_text = true,
		priority = 100,
	},
})

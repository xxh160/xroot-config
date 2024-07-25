local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	vim.notify("No nvim-tree")
	return
end

nvim_tree.setup({
    sort_by = "case_sensitive",
	-- Show git status 
	git = {
		enable = true,
	},
	-- File filter 
	filters = {
		dotfiles = false,
		custom = {
			"node_modules",
			".config",
			".idea",
		},
	},
    view = {
	    side = "left",
	    number = false,
	    relativenumber = false,
	    -- Show icons
	    signcolumn = "yes",
	    width = 25,
    },
	renderer = {
		root_folder_label = false,
		group_empty = true,
		icons = {
			show = {
				git = true,
				file = true,
				folder = true,
				folder_arrow = true,
			},
			glyphs = {
				bookmark = " ",
				folder = {
					arrow_closed = "⏵",
					arrow_open = "⏷",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "⌥",
					renamed = "➜",
					untracked = "★",
					deleted = "⊖",
					ignored = "◌",
				},
			},
		},
	},
	actions = {
		open_file = {
			-- 首次打开大小适配
			resize_window = true,
			-- 打开文件时关闭
			quit_on_open = false,
		},
	},
})



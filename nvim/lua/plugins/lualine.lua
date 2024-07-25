local status, lualine = pcall(require, "lualine")
if not status then
	vim.notify("No lualine")
	return
end

--- Lualine show sections:
--- +-------------------------------------------------+
--- | A | B | C                             X | Y | Z |
--- +-------------------------------------------------+
lualine.setup({
	options = {
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = " ", right = "" },
	},
	extensions = { "nvim-tree", "toggleterm" },
	sections = {
		lualine_a = {
			{
				"mode",
				icons_enabled = true,
			},
		},
		lualine_b = {
            {
                "filename",
                -- Displays file status (readonly status, modified status)
                file_status = true, 
                -- Display new file status (new file means no write after created)
                newfile_status = false, 
                -- 0: Just the filename
                -- 1: Relative path
                -- 2: Absolute path
                -- 3: Absolute path, with tilde as the home directory
                -- 4: Filename and parent dir, with tilde as the home directory
                path = 3, 
                -- Shortens path to leave 40 spaces in the window
                -- for other components. (terrible name, any suggestions?)
                shorting_target = 40, 
                symbols = {
                    -- Text to show when the file is modified
                    modified = "[+]", 
                    -- Text to show when the file is non-modifiable or readonly
                    readonly = "[-]", 
                    -- Text to show for unnamed buffers
                    unnamed = "[No Name]", 
                    -- Text to show for newly created file before first write
                    newfile = "[New]", 
                },
            },
		},
		lualine_c = {
            "branch",
            "diff",
		},
		lualine_x = {},

		lualine_y = {
            "%LL",
        },

		lualine_z = {
			"progress",
		},
	},
})


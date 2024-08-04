local status, ts = pcall(require, "telescope")
if not status then
    vim.notify("No telescope")
    return
end

ts.setup({
	extensions = {
		fzf = {
			-- False will only do exact matching
			fuzzy = true,
			-- Override the generic sorter with fzf
			override_generic_sorter = true,
			-- Override the file sorter with fzf
			override_file_sorter = true,
			-- Available: "ignore_case", "respect_case"
			case_mode = "respect_case",
		},
		emoji = {
			action = function(emoji)
				vim.api.nvim_put({ emoji.value }, "c", false, true)
			end,
		},
	},
})

ts.load_extension("fzf")
ts.load_extension("neoclip")
ts.load_extension("lsp_handlers")
ts.load_extension("emoji")
ts.load_extension("ui-select")
ts.load_extension("workspaces")

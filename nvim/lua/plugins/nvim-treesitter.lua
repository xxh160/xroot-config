local status, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	vim.notify("No nvim-treesitter/configs")
	return
end

nvim_treesitter.setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "org" },
    },
    ensure_installed = {
        "c",
        "cpp",
        "org",
        "lua",
        "java",
        "rust",
        "nix",
        "bash",
        "go",
        "diff",
        "scala",
        "python",
        "markdown",
        -- Highlight markdown code snippet 
        "markdown_inline",
        "rst",
        "latex",
        "vimdoc",
    },
})


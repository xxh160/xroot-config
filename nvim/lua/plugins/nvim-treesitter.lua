local status, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("No nvim-treesitter.configs")
    return
end

---@diagnostic disable: missing-fields
nvim_treesitter.setup({
    highlight = {
        enable = true,
        -- User vimtex
        disable = { "latex", },
        additional_vim_regex_highlighting = { "org" },
    },
    ensure_installed = {
        "html",
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
    auto_install = true,
    sync_install = false,
    ignore_install = {},
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ak"] = "@class.outer",
                ["ik"] = "@class.inner",
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
            },
            include_surrounding_whitespace = true,
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                -- ["]m"] = "@function.outer",
                -- ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["<leader>jm"] = { query = "@function.outer", desc = "Jump next method end" },
                ["<leader>jk"] = { query = "@class.outer", desc = "Jump next class end" },
                ["<leader>jb"] = { query = "@block.outer", desc = "Jump next block end" },
            },
            goto_previous_start = {
                ["<leader>jM"] = { query = "@function.outer", desc = "Jump prev method start" },
                ["<leader>jK"] = { query = "@class.outer", desc = "Jump prev class start" },
                ["<leader>jB"] = { query = "@block.outer", desc = "Jump prev block start" },
            },
            goto_previous_end = {
                -- ["[M"] = "@function.outer",
                -- ["[]"] = "@class.outer",
            },
        },
    }
})

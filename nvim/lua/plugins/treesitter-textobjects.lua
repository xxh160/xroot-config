require("nvim-treesitter-textobjects").setup({
    select = { lookahead = true, include_surrounding_whitespace = true },
    move = { set_jumps = true },
})
for key, query in pairs({ af = "@function.outer", ["if"] = "@function.inner", ak = "@class.outer", ik = "@class.inner", aa = "@parameter.outer", ia = "@parameter.inner" }) do
    vim.keymap.set({ "x", "o" }, key, function()
        require("nvim-treesitter-textobjects.select").select_textobject(query, "textobjects")
    end, { desc = "Select " .. query })
end
for key, query in pairs({ m = "@function.outer", k = "@class.outer", b = "@block.outer" }) do
    vim.keymap.set({ "n", "x", "o" }, "<leader>j" .. key, function()
        require("nvim-treesitter-textobjects.move").goto_next_end(query, "textobjects")
    end, { desc = "Next " .. query .. " end" })
    vim.keymap.set({ "n", "x", "o" }, "<leader>j" .. key:upper(), function()
        require("nvim-treesitter-textobjects.move").goto_previous_start(query, "textobjects")
    end, { desc = "Previous " .. query })
end

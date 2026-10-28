local ts = require("nvim-treesitter")
ts.setup({})
ts.install({ "go", "gomod", "gowork", "gosum", "python", "lua", "bash", "vim", "vimdoc", "query" })
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("xroot-treesitter", { clear = true }),
    callback = function(event)
        pcall(vim.treesitter.start, event.buf)
    end,
})

vim.diagnostic.config({
    virtual_text = false,
    signs = { text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.HINT] = "",
        [vim.diagnostic.severity.INFO] = "",
    } },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = { focusable = false, source = true, border = "rounded", header = "", prefix = "" },
})
vim.o.winborder = "rounded"
vim.lsp.log.set_level("WARN")

-- Native diagnostics mark unused code without overriding the Treesitter highlighter.
local function unused_highlight()
    vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { link = "Comment" })
end
vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("xroot-unused-highlight", { clear = true }),
    callback = unused_highlight,
})
unused_highlight()

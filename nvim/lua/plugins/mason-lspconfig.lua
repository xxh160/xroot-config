local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config("*", { capabilities = capabilities })
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("xroot-lsp", { clear = true }),
    callback = function(event)
        require("plugins.which-key").mapbuf_lsp(event.buf)
    end,
})
vim.lsp.config("lua_ls", {
    settings = { Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
        telemetry = { enable = false },
    } },
})
require("mason-lspconfig").setup({
    ensure_installed = { "gopls", "pylsp", "lua_ls", "bashls" },
    automatic_enable = { "gopls", "pylsp", "lua_ls", "bashls" },
})

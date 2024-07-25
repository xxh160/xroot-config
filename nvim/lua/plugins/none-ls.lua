local status, none_ls = pcall(require, "null-ls")
if not status then
    vim.notify("No none-ls")
    return
end

local formatting = none_ls.builtins.formatting

none_ls.setup({
    sources = {
        -- Python
        formatting.black,
        -- Shell
        formatting.shfmt,
        -- StyLua
        formatting.stylua,
        -- Go fmt
        formatting.goimports,
        -- Clang
        formatting.clang_format.with({
            filetypes = { "c", "cpp", "objc", "objcpp" },
            -- Pass additional arguments if needed
            args = { "-style=file" },
        }),
        -- Frontend
        formatting.prettier.with({
            filetypes = {
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "vue",
                "css",
                "scss",
                "less",
                "html",
                "json",
                "yaml",
                "graphql",
                "astro",
                "markdown",
            },
            extra_filetypes = { "njk" },
            prefer_local = "node_modules/.bin",
        }),
    },
})

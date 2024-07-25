local status_mason_lsp, mason_lsp = pcall(require, "mason-lspconfig")
if not status_mason_lsp then
    vim.notify("No mason-lspconfig")
    return
end

mason_lsp.setup({
    ensure_installed = {
        -- C/C++
        "clangd",
        -- Python
        "pylsp",
        -- Make
        "autotools_ls",
        -- Markdown
        "marksman",
        -- Java
        "jdtls",
        -- Bash
        "bashls",
        -- Vim
        "vimls",
        -- Lua
        "lua_ls",
        -- YAML
        "yamlls",
    },
    automatic_installation = true,
})

-- Setup capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local status_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_nvim_lsp then
    vim.notify("No cmp-nvim-lsp")
    return
end

-- Setup auto completion
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local status_nvim_lsp, nvim_lsp = pcall(require, "lspconfig")
if not status_nvim_lsp then
    vim.notify("No nvim-lspconfig")
    return
end

local function attach_func(client, bufno)
    require("plugins.which-key").mapbuf_lsp(bufno)
end


mason_lsp.setup_handlers({
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler

    -- Default handler (optional)
    function(server_name)
        nvim_lsp[server_name].setup({
            capabilities = capabilities,
            on_attach = attach_func,
        })
    end,

    -- Next, you can provide a dedicated handler for specific servers
    ["pyright"] = function()
        nvim_lsp.pyright.setup({
            capabilities = capabilities,
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "on",
                    }
                }
            },
            on_attach = attach_func,
        })
    end,

    ["lua_ls"] = function()
        nvim_lsp.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { "vim" },
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    -- Do not send telemetry data containing a randomized but unique identifier
                    telemetry = {
                        enable = false,
                    },
                },
            },
            on_attach = attach_func,
        })
    end,
})

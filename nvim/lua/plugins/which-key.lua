-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local status, wk = pcall(require, "which-key")
if not status then
    vim.notify("No which-key")
    return
end

wk.setup({
    plugins = {
        -- Shows a list of your marks on ' and `
        marks = true,
        -- Shows your registers on " in NORMAL or <C-r> in INSERT mo
        registers = true,
    },
})

wk.add({
    mode = { "n" },
    silent = true,

    { "<leader>b",  group = "buffer" },
    { "<leader>bh", "<cmd>bprev<cr>",   desc = "Previous buffer" },
    { "<leader>bk", "<cmd>bdelete<cr>", desc = "Delete buffer" },
    { "<leader>bl", "<cmd>bnext<cr>",   desc = "Next buffer" },
    {
        "<leader>bb",
        expand = function()
            return require("which-key.extras").expand.buf()
        end,
        desc = "Go to buffer"
    },

    { "<leader>g",  group = "git" },
    { "<leader>gb", "<cmd>Git blame<cr>",             desc = "Git blame" },
    { "<leader>gl", "<cmd>Git log<cr>",               desc = "Git log" },

    { "<leader>j",  group = "jump" },
    { "<leader>jF", "[m",                             desc = "Jump prev method start" },
    { "<leader>jc", "<cmd>HopChar1<cr>",              desc = "Jump char" },
    { "<leader>jf", "]M",                             desc = "Jump next method end" },
    { "<leader>ji", "<c-i>",                          desc = "Jump forward" },
    { "<leader>jl", "<cmd>HopLineStart<cr>",          desc = "Jump line" },
    { "<leader>jo", "<c-o>",                          desc = "Jump back" },
    { "<leader>jw", "<cmd>HopWord<cr>",               desc = "Jump word" },

    { "<leader>o",  group = "open" },
    { "<leader>op", "<cmd>NvimTreeToggle<cr>",        desc = "Toggle nvim-tree" },
    { "<leader>os", "<cmd>SymbolsOutline<cr>",        desc = "Toggle symbols outline" },
    { "<leader>ot", "<cmd>Lspsaga term_toggle<cr>",   desc = "Toggle terminal" },

    { "<leader>s",  group = "search" },
    { "<leader>sF", "<cmd>Telescope git_files<cr>",   desc = "Search git files" },
    { "<leader>sG", "<cmd>Telescope grep_string<cr>", desc = "Live grep cursor word" },
    { "<leader>sb", "<cmd>Telescope buffers<cr>",     desc = "Search buffers" },
    { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Search colorschemes" },
    { "<leader>se", "<cmd>Telescope emoji<cr>",       desc = "Search emojis" },
    { "<leader>sf", "<cmd>Telescope find_files<cr>",  desc = "Search files" },
    { "<leader>sg", "<cmd>Telescope live_grep<cr>",   desc = "Live grep" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>",   desc = "Search vim manual" },
    { "<leader>sj", "<cmd>Telescope jumplist<cr>",    desc = "Search jumplist" },
    { "<leader>sm", "<cmd>Telescope bookmarks<cr>",   desc = "Search bookmarks" },

    { "<leader>w",  group = "window" },
    { "<leader>wd", "<cmd>close<cr>",                 desc = "Close window" },
    { "<leader>wh", "<c-w>h",                         desc = "Move left" },
    { "<leader>wj", "<c-w>j",                         desc = "Move down" },
    { "<leader>wk", "<c-w>k",                         desc = "Move up" },
    { "<leader>wl", "<c-w>l",                         desc = "Move right" },
    { "<leader>ws", "<cmd>split<cr>",                 desc = "Split horizontally" },
    { "<leader>wv", "<cmd>vsplit<cr>",                desc = "Split vertically" },
    { "<leader>wz", "<cmd>Maximize<cr>",              desc = "Maximize window or not" },
})

-- Markdown actions
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        local bufno = vim.api.nvim_get_current_buf()
        wk.add({
            mode = { "n" },
            buffer = bufno,
            silent = true,

            { "<leader>a",  group = "actions" },
            { "<leader>ag", "<cmd>GenTocGFM<cr>",            desc = "Generate toc" },
            { "<leader>ap", "<cmd>MarkdownPreview<cr>",      desc = "Markdown preview" },
            { "<leader>ar", "<cmd>RenderMarkdownToggle<cr>", desc = "Render markdown or not" },
        })
    end
})


local M = {}

M.mapbuf_lsp = function(bufno)
    wk.add({
        mode = { "n" },
        buffer = bufno,

        { "<leader>c",  group = "code" },
        { "<leader>cD", "<cmd>lua vim.lsp.buf.declaration()<cr>",           desc = "Go to declaration" },
        { "<leader>cE", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer error" },
        { "<leader>ca", "<cmd>Lspsaga code_action<cr>",                     desc = "Code actions" },
        { "<leader>cd", "<cmd>Lspsaga goto_definition<cr>",                 desc = "Go to definition" },
        { "<leader>ce", "<cmd>Lspsaga show_line_diagnostics<cr>",           desc = "Show error" },
        { "<leader>cf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>",  desc = "Format current buffer" },
        { "<leader>ch", "<cmd>Lspsaga hover_doc<cr>",                       desc = "Hover document" },
        { "<leader>cq", "<cmd>Trouble qflist toggle<cr>",                   desc = "Quickfix list" },
        { "<leader>cr", "<cmd>Lspsaga rename<cr>",                          desc = "Rename" },
        { "<leader>cu", "<cmd>Lspsaga finder def+ref<cr>",                  desc = "Go to usage" },

        { "<leader>j",  group = "jump" },
        { "<leader>jE", "<cmd>lua vim.diagnostic.goto_prev()<cr>",          desc = "Jump prev error" },
        { "<leader>je", "<cmd>lua vim.diagnostic.goto_next()<cr>",          desc = "Jump next error" },

        { "<leader>s",  group = "search" },
        { "<leader>sS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Search symbols in project" },
        { "<leader>sd", "<cmd>Telescope diagnostics<cr>",                   desc = "Search diagnostics" },
        { "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>",          desc = "Search symbols in file" },
    })
end

return M

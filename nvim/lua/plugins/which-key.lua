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


    { "j",               "<Plug>(accelerated_jk_gj)",      desc = "Faster j" },
    { "k",               "<Plug>(accelerated_jk_gk)",      desc = "Faster k" },

    { "<leader>?",       "<cmd>Telescope help_tags<cr>",   desc = "Vim manuals" },
    { "<leader>/",       "<cmd>Telescope live_grep<cr>",   desc = "Live grep (global)" },
    { "<leader>*",       "<cmd>Telescope grep_string<cr>", desc = "Live grep (cursor word)" },
    { "<leader><space>", "<cmd>Telescope find_files<cr>",  desc = "Files" },
    { "<leader>m",       "<cmd>Telescope marks<cr>",       desc = "Bookmarks" },

    { "<leader>b",       group = "buffer" },
    { "<leader>bb",      "<cmd>Telescope buffers<cr>",     desc = "Search buffers" },
    { "<leader>bh",      "<cmd>bprev<cr>",                 desc = "Previous buffer" },
    { "<leader>bl",      "<cmd>bnext<cr>",                 desc = "Next buffer" },
    { "<leader>bk",      "<cmd>bdelete<cr>",               desc = "Delete buffer" },


    { "<leader>g",       group = "git" },
    { "<leader>gf",      "<cmd>Telescope git_files<cr>",   desc = "Git files" },
    { "<leader>gb",      "<cmd>Git blame<cr>",             desc = "Git blame" },
    { "<leader>gl",      "<cmd>Git log<cr>",               desc = "Git log" },

    { "<leader>j",       group = "jump" },
    { "<leader>jf",      "]M",                             desc = "Jump next method end" },
    { "<leader>jF",      "[m",                             desc = "Jump prev method start" },
    { "<leader>ji",      "<c-i>",                          desc = "Jump forward" },
    { "<leader>jo",      "<c-o>",                          desc = "Jump back" },
    { "<leader>jt",      "<c-]>",                          desc = "Jump tag" },
    { "<leader>jc",      "<cmd>HopChar1<cr>",              desc = "Jump char" },
    { "<leader>jl",      "<cmd>HopLineStart<cr>",          desc = "Jump line" },
    { "<leader>jw",      "<cmd>HopWord<cr>",               desc = "Jump word" },
    { "<leader>jj",      "<cmd>Telescope jumplist<cr>",    desc = "Jumplist" },

    { "<leader>o",       group = "open" },
    { "<leader>op",      "<cmd>NvimTreeToggle<cr>",        desc = "Toggle nvim-tree" },
    { "<leader>os",      "<cmd>SymbolsOutline<cr>",        desc = "Toggle symbols outline" },
    { "<leader>ot",      "<cmd>Lspsaga term_toggle<cr>",   desc = "Toggle terminal" },

    { "<leader>s",       group = "system" },
    { "<leader>sd",      "<cmd>Twilight<cr>",              desc = "Toggle dim mode" },
    { "<leader>sf",      "<cmd>ZenMode<cr>",               desc = "Toggle foucs mode" },
    { "<leader>sc",      "<cmd>Telescope colorscheme<cr>", desc = "Change colorscheme" },
    { "<leader>sn",      "<cmd>Telescope notify<cr>",      desc = "Notification History" },

    { "<leader>w",       group = "window" },
    { "<leader>wd",      "<cmd>close<cr>",                 desc = "Close window" },
    { "<leader>wh",      "<c-w>h",                         desc = "Window left" },
    { "<leader>wj",      "<c-w>j",                         desc = "Window down" },
    { "<leader>wk",      "<c-w>k",                         desc = "Window up" },
    { "<leader>wl",      "<c-w>l",                         desc = "Window right" },
    { "<leader>ws",      "<cmd>split<cr>",                 desc = "Split horizontally" },
    { "<leader>wv",      "<cmd>vsplit<cr>",                desc = "Split vertically" },
    { "<leader>wz",      "<cmd>Maximize<cr>",              desc = "Maximize window or not" },
}, {
    mode = { "i" },
    silent = true,

    { "<c-l>", "<c-o>l", desc = "Cursor right" },
    { "<c-h>", "<c-o>h", desc = "Cursor left" },
    { "<c-k>", "<c-o>k", desc = "Cursor up" },
    { "<c-j>", "<c-o>j", desc = "Cursor down" },
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
            { "<leader>ag", "<cmd>GenTocGFM<cr>",                 desc = "Generate toc" },
            { "<leader>ap", "<cmd>MarkdownPreview<cr>",           desc = "Markdown preview" },
            { "<leader>ar", "<cmd>RenderMarkdown buf_toggle<cr>", desc = "Render markdown or not" },
        })
    end
})


local M = {}

M.mapbuf_lsp = function(bufno)
    wk.add({
        mode = { "n" },
        buffer = bufno,
        silent = true,

        { "<leader>c",  group = "code" },
        -- Code actions
        { "<leader>ca", "<cmd>Lspsaga code_action<cr>",                     desc = "Code actions" },
        { "<leader>cf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>",  desc = "Format current buffer" },
        { "<leader>ch", "<cmd>Lspsaga hover_doc<cr>",                       desc = "Hover document" },
        { "<leader>cr", "<cmd>Lspsaga rename<cr>",                          desc = "Rename" },
        -- Code symbols
        { "<leader>cd", "<cmd>Lspsaga goto_definition<cr>",                 desc = "Go to definition" },
        { "<leader>cD", "<cmd>lua vim.lsp.buf.declaration()<cr>",           desc = "Go to declaration" },
        { "<leader>cu", "<cmd>Lspsaga finder def+ref<cr>",                  desc = "Go to usage" },
        { "<leader>cS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Symbols in project" },
        { "<leader>cs", "<cmd>Telescope lsp_document_symbols<cr>",          desc = "Symbols in file" },
        -- Code error
        { "<leader>cQ", "<cmd>Trouble qflist toggle<cr>",                   desc = "Quickfix list" },
        { "<leader>ce", "<cmd>Lspsaga show_line_diagnostics<cr>",           desc = "Line error" },
        { "<leader>cE", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer error" },
        { "<leader>cX", "<cmd>Telescope diagnostics<cr>",                   desc = "All diagnostics" },
        -- { "<leader>jE", "<cmd>lua vim.diagnostic.goto_prev()<cr>",          desc = "Jump prev error" },
        -- { "<leader>je", "<cmd>lua vim.diagnostic.goto_next()<cr>",          desc = "Jump next error" },
    })
end

return M

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

    { "<leader><space>", "<cmd>Telescope find_files<cr>",  desc = "Files" },
    { "<leader>?",       "<cmd>Telescope help_tags<cr>",   desc = "Vim manuals" },
    { "<leader>/",       "<cmd>Telescope live_grep<cr>",   desc = "Live grep (global)" },
    { "<leader>*",       "<cmd>Telescope grep_string<cr>", desc = "Live grep (cursor word)" },
    { "<leader>m",       "<cmd>Telescope marks<cr>",       desc = "Bookmarks" },
    { "<leader>k",       "<cmd>Telescope keymaps<cr>",     desc = "Keymaps" },

    { "<leader>b",       group = "buffer" },
    { "<leader>bb",      "<cmd>Telescope buffers<cr>",     desc = "Search buffers" },
    { "<leader>bh",      "<cmd>bprev<cr>",                 desc = "Previous buffer" },
    { "<leader>bl",      "<cmd>bnext<cr>",                 desc = "Next buffer" },
    { "<leader>bk",      "<cmd>bdelete<cr>",               desc = "Delete buffer" },
    { "<leader>bn",      "<cmd>enew<cr>",                  desc = "New empty buffer" },

    { "<leader>f",       group = "file" },
    { "<leader>ff",      "<cmd>Telescope find_files<cr>",  desc = "Find files" },
    { "<leader>fr",      "<cmd>Telescope oldfiles<cr>",    desc = "Recent files" },

    { "<leader>g",       group = "git" },
    { "<leader>gf",      "<cmd>Telescope git_files<cr>",   desc = "Git files" },
    { "<leader>gb",      "<cmd>Git blame<cr>",             desc = "Git blame" },
    { "<leader>gl",      "<cmd>Git log<cr>",               desc = "Git log" },

    { "<leader>j",       group = "jump" },
    { "<leader>ji",      "<c-i>",                          desc = "Jump forward" },
    { "<leader>jo",      "<c-o>",                          desc = "Jump back" },
    { "<leader>jt",      "<c-]>",                          desc = "Jump tag" },
    { "<leader>jc",      "<cmd>HopChar1<cr>",              desc = "Jump char" },
    { "<leader>jl",      "<cmd>HopLineStart<cr>",          desc = "Jump line" },
    { "<leader>jw",      "<cmd>HopWord<cr>",               desc = "Jump word" },
    { "<leader>jj",      "<cmd>Telescope jumplist<cr>",    desc = "Jump list" },

    { "<leader>o",       group = "open" },
    { "<leader>op",      "<cmd>NvimTreeToggle<cr>",        desc = "Toggle nvim-tree" },
    { "<leader>os",      "<cmd>SymbolsOutline<cr>",        desc = "Toggle symbols outline" },
    { "<leader>ot",      "<cmd>ToggleTerm<cr>",            desc = "Toggle terminal" },

    { "<leader>p",       group = "project" },
    { "<leader>pa",      "<cmd>WorkspacesAdd<cr>",         desc = "Add project to list" },
    { "<leader>pp",      "<cmd>WorkspacesOpen<cr>",        desc = "Choose project" },
    { "<leader>pd",      "<cmd>WorkspacesRemove<cr>",      desc = "Delete project from list" },

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

-- Latex actions
vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    callback = function()
        local bufno = vim.api.nvim_get_current_buf()
        wk.add({
            mode = { "n" },
            buffer = bufno,
            silent = true,

            { "<leader>a",  group = "actions-latex" },

            { "<leader>al", "<Plug>(vimtex-compile)",             desc = "Compile" },
            { "<leader>aL", "<Plug>(vimtex-compile-selected)",    desc = "Compile selected" },
            { "<leader>ak", "<Plug>(vimtex-stop)",                desc = "Stop compile" },
            { "<leader>aK", "<Plug>(vimtex-stop-all)",            desc = "Stop all compiles" },
            { "<leader>av", "<Plug>(vimtex-view)",                desc = "View PDF" },
            { "<leader>ae", "<Plug>(vimtex-errors)",              desc = "Show errors" },
            { "<leader>ao", "<Plug>(vimtex-compile-output)",      desc = "Compile output" },
            { "<leader>as", "<Plug>(vimtex-status)",              desc = "Status" },
            { "<leader>aS", "<Plug>(vimtex-status-all)",          desc = "Status all" },
            { "<leader>ac", "<Plug>(vimtex-clean)",               desc = "Clean aux" },
            { "<leader>aC", "<Plug>(vimtex-clean-full)",          desc = "Clean all" },
            { "<leader>am", "<Plug>(vimtex-imaps-list)",          desc = "Insert mappings" },
            { "<leader>ax", "<Plug>(vimtex-reload)",              desc = "Reload VimTeX" },
            { "<leader>aX", "<Plug>(vimtex-reload-state)",        desc = "Reload state" },
            { "<leader>at", "<Plug>(vimtex-toc-open)",            desc = "TOC open" },
            { "<leader>aT", "<Plug>(vimtex-toc-toggle)",          desc = "TOC toggle" },
            { "<leader>aq", "<Plug>(vimtex-log)",                 desc = "View log" },
            { "<leader>ai", "<Plug>(vimtex-info)",                desc = "VimTeX Info" },
            { "<leader>aI", "<Plug>(vimtex-info-full)",           desc = "All Info" },
            { "<leader>ar", "<Plug>(vimtex-reverse-search)",      desc = "Reverse search" },
            { "<leader>an", "<Plug>(vimtex-toggle-main)",         desc = "Toggle main file" },
            { "<leader>aa", "<Plug>(vimtex-context-menu)",        desc = "Context menu" },
        })
    end
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

            { "<leader>a",  group = "actions-md" },
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

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

wk.register({
    ["<leader>"] = {
        w = {
            name = "window",
            j = { "<c-w>j", "Move down" },
            k = { "<c-w>k", "Move up" },
            h = { "<c-w>h", "Move left" },
            l = { "<c-w>l", "Move right" },
            s = { "<cmd>split<cr>", "Split horizontally" },
            v = { "<cmd>vsplit<cr>", "Split vertically" },
            d = { "<cmd>close<cr>", "Close window" },
            z = { "<cmd>Maximize<cr>", "Maximize window or not" },
        },
        b = {
            name = "buffer",
            h = { "<cmd>bprev<cr>", "Previous buffer" },
            l = { "<cmd>bnext<cr>", "Next buffer" },
            k = { "<cmd>bdelete<cr>", "Delete buffer" },
            ["1"] = { "<cmd>BufferLineGoToBuffer 1<cr>", "Go to buffer 1" },
            ["2"] = { "<cmd>BufferLineGoToBuffer 2<cr>", "Go to buffer 2" },
            ["3"] = { "<cmd>BufferLineGoToBuffer 3<cr>", "Go to buffer 3" },
            ["4"] = { "<cmd>BufferLineGoToBuffer 4<cr>", "Go to buffer 4" },
            ["5"] = { "<cmd>BufferLineGoToBuffer 5<cr>", "Go to buffer 5" },
            ["6"] = { "<cmd>BufferLineGoToBuffer 6<cr>", "Go to buffer 6" },
            ["7"] = { "<cmd>BufferLineGoToBuffer 7<cr>", "Go to buffer 7" },
            ["8"] = { "<cmd>BufferLineGoToBuffer 8<cr>", "Go to buffer 8" },
            ["9"] = { "<cmd>BufferLineGoToBuffer 9<cr>", "Go to buffer 9" },
        },
        g = {
            name = "git",
            b = { "<cmd>Git blame<cr>", "Git blame" },
            l = { "<cmd>Git log<cr>", "Git log" },
        },
        j = {
            name = "jump",
            o = { "<c-o>", "Jump back" },
            i = { "<c-i>", "Jump forward" },
            l = { "<cmd>HopLineStart<cr>", "Jump line" },
            w = { "<cmd>HopWord<cr>", "Jump word" },
            c = { "<cmd>HopChar1<cr>", "Jump char" },
            f = { "]M", "Jump next method end" },
            F = { "[m", "Jump prev method start" },
        },
        s = {
            name = "search",
            b = { "<cmd>Telescope buffers<cr>", "Search buffers" },
            f = { "<cmd>Telescope find_files<cr>", "Search files" },
            F = { "<cmd>Telescope git_files<cr>", "Search git files" },
            g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
            G = { "<cmd>Telescope grep_string<cr>", "Live grep cursor word" },
            h = { "<cmd>Telescope help_tags<cr>", "Search vim manual" },
            j = { "<cmd>Telescope jumplist<cr>", "Search jumplist" },
            e = { "<cmd>Telescope emoji<cr>", "Search emojis" },
            c = { "<cmd>Telescope colorscheme<cr>", "Search colorschemes" },
            m = { "<cmd>Telescope bookmarks<cr>", "Search bookmarks" },
        },
        o = {
            name = "open",
            p = { "<cmd>NvimTreeToggle<cr>", "Toggle nvim-tree" },
            t = { "<cmd>Lspsaga term_toggle<cr>", "Toggle terminal" },
            s = { "<cmd>SymbolsOutline<cr>", "Toggle symbols outline"},
        },
    }
}, { mode = "n", silent = true })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        local bufno = vim.api.nvim_get_current_buf()
        wk.register({
            ["<leader>"] = {
                a = {
                    name = "actions",
                    p = { "<cmd>MarkdownPreview<cr>", "Markdown preview" },
                    g = { "<cmd>GenTocGFM<cr>", "Generate toc" },
                    r = { "<cmd>RenderMarkdownToggle<cr>", "Render markdown or not" },
                },
            },
        }, { mode = "n", buffer = bufno, silent = true })
    end
})


local M = {}

M.mapbuf_lsp = function(bufno)
    wk.register({
        ["<leader>"] = {
            c = {
                name = "code",
                a = { "<cmd>Lspsaga code_action<cr>", "Code actions" },
                h = { "<cmd>Lspsaga hover_doc<cr>", "Hover document" },
                d = { "<cmd>Lspsaga goto_definition<cr>", "Go to definition" },
                u = { "<cmd>Lspsaga finder def+ref<cr>", "Go to usage" },
                r = { "<cmd>Lspsaga rename<cr>", "Rename" },
                e = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show error" },

                D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to declaration" },
                f = { "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", "Format current buffer" },
                -- i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Go to implementation" },

                E = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer error" },
                q = { "<cmd>Trouble qflist toggle<cr>", "Quickfix list" },
            },
            s = {
                name = "search",
                d = { "<cmd>Telescope diagnostics<cr>", "Search diagnostics" },
                s = { "<cmd>Telescope lsp_document_symbols<cr>", "Search symbols in file" },
                S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Search symbols in project" },
            },
            j = {
                name = "jump",
                e = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Jump next error" },
                E = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Jump prev error" },
            },
        },
    }, { mode = "n", buffer = bufno, silent = true })
end

return M


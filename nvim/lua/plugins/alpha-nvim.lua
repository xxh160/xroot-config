local status, alpha = pcall(require, "alpha")
if not status then
    vim.notify("No alpha")
    return
end

local dashboard = require("alpha.themes.dashboard")

local header_ascii = {
    [[ ██╗  ██╗██████╗  ██████╗  ██████╗ ████████╗    ███╗   ██╗██╗   ██╗██╗███╗   ███╗ ]],
    [[ ╚██╗██╔╝██╔══██╗██╔═══██╗██╔═══██╗╚══██╔══╝    ████╗  ██║██║   ██║██║████╗ ████║ ]],
    [[  ╚███╔╝ ██████╔╝██║   ██║██║   ██║   ██║       ██╔██╗ ██║██║   ██║██║██╔████╔██║ ]],
    [[  ██╔██╗ ██╔══██╗██║   ██║██║   ██║   ██║       ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
    [[ ██╔╝ ██╗██║  ██║╚██████╔╝╚██████╔╝   ██║       ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
    [[ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝    ╚═╝       ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
}

-- Pad with N empty lines above and below
local function pad_ascii(ascii, pad_top, pad_bottom)
    local top = {}
    for _ = 1, pad_top do
        table.insert(top, "")
    end

    local bottom = {}
    for _ = 1, pad_bottom do
        table.insert(bottom, "")
    end

    return vim.list_extend(vim.list_extend(top, ascii), bottom)
end

dashboard.section.header.val = pad_ascii(header_ascii, 5, 5)

dashboard.section.buttons.val = {
    dashboard.button("w", "  > Open Workspace", "<cmd>WorkspacesOpen<cr>"),
    dashboard.button("a", "  > New Workspace", "<cmd>WorkspacesAdd<cr>"),
    dashboard.button("f", "󰈞  > Find Files", "<cmd>Telescope find_files<cr>"),
    dashboard.button("r", "  > Recent Files", "<cmd>Telescope oldfiles<cr>"),
    dashboard.button("n", "  > New File", "<cmd>enew<cr>"),
    dashboard.button("g", "  > Live Grep", "<cmd>Telescope live_grep<cr>"),
    dashboard.button("e", "  > Edit Config", "<cmd>e $MYVIMRC<cr>"),
    dashboard.button("m", "  > Mason", "<cmd>Mason<cr>"),
    dashboard.button("l", "󰒲  > Lazy Status", "<cmd>Lazy<cr>"),
    dashboard.button("q", "󰙧  > Quit NVIM", "<cmd>qa<cr>"),
}

dashboard.section.footer = {
    [[ Xiayi's NVIM ]],
}

alpha.setup(dashboard.opts)

-- Setup bufferline and (optionally) neovide scale
local saved_scale = nil

vim.api.nvim_create_autocmd("User", {
    pattern = "AlphaReady",
    callback = function()
        vim.cmd("set showtabline=0")
        if vim.g.neovide then
            saved_scale = vim.g.neovide_scale_factor or 1.0
            vim.g.neovide_scale_factor = 1.1
        end
    end,
})

vim.api.nvim_create_autocmd("BufUnload", {
    buffer = 0,
    callback = function()
        vim.cmd("set showtabline=2")
        if vim.g.neovide and saved_scale then
            vim.g.neovide_scale_factor = saved_scale
        end
    end,
})

local status, alpha = pcall(require, "alpha")
if not status then
    vim.notify("No alpha")
    return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
    [[                                                                                  ]],
    [[                                                                                  ]],
    [[                                                                                  ]],
    [[                                                                                  ]],
    [[ ██╗  ██╗██████╗  ██████╗  ██████╗ ████████╗    ███╗   ██╗██╗   ██╗██╗███╗   ███╗ ]],
    [[ ╚██╗██╔╝██╔══██╗██╔═══██╗██╔═══██╗╚══██╔══╝    ████╗  ██║██║   ██║██║████╗ ████║ ]],
    [[  ╚███╔╝ ██████╔╝██║   ██║██║   ██║   ██║       ██╔██╗ ██║██║   ██║██║██╔████╔██║ ]],
    [[  ██╔██╗ ██╔══██╗██║   ██║██║   ██║   ██║       ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
    [[ ██╔╝ ██╗██║  ██║╚██████╔╝╚██████╔╝   ██║       ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
    [[ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝    ╚═╝       ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
    [[                                                                                  ]],
    [[                                                                                  ]],
    [[                                                                                  ]],
    [[                                                                                  ]],
}

dashboard.section.buttons.val = {
    dashboard.button("a", "  > New Workspace", "<cmd>WorkspacesAdd<cr>"),
    dashboard.button("w", "  > Open Workspace", "<cmd>WorkspacesOpen<cr>"),
    dashboard.button("n", "  > New File", "<cmd>enew<cr>"),
    dashboard.button("r", "  > Recent Files", "<cmd>Telescope oldfiles<cr>"),
    dashboard.button("f", "󰈞  > Find Files", "<cmd>Telescope find_files<cr>"),
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

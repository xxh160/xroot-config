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
    dashboard.button("n", "  > New File", ":enew<cr>"),
    dashboard.button("r", "  > Recent Files", ":Telescope oldfiles<cr>"),
    dashboard.button("f", "󰈞  > Find Files", ":Telescope find_files<cr>"),
    dashboard.button("g", "  > Live Grep", ":Telescope live_grep<cr>"),
    dashboard.button("e", "  > Edit Config", ":e $MYVIMRC<cr>"),
    dashboard.button("m", "  > Mason", ":Mason<cr>"),
    dashboard.button("l", "󰒲  > Lazy Status", ":Lazy<cr>"),
    dashboard.button("q", "󰙧  > Quit NVIM", ":qa<cr>"),
}

dashboard.section.footer = {
    [[ Xiayi's NVIM ]],
}

alpha.setup(dashboard.opts)

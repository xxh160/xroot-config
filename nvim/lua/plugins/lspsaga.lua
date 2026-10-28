local status, lspsaga = pcall(require, "lspsaga")
if not status then
    vim.notify("No lspsaga")
    return
end

lspsaga.setup({
    ui = {
        border = "rounded",
        devicon = true,
        foldericon = true,
        title = true,
        expand = "⊞",
        collapse = "⊟",
        code_action = "💡",
        lines = { "┗", "┣", "┃", "━", "┏" },
        kind = nil,
        imp_sign = "󰳛 ",
    },
    finder = {
        keys = {
            toggle_or_open = "<cr>",
            quit = "<C-c>",
        }
    },
    code_action = {
        num_shortcut = true,
        show_server_name = false,
        keys = {
            quit = "<C-c>",
            exec = "<cr>",
        },
    },
    lightbulb = {
        enable = true,
        enable_in_insert = true,
        sign = true,
        sign_priority = 20,
        virtual_text = false,
    },
    rename = {
        keys = { quit = "<C-c>", exec = "<cr>", select = "x" },
        in_select = true,
    },
    symbol_in_winbar = {
        enable = false,
        ignore_patterns = {},
        hide_keyword = true,
        show_file = true,
        folder_level = 2,
        color_mode = true,
        left_offset = 5,
    },
    implement = {
        enable = true,
        sign = true,
        virtual_text = true,
        priority = 100,
    },
})

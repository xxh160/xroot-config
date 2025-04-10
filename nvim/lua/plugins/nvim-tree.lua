local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("No nvim-tree")
    return
end

local function nvim_tree_on_attach(bufno)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufno, noremap = true, silent = true, nowait = true }
    end

    -- Default mappings
    api.config.mappings.default_on_attach(bufno)

    -- Custom mappings
    vim.keymap.set('n', 'U', api.tree.change_root_to_parent, opts('Root Up'))
    vim.keymap.set('n', 'D', api.tree.change_root_to_node, opts('Root Down'))
end

nvim_tree.setup({
    sort_by = "case_sensitive",
    -- Show git status
    git = {
        enable = true,
    },
    -- File filter
    filters = {
        dotfiles = false,
        custom = {
            "node_modules",
        },
    },
    view = {
        side = "left",
        number = false,
        relativenumber = false,
        -- Show icons
        signcolumn = "yes",
        width = 25,
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    renderer = {
        root_folder_label = ":t",
        group_empty = true,
        icons = {
            show = {
                git = true,
                file = true,
                folder = true,
                folder_arrow = true,
            },
            glyphs = {
                bookmark = " ",
                folder = {
                    arrow_closed = "⏵",
                    arrow_open = "⏷",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "⌥",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "⊖",
                    ignored = "◌",
                },
            },
        },
    },
    actions = {
        open_file = {
            -- 首次打开大小适配
            resize_window = true,
            -- 打开文件时关闭
            quit_on_open = true,
        },
    },
    on_attach = nvim_tree_on_attach,
})

local status, zen = pcall(require, "zen-mode")
if not status then
    vim.notify("No zen")
    return
end

zen.setup({
    window = {
        width = .60
    },
    plugins = {
        twilight = { enabled = true },
        neovide = {
            enabled = false,
            -- Will multiply the current scale factor by this number
            scale = 1.2,
            -- disable the Neovide animations while in Zen mode
            disable_animations = {
                neovide_animation_length = 0,
                neovide_cursor_animate_command_line = false,
                neovide_scroll_animation_length = 0,
                neovide_position_animation_length = 0,
                neovide_cursor_animation_length = 0,
                neovide_cursor_vfx_mode = "",
            }
        }
    }
})

-- Must run before colorscheme is set
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",  -- Trigger for any colorscheme
  callback = function()
    -- Get the background color of the 'Normal' highlight group (from current colorscheme)
    local bg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg", "gui")

    -- Define or override 'ZenBg' highlight group using the same background color
    -- This ensures ZenMode side padding matches the colorscheme
    vim.api.nvim_set_hl(0, "ZenBg", { bg = bg })
  end,
})

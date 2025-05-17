-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Insert mode: move cursor with <C-hjkl>
vim.keymap.set("i", "<C-h>", "<Left>",  { desc = "Cursor left",  silent = true })
vim.keymap.set("i", "<C-j>", "<Down>",  { desc = "Cursor down",  silent = true })
vim.keymap.set("i", "<C-k>", "<Up>",    { desc = "Cursor up",    silent = true })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Cursor right", silent = true })

-- Neovide dpi
if vim.g.neovide then
    local function notify_zoom()
        local percent = math.floor(vim.g.neovide_scale_factor * 100 + 0.5)
        vim.notify("Zoom: " .. percent .. "%", vim.log.levels.INFO, { title = "Neovide" })
    end

    local function change_scale(delta)
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + delta
        notify_zoom()
    end

    vim.keymap.set("n", "<C-=>", function()
        change_scale(0.05)
    end, { desc = "Zoom In (+5%)", silent = true })

    vim.keymap.set("n", "<C-->", function()
        change_scale(-0.05)
    end, { desc = "Zoom Out (-5%)", silent = true })

    vim.keymap.set("n", "<C-0>", function()
        vim.g.neovide_scale_factor = 1.0
        notify_zoom()
    end, { desc = "Reset Zoom (100%)", silent = true })
end

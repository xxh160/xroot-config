local colorscheme = "catppuccin-mocha"

-- Neovide only
if vim.g.neovide then
    colorscheme = "rose-pine"
end

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. vim.trim(colorscheme))
if not is_ok then
    vim.notify("No " .. colorscheme)
    return
end


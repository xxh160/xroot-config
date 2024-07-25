local colorscheme = "catppuccin-mocha"

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify("No " .. colorscheme)
    return
end


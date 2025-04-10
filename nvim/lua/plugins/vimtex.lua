-- local status, vimtex = pcall(require, "vimtex")
-- if not status then
--     vim.notify("No vimtex")
--     return
-- end

-- VimTeX configuration
vim.g.vimtex_compiler_latexmk_engines = {
    ['_'] = '-xelatex',
}

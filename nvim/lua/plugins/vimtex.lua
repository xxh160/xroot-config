-- local status, vimtex = pcall(require, "vimtex")
-- if not status then
--     vim.notify("No vimtex")
--     return
-- end

-- VimTeX xelatex compilation
vim.g.vimtex_compiler_latexmk_engines = {
    ['_'] = '-xelatex',
}

-- VimTeX fold
vim.g.vimtex_fold_enabled = true
vim.g.vimtex_fold_manual = true

-- Vimtex keymap
vim.g.vimtex_mappings_enabled = 0

-- Reviewer
vim.g.vimtex_view_method = 'general'
vim.g.vimtex_view_general_viewer = 'okular'
vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'

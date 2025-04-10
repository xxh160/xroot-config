-- Insert mode: move cursor with <C-hjkl>
vim.keymap.set("i", "<C-h>", "<Left>",  { desc = "Cursor left",  silent = true })
vim.keymap.set("i", "<C-j>", "<Down>",  { desc = "Cursor down",  silent = true })
vim.keymap.set("i", "<C-k>", "<Up>",    { desc = "Cursor up",    silent = true })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Cursor right", silent = true })

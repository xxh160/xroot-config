-- Enable mouse in all modes
vim.opt.mouse = 'a'

-- Timeout
vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- Use system clipboard
vim.opt.clipboard = 'unnamedplus'
-- Option menu: use a popup memu to show the possible completions
-- Option menuone: use the popup menu also when there is only one match
-- Option noselect: do not select a match in the menu
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
-- Enable mouse support in all modes
vim.opt.mouse = 'a'

-- Incremental search
vim.opt.incsearch = true
-- When there is a previous search pattern, highlight all its matches
vim.opt.hlsearch = true
-- Do case insensitive matching
vim.opt.ignorecase = true
-- Do smart case matching
vim.opt.smartcase = true

-- Show line number
vim.opt.number = true
-- Cursorline
vim.opt.cursorline = true


-- Put the new window below the current one
vim.opt.splitbelow = true
-- Put the new window right of the current one
vim.opt.splitright = true

-- Enable fold
vim.opt.foldenable = true
-- Syntax highlighting items specify folds
vim.opt.foldmethod = 'syntax'
vim.opt.foldcolumn = '0'
vim.opt.foldlevel = 1

-- Number of spaces that a <Tab> in the file counts for
vim.opt.tabstop = 4
-- Number of spaces that a <Tab> counts for while performing editing
-- operations, like inserting a <Tab> or using <BS>
vim.opt.softtabstop = 4
-- Length of >> and <<
vim.opt.shiftwidth = 4
-- Do smart autoindenting when starting a new line
vim.opt.smartindent = true
-- In Insert mode: Use the appropriate number of spaces to insert a <Tab>
vim.opt.expandtab = true

-- List mode
vim.opt.list = false
-- Strings to use in list mode
vim.opt.listchars = "space:·,tab:>-"

-- Show matching brackets
vim.opt.showmatch = true
-- Hide buffers when they are abandoned
vim.opt.hidden = true
-- Do not generate swap files
vim.opt.swapfile = false
-- Normal regex
vim.opt.magic = true
-- Change the current working directory whenever you
-- open a file, switch buffers, delete a buffer or open/close a window
vim.opt.autochdir = true

-- Maximum number of items to show in the popup menu
vim.opt.pumheight = 10

-- When on, uses highlight-guifg and highlight-guibg attributes
-- in the terminal
vim.opt.termguicolors = true

-- When and how to draw the signcolumn
vim.opt.signcolumn = "yes"

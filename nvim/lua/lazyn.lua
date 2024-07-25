local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazy_path,
    })
end

vim.opt.rtp:prepend(lazy_path)

require("lazy").setup({
    -- Key mappings
    {
        "folke/which-key.nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "echasnovski/mini.icons",
        },
        config = function()
            require("plugins.which-key")
        end,
    },

    -- Color schemes
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
    {
        "navarasu/onedark.nvim",
        config = function()
            require("plugins.onedark")
        end,
    },

    -- Go to everywhere
    {
        "smoka7/hop.nvim",
        version = "*",
        event = "VeryLazy",
        opts = {
            keys = 'etovxqpdygfblzhckisuran'
        },
    },

    -- Maximize this window
    {
        "declancm/maximize.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.maximize")
        end
    },

    -- Symbols outline
    {
        "simrat39/symbols-outline.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.symbols-outline")
        end
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        build = ":TSUpdate",
        config = function()
            require("plugins.nvim-treesitter")
        end,
    },

    -- Complete
    {
        "hrsh7th/nvim-cmp",
        event = "VeryLazy",
        dependencies = {
		    "onsails/lspkind.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-emoji",
            "hrsh7th/cmp-cmdline",
        },
        config = function()
            require("plugins.nvim-cmp")
        end,
    },

	-- Code snippet engine
    {
        "L3MON4D3/LuaSnip",
        -- Follow latest release
        -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        version = "v2.*",
        -- Install jsregexp (optional!)
        build = "make install_jsregexp"
    },

    -- Lsp
    {
        "neovim/nvim-lspconfig",
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("plugins.mason")
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("plugins.mason-lspconfig")
        end,
    },
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        -- For default options, refer to the configuration section for custom setup.
        opts = {},
    },
    {
        "nvimdev/lspsaga.nvim",
        event = "LspAttach",
        config = function()
            require("plugins.lspsaga")
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        }
    },
    {
        "zbirenbaum/neodim",
        event = "LspAttach",
        config = function()
            require("plugins.neodim")
        end,
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim", tag = '0.1.6',
        event = "VeryLazy",
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("plugins.telescope")
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        event = "VeryLazy",
        build = "make",
        cond = function()
            return vim.fn.executable("make") == 1
        end,
    },
    {
        "gbrlsnchs/telescope-lsp-handlers",
        event = "VeryLazy",
        dependencies = "nvim-telescope/telescope.nvim",
    },
    {
        "AckslD/nvim-neoclip.lua",
        event = "VeryLazy",
        dependencies = {
            { "kkharji/sqlite.lua", module = "sqlite" },
            { "nvim-telescope/telescope.nvim" },
        },
        config = function()
            require("plugins.neoclip")
        end,
    },
    {
        "dhruvmanila/browser-bookmarks.nvim",
        version = '*',
        event = "VeryLazy",
        dependencies = "nvim-telescope/telescope.nvim",
        config = function()
            require("plugins.browser-bookmarks")
        end,
    },
    {
        "xiyaowong/telescope-emoji",
        event = "VeryLazy",
        dependencies = "nvim-telescope/telescope.nvim",
    },

    -- Nvim tree
    {
        "kyazdani42/nvim-tree.lua",
        event = "VeryLazy",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("plugins.nvim-tree")
        end,
    },

    -- Buffer as tab
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("plugins.bufferline")
        end,
    },

    -- Status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("plugins.lualine")
        end,
    },

    -- Surround functionality
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("plugins.nvim-surround")
        end
    },

    -- Indent lines
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPost",
        main = "ibl",
        opts = {}
    },

    -- Markdown
    -- Debug: cd ~/.local/share/nvim/lazy/markdown-preview.nvim/app && npm install
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreview" },
        ft = { "markdown" },
        build = "cd app && npm install",
    },
    {
        "mzlogin/vim-markdown-toc",
        -- Load on VeryLazy event
        event = "VeryLazy",
    },
    {
        "MeanderingProgrammer/markdown.nvim",
        event = "VeryLazy",
        -- Only needed if you have another plugin named markdown.nvim
        name = "render-markdown",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function()
            require("plugins.render-markdown")
        end,
    },

    -- Library of 40+ independent Lua modules improving overall Neovim (version 0.8 and higher) experience with minimal effort
    {
        "echasnovski/mini.nvim",
        event = "VeryLazy",
        version = "*"
    },

    -- None ls
    {
        "nvimtools/none-ls.nvim",
        event = "VeryLazy",
        dependencies = "nvim-lua/plenary.nvim"
    },
})

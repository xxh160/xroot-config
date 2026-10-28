local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazy_path) then
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
    -- Nice notify
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        priority = 1000,
        config = function()
            require("plugins.nvim-notify")
        end,
    },

    -- Color schemes
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
    },
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("plugins.onedark")
        end,
    },
    {
        'projekt0n/github-nvim-theme',
        name = 'github-theme',
        lazy = false,
        priority = 1000,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
        config = function()
            require("plugins.rose-pine")
        end
    },

    -- Scrollbar
    {
        "lewis6991/satellite.nvim",
        config = function()
            require("plugins.satellite")
        end,
    },

    -- Dims inactive portions of the code
    {
        "folke/twilight.nvim",
        config = function()
            require("plugins.twilight")
        end,
    },

    -- Focus!
    {
        "folke/zen-mode.nvim",
        dependencies = {
            "folke/twilight.nvim",
        },
        config = function()
            require("plugins.zen-mode")
        end,
    },

    -- Git
    {
        "tpope/vim-fugitive",
        event = "VeryLazy",
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

    -- Symbols outline, a tree like view for symbols
    {
        "hedyhli/outline.nvim",
        main = "outline",
        event = "VeryLazy",
        opts = {}
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("plugins.nvim-treesitter")
        end,
    },
    -- Syntax textobjects use the current standalone API.
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function()
            require("plugins.treesitter-textobjects")
        end,
    },
    -- Shows the context of the currently visible buffer contents
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function()
            require("plugins.nvim-treesitter-context")
        end,
    },
    -- Auto tag
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}
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
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
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

    {
        "rainbowhxch/accelerated-jk.nvim",
    },

    -- Lsp
    {
        "neovim/nvim-lspconfig",
    },
    {
        "mason-org/mason.nvim",
        config = function()
            require("plugins.mason")
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp", "folke/which-key.nvim" },
        config = function()
            require("plugins.mason-lspconfig")
        end,
    },
    {
        "folke/trouble.nvim",
        cmd = { "Trouble" },
        -- For default options, refer to the configuration section for custom setup.
        opts = {},
    },
    {
        "nvimdev/lspsaga.nvim",
        -- event = "LspAttach",
        config = function()
            require("plugins.lspsaga")
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        }
    },
    -- Extensible UI for Neovim notifications and LSP progress messages
    {
        "j-hui/fidget.nvim",
        config = function()
            require("plugins.fidget")
        end
    },

    -- Telescope
    -- Load telescope plugins in telescope.lua
    {
        "nvim-telescope/telescope.nvim",
        branch = "master",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim", "xiyaowong/telescope-emoji", "nvim-telescope/telescope-ui-select.nvim", "AckslD/nvim-neoclip.lua", "natecraddock/workspaces.nvim" },
        config = function()
            require("plugins.telescope")
        end,
    },
    -- FZF: telescope.load_extension("fzf")
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        event = "VeryLazy",
        build = "make",
        cond = function()
            return vim.fn.executable("make") == 1
        end,
    },
    -- Emoji: telescope.load_extension("emoji")
    {
        "xiyaowong/telescope-emoji",
        event = "VeryLazy",

    },
    -- Ui-select: telescope.load_extension("ui-select")
    {
        "nvim-telescope/telescope-ui-select.nvim",
        event = "VeryLazy",

    },
    -- Sessions: telescope.load_extension("persisted")
    {
        "olimorris/persisted.nvim",
        -- Ensure the plugin loads only when a buffer has been loaded
        event = "BufReadPre",

        config = function()
            require("plugins.persisted")
        end,
    },
    -- Workspaces: telescope.load_extension("workspaces")
    {
        "natecraddock/workspaces.nvim",
        dependencies = {
            "olimorris/persisted.nvim",
        },
        config = function()
            require("plugins.workspaces")
        end,
    },
    -- Clipboard: telescope.load_extension("neocllip")
    {
        "AckslD/nvim-neoclip.lua",
        event = "VeryLazy",
        dependencies = {
            { "kkharji/sqlite.lua",           module = "sqlite" },

        },
        config = function()
            require("plugins.neoclip")
        end,
    },


    -- Nvim tree
    {
        "nvim-tree/nvim-tree.lua",
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

    -- Marks
    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.marks")
        end
    },

    -- Indent lines
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPost",
        main = "ibl",
        opts = {}
    },

    -- Library of 40+ independent Lua modules improving overall Neovim (version 0.8 and higher) experience with minimal effort
    {
        "nvim-mini/mini.nvim",
        event = "VeryLazy",
        version = "*"
    },

    -- None ls
    {
        "nvimtools/none-ls.nvim",
        event = "VeryLazy",
        dependencies = "nvim-lua/plenary.nvim",
        config = function() require("plugins.none-ls") end,
    },

    -- Start screen
    {
        "goolord/alpha-nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("plugins.alpha-nvim")
        end,
    },

    -- ToggleTerm
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("plugins.toggleterm")
        end,
    },

    -- Key mappings
    {
        "folke/which-key.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-mini/mini.icons",
        },
        config = function()
            require("plugins.which-key")
        end,
    },
}, { rocks = { enabled = false } })

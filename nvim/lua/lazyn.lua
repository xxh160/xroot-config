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

    -- Latex
    {
        "lervag/vimtex",
        lazy = false, -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            require("plugins.vimtex")
        end
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
        "simrat39/symbols-outline.nvim",
        event = "VeryLazy",
        opts = {}
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
    -- Debug
    {
        "nvim-treesitter/playground",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
    -- Syntax aware text-objects, select, move, swap, and peek support
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "nvim-treesitter/nvim-treesitter",
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
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        dependencies = "nvim-treesitter/nvim-treesitter",
        opts = {}
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
        -- event = "LspAttach",
        config = function()
            require("plugins.lspsaga")
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        }
    },
    -- Dimming the highlights of unused things
    {
        "zbirenbaum/neodim",
        event = "LspAttach",
        config = function()
            require("plugins.neodim")
        end,
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
        tag = '0.1.6',
        event = "VeryLazy",
        dependencies = { 'nvim-lua/plenary.nvim' },
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
    -- Lsp handlers: telescope.load_extension("lsp_handlers")
    {
        "gbrlsnchs/telescope-lsp-handlers",
        event = "VeryLazy",
        dependencies = "nvim-telescope/telescope.nvim",
    },
    -- Emoji: telescope.load_extension("emoji")
    {
        "xiyaowong/telescope-emoji",
        event = "VeryLazy",
        dependencies = "nvim-telescope/telescope.nvim",
    },
    -- Ui-select: telescope.load_extension("ui-select")
    {
        "nvim-telescope/telescope-ui-select.nvim",
        event = "VeryLazy",
        dependencies = "nvim-telescope/telescope.nvim",
    },
    -- Sessions: telescope.load_extension("persisted")
    {
        "olimorris/persisted.nvim",
        -- Ensure the plugin loads only when a buffer has been loaded
        event = "BufReadPre",
        dependencies = "nvim-telescope/telescope.nvim",
        config = function()
            require("plugins.persisted")
        end,
    },
    -- Workspaces: telescope.load_extension("workspaces")
    {
        "natecraddock/workspaces.nvim",
        dependencies = {
            "olimorris/persisted.nvim",
            "nvim-telescope/telescope.nvim"
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
            { "nvim-telescope/telescope.nvim" },
        },
        config = function()
            require("plugins.neoclip")
        end,
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
        event = "VeryLazy",
    },
    {
        "MeanderingProgrammer/markdown.nvim",
        event = "FileType markdown",
        -- Only needed if you have another plugin named markdown.nvim
        name = "render-markdown",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
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
            "echasnovski/mini.icons",
        },
        config = function()
            require("plugins.which-key")
        end,
    },
})

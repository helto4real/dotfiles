-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup(
    {
        {
            -- Tokyo night theme
            'folke/tokyonight.nvim',
            as = 'tokyonight',
        },
        {
            "iamcco/markdown-preview.nvim",
            cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
            build = "cd app && yarn install",
            init = function()
                vim.g.mkdp_filetypes = { "markdown" }
                vim.g.mkdp_browser = "/usr/bin/wslview"
                vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
            end,
            ft = { "markdown" },
        },
        { 'akinsho/toggleterm.nvim' },
        --  The configuration is done below. Search for lspconfig to find it below.
        {
            -- LSP Configuration & Plugins
            'neovim/nvim-lspconfig',
            dependencies = {
                -- Automatically install LSPs to stdpath for neovim
                { 'williamboman/mason.nvim', config = true },
                'williamboman/mason-lspconfig.nvim',

                -- Useful status updates for LSP
                -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
                { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

                -- Additional lua configuration, makes nvim stuff amazing!
                'folke/neodev.nvim',
            },
        },
        {
            -- Set lualine as statusline
            'nvim-lualine/lualine.nvim',
            -- See `:help lualine.txt`
            opts = {
                options = {
                    icons_enabled = true,
                    theme = 'nightfly',
                    component_separators = '|',
                    section_separators = '',
                },
            },
        },
        {
            -- Highlight, edit, and navigate code
            'nvim-treesitter/nvim-treesitter',
            dependencies = {
                'nvim-treesitter/nvim-treesitter-textobjects',
            },
            build = ':TSUpdate',
        },
        {
            -- enables undo in several steps
            'mbbill/undotree'
        },
        {
            'christoomey/vim-tmux-navigator',
        },
        {
            'numToStr/Comment.nvim',
        },
        -- Fuzzy Finder (files, lsp, etc)
        {
            'nvim-telescope/telescope.nvim',
            branch = '0.1.x',
            dependencies = {
                'nvim-lua/plenary.nvim',
                -- Fuzzy Finder Algorithm which requires local dependencies to be built.
                -- Only load if `make` is available. Make sure you have the system
                -- requirements installed.
                {
                    'nvim-telescope/telescope-fzf-native.nvim',
                    -- NOTE: If you are having trouble with this installation,
                    --       refer to the README for telescope-fzf-native for more instructions.
                    build = 'make',
                    cond = function()
                        return vim.fn.executable 'make' == 1
                    end,
                },
            },
        },
        {
            -- Autocompletion
            'hrsh7th/nvim-cmp',
            dependencies = {
                -- Snippet Engine & its associated nvim-cmp source
                'L3MON4D3/LuaSnip',
                'saadparwaiz1/cmp_luasnip',
                -- Adds LSP completion capabilities
                'hrsh7th/cmp-nvim-lsp',
                -- Adds a number of user-friendly snippets
                'rafamadriz/friendly-snippets',
            },
        },
        -- Git related plugins
        'tpope/vim-fugitive',
        'tpope/vim-rhubarb',
        'nvim-tree/nvim-tree.lua',
        'kyazdani42/nvim-web-devicons',
        { 'folke/which-key.nvim',   opts = {} },
        'simrat39/rust-tools.nvim',
        -- Debugging
        'nvim-lua/plenary.nvim',
        'mfussenegger/nvim-dap',
        'folke/zen-mode.nvim',
        'theHamsta/nvim-dap-virtual-text',
        {
            'stevearc/dressing.nvim',
            event = "VeryLazy",
        },
        {
            "folke/trouble.nvim",
            --dependencies = { "nvim-tree/nvim-web-devicons" },
            opts = {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            },
        },
        {
            "rest-nvim/rest.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
        },
        { 'github/copilot.vim' },
        {
            "folke/flash.nvim",
            event = "VeryLazy",
            ---@type Flash.Config
            opts = {},
            -- stylua: ignore
            keys = {
                {
                    "s",
                    mode = { "n", "o", "x" },
                    function()
                        require("flash").jump(
                            {
                                search = {
                                    mode = function(str)
                                        return "\\<" .. str
                                    end,
                                },
                            }

                        )
                    end,
                    desc = "Flash"
                },
                {
                    "S",
                    mode = { "n", "o", "x" },
                    function() require("flash").treesitter() end,
                    desc =
                    "Flash Treesitter"
                },
                {
                    "r",
                    mode = "o",
                    function() require("flash").remote() end,
                    desc =
                    "Remote Flash"
                },
                {
                    "R",
                    mode = { "o", "x" },
                    function() require("flash").treesitter_search() end,
                    desc =
                    "Treesitter Search"
                },
                {
                    "<c-s>",
                    mode = { "c" },
                    function() require("flash").toggle() end,
                    desc =
                    "Toggle Flash Search"
                },
            },
        },
        {
            'pwntester/octo.nvim',
            requires = {
                'nvim-lua/plenary.nvim',
                'nvim-telescope/telescope.nvim',
                'nvim-tree/nvim-web-devicons',
            },
            config = function()
                require "octo".setup()
            end
        },
        {
            "lewis6991/gitsigns.nvim"
        },
        { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
        {
            "folke/noice.nvim",
            event = "VeryLazy",
            opts = {
                -- add any options here
            },
            dependencies = {
                -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                "MunifTanjim/nui.nvim",
                -- OPTIONAL:
                --   `nvim-notify` is only needed, if you want to use the notification view.
                --   If not available, we use `mini` as the fallback
                "rcarriga/nvim-notify",
            }
        },
        { "Issafalcon/lsp-overloads.nvim" },
        {
            "nvim-neotest/neotest",
            event = "VeryLazy",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "antoinemadec/FixCursorHold.nvim",
                "nvim-treesitter/nvim-treesitter",
                "Issafalcon/neotest-dotnet",
            },
            -- config = function()
            --     local neotest = require("neotest")
            --     neotest.setup({
            --         log_level = 1,
            --         adapters = {
            --             require("neotest-dotnet")({
            --                 dicovery_root = "solution",
            --             }),
            --         },
            --         icons = {
            --             expanded = "",
            --             child_prefix = "",
            --             child_indent = "",
            --             final_child_prefix = "",
            --             non_collapsible = "",
            --             collapsed = "",
            --             passed = "",
            --             running = "",
            --             failed = "",
            --             unknown = "",
            --             skipped = "",
            --         },
            --     })
            -- end,
        },
        -- {
        --     "neovim/nvim-lspconfig",
        --     opts = {
        --         servers = {
        --             mojo = {},
        --         },
        --     },
        -- },
        {
            "czheo/mojo.vim",
            ft = { "mojo" },
            init = function()
                -- local util = require("lazyvim.util")
                --
                -- local function format_mojo()
                --     if util.format.enabled() then
                --         vim.cmd("noa silent! !mojo format --quiet " .. vim.fn.expand("%:p"))
                --     end
                -- end
                -- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                --     pattern = { "*.🔥", "*.mojo" },
                --     nested = true,
                --     callback = format_mojo,
                -- })
                -- vim.api.nvim_create_autocmd("FileType", {
                --     pattern = "mojo",
                --     callback = function()
                --         vim.bo.expandtab = true
                --         vim.bo.shiftwidth = 4
                --         vim.bo.softtabstop = 4
                --         vim.bo.tabstop = 4
                --         vim.bo.commentstring = "# %s"
                --     end,
                -- })
                -- vim.api.nvim_create_autocmd("ColorScheme", {
                --     pattern = "*",
                --     callback = function()
                --         local ns = vim.api.nvim_create_namespace("mojo")
                --
                --         vim.api.nvim_set_hl_ns(ns)
                --
                --         vim.api.nvim_set_hl(ns, "@variable.python", {})
                --         vim.api.nvim_set_hl(ns, "@error.python", {})
                --         vim.api.nvim_set_hl(ns, "@repeat.python", {})
                --     end,
                -- })
                vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
                    pattern = { "*.🔥" },
                    callback = function()
                        if vim.bo.filetype ~= "mojo" then
                            vim.bo.filetype = "mojo"
                        end
                    end,
                })

                vim.api.nvim_create_autocmd("FileType", {
                    pattern = "mojo",
                    callback = function()
                        local modular = vim.env.MODULAR_HOME
                        local lsp_cmd = modular .. "/pkg/packages.modular.com_mojo/bin/mojo-lsp-server"

                        vim.bo.expandtab = true
                        vim.bo.shiftwidth = 4
                        vim.bo.softtabstop = 4

                        vim.lsp.start({
                            name = "mojo",
                            cmd = { lsp_cmd },
                        })
                    end,
                })
            end,
        },
        require 'helto4real.plugins.debug',

        -- Detect tabstop and shiftwidth automatically
        --'tpope/vim-sleuth',

        --{
        --    -- Highlight, edit, and navigate code
        --    'nvim-treesitter/nvim-treesitter',
        --    dependencies = {
        --      'nvim-treesitter/nvim-treesitter-textobjects',
        --    },
        --    build = ':TSUpdate',
        --},
    }
)

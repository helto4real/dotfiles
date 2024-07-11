return {
    {
        'tpope/vim-fugitive',
        event = "VeryLazy",
    },
    {
        'tpope/vim-rhubarb',
        event = "VeryLazy",
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
    },
    {
        'pwntester/octo.nvim',
        event = "VeryLazy",
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
        "NeogitOrg/neogit",
        keys = {
            {
                "<leader>gg",
                function()
                    require("neogit").open({ kind = "split" })
                end,
                desc = "(G)it Neo(g)it",
            },
            {
                "<leader>gc",
                function()
                    require("neogit").open({ "commit", "-a", kind = "split"})
                end,
                desc = "(G)it (C)ommit",
            },
            {
                "<leader>gd",
                function()
                    require("neogit").open({ "diff", kind = "split"})
                end,
                desc = "(G)it (D)iff",
            },
            {
                "<leader>gs",
                function()
                    require("neogit").open({ "status", kind = "split"})
                end,
                desc = "(G)it (S)tatus",
            },
        },
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",  -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed, not both.
            "nvim-telescope/telescope.nvim", -- optional
        },
        config = true
    }
}

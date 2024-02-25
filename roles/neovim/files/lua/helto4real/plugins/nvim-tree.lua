return {
    'nvim-tree/nvim-tree.lua',
    -- event = "VeryLazy",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", event = "VeryLazy" },
        { 'nvim-treesitter/nvim-treesitter-textobjects', event = "VeryLazy" },
    },
    config = function()
        vim.g.loaded = 1
        vim.g.loaded_netrwPlugin = 1
        vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
        vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])
        local nvimtree = require("nvim-tree")
        nvimtree.setup(
            {
                view = {
                    width = 35,
                    relativenumber = true,
                }, -- change folder arrow icons
                renderer = {
                    icons = {
                        glyphs = {
                            folder = {
                                arrow_closed = "", -- arrow when folder is closed
                                arrow_open = "", -- arrow when folder is open
                            },
                        },
                    },
                },
                -- disable window_picker for
                -- explorer to work well with
                -- window splits
                actions = {
                    open_file = {
                        window_picker = {
                            enable = false,
                        },
                    },
                },
            })
        -- set keymaps
        local keymap = vim.keymap -- for conciseness
        keymap.set("n", "<C-p>", ":NvimTreeFindFileToggle<CR>", { desc = "Toggle file tree" })
    end,
}

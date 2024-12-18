return
{
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set(
            "n",
            "-",
            "<cmd>Oil<cr>",
            { desc = "Open Oil file manager" }
        )
        require("oil").setup()
    end,
}

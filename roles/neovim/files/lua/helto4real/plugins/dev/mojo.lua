return {
    "czheo/mojo.vim",
    ft = { "mojo" },
    event = "VeryLazy",
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
}

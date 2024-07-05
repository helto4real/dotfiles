local get_default_branch = "git rev-parse --symbolic-full-name refs/remotes/origin/HEAD | sed 's!.*/!!'"
local base_branch = vim.fn.system(get_default_branch) or "main"

return {
    'axkirillov/easypick.nvim',
    requires = 'nvim-telescope/telescope.nvim',
    event = "VeryLazy",
    config = function()
        local easypick = require('easypick')
        easypick.setup({
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below

            pickers = {
                {
                    -- name for your custom picker, that can be invoked using :Easypick <name> (supports tab completion)
                    name = "ls",
                    -- the command to execute, output has to be a list of plain text entries
                    command = "ls",
                    -- specify your custom previwer, or use one of the easypick.previewers
                    previewer = easypick.previewers.default()
                },

                -- diff current branch with base_branch and show files that changed with respective diffs in preview
                {
                    name = "changed_files",
                    command = "git diff --name-only $(git merge-base HEAD " .. base_branch .. " )",
                    previewer = easypick.previewers.branch_diff({ base_branch = base_branch })
                },

                -- list files that have conflicts with diffs in preview
                {
                    name = "conflicts",
                    command = "git diff --name-only --diff-filter=U --relative",
                    previewer = easypick.previewers.file_diff()
                },
            },
        })
        local keymap = vim.keymap
        keymap.set('n', '<leader>fc', '<cmd>Easypick changed_files<cr>', { desc = '[F]ind [C]hanged git files' })
    end,

}

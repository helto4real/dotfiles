return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
        },
        keys = {
            {
                "<leader>ccq",
                function()
                    local input = vim.fn.input("Quick Chat: ")
                    if input ~= "" then
                        require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
                    end
                end,
                desc = "CopilotChat - Quick chat",
            },
            {
                "<leader>cch",
                function()
                    local actions = require("CopilotChat.actions")
                    require("CopilotChat.integrations.telescope").pick(actions.help_actions())
                end,
                desc = "CopilotChat - [H]elp actions",
            },
            {
                "<leader>cca",
                function()
                    local actions = require("CopilotChat.actions")
                    require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
                end,
                desc = "CopilotChat - Prompt [A]ctions",
            },
            {
                "<leader>ccc",
                ":CopilotChatCommit<CR>",
                desc = "CopilotChat - [C]ommit Message",
            },
            {
                "<leader>ccd",
                ":CopilotChatDocs<CR>",
                desc = "CopilotChat - [D]ocumentation",
            },
            {
                "<leader>ccf",
                ":CopilotChatFixDiagnostic<CR>",
                desc = "CopilotChat - [F]ix Diagnostic",
            },
        },
        opts = {
            -- debug = true, -- Enable debugging
            -- See Configuration section for rest
        },
        -- See Commands section for default commands if you want to lazy load on them
    },
}

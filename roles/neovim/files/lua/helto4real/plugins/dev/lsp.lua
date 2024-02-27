return {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    -- event = { "BufReadPre", "BufNewFile" },
    event = "VeryLazy",
    dependencies = {
        { 'williamboman/mason.nvim',                   event = "VeryLazy" },
        { 'williamboman/mason-lspconfig.nvim',         event = "VeryLazy" },
        -- Adds LSP completion capabilities
        { 'hrsh7th/cmp-nvim-lsp',                      event = "VeryLazy" },
        -- Show overloads for LSP
        { "Issafalcon/lsp-overloads.nvim",             event = "VeryLazy" },
        -- Adds LSP completion capabilities
        { "Issafalcon/lsp-overloads.nvim",             event = "VeryLazy" },
        -- Useful status updates for LSP
        { 'j-hui/fidget.nvim',                         event = "VeryLazy", tag = 'legacy', opts = {} },
        -- Additional lua configuration, makes nvim stuff amazing!
        { 'folke/neodev.nvim',                         event = "VeryLazy" },
        { "williamboman/mason-lspconfig.nvim",         event = "VeryLazy" },
        { "WhoIsSethDaniel/mason-tool-installer.nvim", event = "VeryLazy" },
    },
    config = function()
        local on_attach = function(client, bufnr)
            -- for LSP related items. It sets the mode, buffer and description for us each time.
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end
                vim.keymap.set('n', keys, func, { noremap = true, silent = true, buffer = bufnr, desc = desc })
            end

            --- Guard against servers without the signatureHelper capability
            if client.server_capabilities.signatureHelpProvider then
                require('lsp-overloads').setup(client, {})
            end

            nmap('<leader>e', '<cmd>TroubleToggle<CR>', '[e]rrors')
            nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
            nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
            nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
            nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
            nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
            nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
            nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
            nmap('<leader>gs', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
            nmap('<leader>I', require('telescope.builtin').lsp_incoming_calls, '[I]ncoming calls')
            -- See `:help K` for why this keymap
            nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
            nmap('<leader>k', vim.lsp.buf.signature_help, 'Signature Documentation')
            -- Lesser used LSP functionality

            -- Workspace related LSP functionality, not used often
            -- nmap('<leader>wwa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
            -- nmap('<leader>wwr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
            -- nmap('<leader>wwl', function()
            --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            -- end, '[W]orkspace [L]ist Folders')
            -- Create a command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                vim.lsp.buf.format()
            end, { desc = 'Format current buffer with LSP' })

            nmap("<leader>cf", ":Format<CR>", "[C]ode [F]ormat the current buffer with LSP")
            -- quick fix naviagtion
            --vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
            --vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
            --vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
            --vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
            -- Setup neovim lua configuration

            -- only setup on attach
        end

        -- neodev setup before lspconfig
        require('neodev').setup()
        local mason_lspconfig = require("mason-lspconfig")

        local mason_tool_installer = require("mason-tool-installer")


        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                'omnisharp',
                'html',
                'v_analyzer',
                'lua_ls',
                'yamlls',
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
        })
        -- install mason tools
        mason_tool_installer.setup({
            ensure_installed = {
                -- "prettier", -- prettier formatter
            },
        })
        local lspconfig = require("lspconfig")

        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- require('helto4real.autoload.dap')

        -- configure html server
        lspconfig["html"].setup({
            capabilities = capabilities,
            filetypes = { 'html', 'twig', 'hbs' },
            on_attach = on_attach,
        })

        -- configure lua server
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            filetypes = { 'lua' },
            on_attach = on_attach,
            settings = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
        })

        -- configure v-language server
        lspconfig["v_analyzer"].setup({
            capabilities = capabilities,
            filetypes = { 'v' },
            on_attach = on_attach,
        })

        -- configure yaml server
        lspconfig["yamlls"].setup({
            capabilities = capabilities,
            filetypes = { 'yaml', 'yml' },
            on_attach = on_attach,
        })
        -- configure c# (omnisharp) server
        lspconfig["omnisharp"].setup({
            capabilities = capabilities,
            cmd = { "dotnet", vim.fn.stdpath "data" .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
            enable_import_completion = true,
            organize_imports_on_format = true,
            enable_roslyn_analyzers = true,
            root_dir = function()
                return vim.loop.cwd() -- current working directory
            end,
            filetypes = { 'cs' },
            on_attach = on_attach,
        })
    end,
}

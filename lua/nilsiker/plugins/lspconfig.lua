return {
    "neovim/nvim-lspconfig",
    priority = 1000,
    dependencies = {
        "folke/lazydev.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "L3MON4D3/LuaSnip",
        "folke/neoconf.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require('lazydev').setup() -- setup some niceties for lua lsp (like vim globals)
        require("neoconf").setup()
        require("mason").setup()
        require("mason-lspconfig").setup({
            automatic_installation = {
                "lua_ls",
            },
            ensure_installed = {
                "lua_ls",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,

                ["emmet_ls"] = function()
                    local lspconfig = require('lspconfig')
                    lspconfig.emmet_ls.setup({
                        -- on_attach = on_attach,
                        capabilities = capabilities,
                        -- add "rust" to add emmet for rsx stuff (should find a way to scope this more)
                        filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
                        init_options = {
                            html = {
                                options = {
                                    -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                                    ["bem.enabled"] = true,
                                },
                            },
                        }
                    })
                end,

                ["erlangls"] = function()
                    local lspconfig = require 'lspconfig'
                    lspconfig.erlang_ls.setup({})
                end
            }
        })

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if not client then return end

                -- setup format on save
                ---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                        end
                    })
                else
                    print('lsp ' .. client.id .. ' does not support formatting')
                end

                -- Enable completion triggered by <c-x><c-o>
                vim.bo[args.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = args.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<space>f', function()
                    vim.lsp.buf.format { bufnr = args.buf, id = client.id }
                end, opts)
            end,
        })
    end
}

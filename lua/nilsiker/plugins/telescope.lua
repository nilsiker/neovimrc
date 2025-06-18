return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",                                       -- required!
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' } -- makes telescope faster!

    },
    config = function()
        local pickers = require "telescope.pickers"
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("🔍 ") })
        end)
        vim.keymap.set("n", "<leader>pc", function()
            builtin.find_files { cwd = vim.fn.stdpath "config" }
        end)
        vim.keymap.set("n", "<leader>ws", builtin.lsp_workspace_symbols)
        vim.keymap.set("n", "<leader>pt", builtin.treesitter)
        vim.keymap.set("n", "<leader>pd", builtin.diagnostics)

        require 'telescope'.setup({
            --pickers = {
            --    grep_string = {
            --        theme = "cursor"
            --    }
            --}
            file_ignore_patterns = {
                "%.uid"
            }
        })
    end
}

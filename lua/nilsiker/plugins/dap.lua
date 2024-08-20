return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require('dap')

        vim.keymap.set("n", "<F5>", function()
            dap.continue()
        end)
        vim.keymap.set("n", "<F8>", function()
            dap.stop()
        end)
        vim.keymap.set("n", "<F9>", function()
            dap.step_over()
        end)
        vim.keymap.set("n", "<F10>", function()
            dap.step_into()
        end)
    end
}

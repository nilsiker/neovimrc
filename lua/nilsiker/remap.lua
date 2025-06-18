vim.keymap.set("n", "<leader>ww", vim.cmd.w)
vim.keymap.set("n", "<leader>wa", vim.cmd.wa)
vim.keymap.set("n", "<leader>wq", vim.cmd.wq)
vim.keymap.set("n", "<leader>qq", vim.cmd.q)
vim.keymap.set("n", "<leader>qa", vim.cmd.qa)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>gl", "<cmd>CellularAutomaton game_of_life<CR>")
vim.keymap.set("n", "€", "<Home>")

vim.keymap.set("n", "<leader>li", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(nil))
end)

vim.keymap.set("n", "€", "<Home>")


vim.keymap.set("n", "<leader>cr", ":!cargo run<CR>")

vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>', { noremap = true, silent = true })

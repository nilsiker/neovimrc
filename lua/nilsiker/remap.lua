vim.keymap.set("n", "<leader>we", vim.cmd.w)
vim.keymap.set("n", "<leader>wa", vim.cmd.wa)
vim.keymap.set("n", "<leader>wq", vim.cmd.wq)
vim.keymap.set("n", "<leader>q", vim.cmd.q)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>gl", "<cmd>CellularAutomaton game_of_life<CR>")
vim.keymap.set("n", "€", "<Home>")

return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        vim.cmd("autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE")
        vim.cmd [[colorscheme gruvbox]]
    end
}

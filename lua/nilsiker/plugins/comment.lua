return {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    config = function()
        require('Comment').setup({
            toggler = {
                line = '<leader>cl',
                block = '<leader>cb',
            }
        })
    end,
}

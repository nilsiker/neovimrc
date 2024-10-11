return {
    "nilsiker/parrot.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "ibhagwan/fzf-lua" },
    config = function()
        require("parrot").setup {
            -- Providers must be explicitly added to make them available.
            providers = {
                -- provide an empty list to make provider available (no API key required)
                ollama = {
                    endpoint = "http://localhost:11434/api/chat",
                    topic_prompt = [[
                        Summarize the chat above and only provide a short headline of 2 to 3
                        words. Leave out any opening phrase like "Sure, here is the summary",
                        "Sure! Here's a shortheadline summarizing the chat" or anything similar.
                    ]],
                    topic = {
                        model = "codellama:7b",
                        params = { max_tokens = 24 },
                    },
                    params = {
                        chat = { temperature = 1.5, top_p = 1, num_ctx = 8192, min_p = 0.05 },
                        command = { temperature = 1.5, top_p = 1, num_ctx = 8192, min_p = 0.05 },
                    },
                }
            },
        }


        vim.keymap.set('n', '<C-p>t', ":PrtChatToggle<CR>", {})
    end
}

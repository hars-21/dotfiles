return { 
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({
                ensure_installed = {
                    "lua",
                    "javascript",
                    "typescript",
                    "html",
                    "css",
                    "bash",
                    "json",
                    "c",
                    "cpp",
                    "python",
                },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    }
}


return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities =
        require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.enable("lua_ls", { capabilities = capabilities })
      vim.lsp.enable("pyright", { capabilities = capabilities })
      vim.lsp.enable("ts_ls", { capabilities = capabilities })
    end,
  },
}


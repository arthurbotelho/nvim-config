return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "gopls", "tsserver" },
        automatic_installation = true,
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require "lspconfig"
      lspconfig.lua_ls.setup {}
      lspconfig.tsserver.setup {}
      lspconfig.gopls.setup {}
      lspconfig.jsonls.setup {}

      lspconfig.clangd.setup {
        cmd = {
          "clangd-18",
          "--offset-encoding=utf-16",
          "--fallback-style=llvm",
        },
      }

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })
    end,
  },
}

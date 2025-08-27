return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },

    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      -- LSP configs

      vim.lsp.enable "lua_ls"
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("glslls", {
        cmd = { "glslls", "--stdin" },
        filetypes = { "glsl", "vert", "tesc", "tese", "frag", "geom", "comp" },
        single_file_support = true,
        capabilities = {
          textDocument = {
            completion = {
              editsNearCursor = true,
            },
          },
          offsetEncoding = { "utf-8", "utf-16" },
        },
      })

      vim.lsp.config("gopls", {})

      vim.lsp.config("jsonls", {})

      vim.lsp.config("gradle_ls", { capabilities = capabilities })

      vim.lsp.config("cssls", { capabilities = capabilities })

      vim.lsp.config("clangd", {
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--offset-encoding=utf-16",
          "--fallback-style=llvm",
        },
      })

      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
            cargo = {
              allFeatures = true,
            },
            formatting = {
              enable = true,
            },
          },
        },
      })

      vim.lsp.config("glslls", {
        cmd = { "glslls", "--stdin" },
        filetypes = { "glsl", "vert", "tesc", "tese", "frag", "geom", "comp" },
        single_file_support = true,
        capabilities = {
          textDocument = {
            completion = {
              editsNearCursor = true,
            },
          },
          offsetEncoding = { "utf-8", "utf-16" },
        },
      })

      vim.lsp.config("gopls", {})

      vim.lsp.config("jsonls", {})

      vim.lsp.config("gradle_ls", { capabilities = capabilities })

      vim.lsp.config("cssls", { capabilities = capabilities })

      vim.lsp.config("clangd", {
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--offset-encoding=utf-16",
          "--fallback-style=llvm",
        },
      })

      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
            cargo = {
              allFeatures = true,
            },
            formatting = {
              enable = true,
            },
          },
        },
      })

      -- hotkey configs
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ne", vim.diagnostic.goto_next, opts)
          vim.keymap.set("n", "<leader>pe", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })
    end,
  },
}

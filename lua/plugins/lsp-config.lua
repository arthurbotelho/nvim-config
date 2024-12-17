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
        ensure_installed = { "lua_ls" },
        automatic_installation = true,
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require "lspconfig"

      lspconfig.glslls.setup {

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
      }
      lspconfig.lua_ls.setup {}
      lspconfig.tsserver.setup {}
      lspconfig.gopls.setup {}
      lspconfig.jsonls.setup {}

      local configs = require("lspconfig.configs")
      if not configs.neocmake then
        configs.neocmake = {
          default_config = {
            cmd = { "neocmakelsp", "--stdio" },
            filetypes = { "cmake" },
            root_dir = function(fname)
              return lspconfig.util.find_git_ancestor(fname)
            end,
            single_file_support = true, -- suggested
            on_attach = on_attach,      -- on_attach is the on_attach function you defined
            init_options = {
              format = {
                enable = true
              },
              lint = {
                enable = true
              },
              scan_cmake_in_package = true -- default is true
            }
          }
        }
        lspconfig.neocmake.setup({})
      end

      lspconfig.kotlin_language_server.setup {}

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      lspconfig.cssls.setup {
        capabilities = capabilities,
      }

      lspconfig.clangd.setup {
        cmd = {
          "clangd",
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
          vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })
    end,
  },
}

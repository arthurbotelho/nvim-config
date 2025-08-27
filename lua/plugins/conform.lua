return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup {
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports" },
        clang = { "clang_format" },
        kotlin = { "ktfmt" },
        rust = { "rustfmt", lsp_format = "fallback" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    }

    vim.keymap.set("n", "<leader>fd", vim.lsp.buf.format, {})
  end,
}

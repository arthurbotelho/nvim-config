return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require "null-ls"

    local ktfmt_formatter = {
      method = null_ls.methods.FORMATTING, -- Specify this is for formatting
      filetypes = { "kotlin" }, -- Filetypes it should apply to
      generator = null_ls.generator {
        command = "java",
        args = { "-jar", os.getenv "HOME" .. "/.local/bin/ktfmt.jar", "--google-style" },
        to_stdin = true, -- Pass file content via stdin
        from_stderr = true, -- Capture errors from stder
      },
    }

    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.diagnostics.cmake_lint,
        null_ls.builtins.formatting.cmake_format,
        ktfmt_formatter,
      },
    }

    vim.keymap.set("n", "<leader>fd", vim.lsp.buf.format, {})
  end,
}

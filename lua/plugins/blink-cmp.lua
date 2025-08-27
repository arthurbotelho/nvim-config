return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },

  build = "cargo +nightly build --release",

  version = "*",
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  build = "cargo build --release",
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "default" },

    appearance = {
      nerd_font_variant = "mono",
    },

    completion = { documentation = { auto_show = false } },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    vim.keymap.set('n', '<M-1>', ':Neotree filesystem reveal right toggle<CR>', {})
    vim.keymap.set('n', '<M-2>', ':Neotree git_status left toggle<CR>', {})
    vim.keymap.set('n', '<M-3>', ':Neotree filesystem focus right<CR>', {})

  end
}

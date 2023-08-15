return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "lua", "rust" },
    textsubjects = {
      enable = true,
      keymaps = {
        ['<cr>'] = 'textsubjects-smart',
        ['.'] = 'textsubjects-container-outer'

      },
    },
  },
  dependencies = {
    "RRethy/nvim-treesitter-textsubjects"
  }
}

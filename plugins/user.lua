return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "unblevable/quick-scope",
    lazy = false,
    init = function()
      vim.g.qs_max_chars = 200
      vim.g.qs_lazy_highlight = 1
      vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
    end
  }
}

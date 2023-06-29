return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.bars-and-lines.dropbar-nvim" },
  { import = "astrocommunity.code-runner.sniprun" },
  { import = "astrocommunity.color.twilight-nvim" },
  { import = "astrocommunity.editing-support.zen-mode-nvim" },

  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
}

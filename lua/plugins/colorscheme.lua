return {
  -- coal früh verfügbar machen, damit LazyVim es sicher setzen kann
  {
    "cranberry-clockworks/coal.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        comments = { italic = false },
        keywords = { bold = true },
        functions = { bold = true },
      },
    },
    config = function(_, opts)
      require("coal").setup(opts)
      vim.cmd.colorscheme("coal")
    end,
  },

  -- LazyVim offiziell auf coal pinnen
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "coal" },
  },
}

-- lua/plugins/colorscheme.lua
return {
  {
    "deparr/tairiki.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      palette = "dark",
      default_dark = "dark",
      default_light = "light",
      transparent = false,
      terminal = false,
      end_of_buffer = false,
      visual_bold = false,
      cmp_itemkind_reverse = false,
      diagnostics = {
        darker = false,
        background = true,
        undercurl = false,
      },
      code_style = {
        comments = { italic = true },
        conditionals = {},
        keywords = {},
        functions = {},
        strings = {},
        variables = {},
        parameters = {},
        types = {},
      },
      lualine = { transparent = true },
      plugins = {
        all = false,
        none = false,
        auto = false,
        treesitter = true,
        semantic_tokens = true,
      },
      colors = function(colors, opts) end,
      highlights = function(groups, colors, opts) end,
    },
    config = function(_, opts)
      require("tairiki").setup(opts)
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tairiki",
    },
  },
}

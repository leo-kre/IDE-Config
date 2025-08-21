-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        theme = "dragon",
        transparent = true, -- no solid backgrounds from the theme
        dimInactive = false,
        terminalColors = true,
        overrides = function(colors)
          return {
            -- core UI
            Normal = { bg = "none" },
            NormalNC = { bg = "none" },
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            SignColumn = { bg = "none" },
            LineNr = { bg = "none" },
            CursorLineNr = { bg = "none" },
            VertSplit = { bg = "none" },
            StatusLine = { bg = "none" },
            StatusLineNC = { bg = "none" },
            TabLineFill = { bg = "none" },
            WinSeparator = { bg = "none" },
            MsgArea = { bg = "none" },

            -- popups / menus
            Pmenu = { bg = "none" },
            PmenuSel = { bg = "none" },
            PmenuSbar = { bg = "none" },
            PmenuThumb = { bg = "none" },

            -- telescope
            TelescopeNormal = { bg = "none" },
            TelescopeBorder = { bg = "none" },

            -- neo-tree / nvim-tree
            NeoTreeNormal = { bg = "none" },
            NeoTreeNormalNC = { bg = "none" },
            NvimTreeNormal = { bg = "none" },
            NvimTreeNormalNC = { bg = "none" },

            -- lsp/ui floats
            LspInfoBorder = { bg = "none" },
            DiagnosticFloatingError = { bg = "none" },
            DiagnosticFloatingWarn = { bg = "none" },
            DiagnosticFloatingInfo = { bg = "none" },
            DiagnosticFloatingHint = { bg = "none" },
          }
        end,
      })
      vim.cmd.colorscheme("kanagawa-dragon")
      -- optional mild blending for popups (does not affect terminal opacity)
      vim.o.pumblend = 10
      vim.o.winblend = 10
    end,
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "kanagawa-dragon" } },
}

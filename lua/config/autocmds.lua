local function ibm_hl()
	local hl = vim.api.nvim_set_hl

	-- Transparenz / Terminal bestimmt Hintergrund
	hl(0, "Normal", { bg = "NONE" })
	hl(0, "NormalFloat", { bg = "NONE" })
	hl(0, "SignColumn", { bg = "NONE" })

	-- Neutral (kein Cyan/Gelb)
	hl(0, "Comment", { fg = "#808080" })
	hl(0, "Keyword", { fg = "#c0c0c0", bold = true })
	hl(0, "Function", { fg = "#ffffff", bold = true })
	hl(0, "Type", { fg = "#c0c0c0", bold = true })
	hl(0, "Identifier", { fg = "#c0c0c0" })
	hl(0, "Constant", { fg = "#c0c0c0" })
	hl(0, "String", { fg = "#c0c0c0" })
	hl(0, "Number", { fg = "#c0c0c0" })

	-- Cursor / Selection
	hl(0, "CursorLine", { bg = "#111111" })
	hl(0, "Visual", { reverse = true })
	hl(0, "LineNr", { fg = "#555555" })
	hl(0, "CursorLineNr", { fg = "#ffffff", bold = true })

	-- Statusline / Tabline (hellgrauer Balken)
	hl(0, "StatusLine", { fg = "#c0c0c0", bg = "NONE" })
	hl(0, "StatusLineNC", { fg = "#555555", bg = "NONE" })
	hl(0, "TabLine", { fg = "#c0c0c0", bg = "NONE" })
	hl(0, "TabLineFill", { bg = "NONE" })
	hl(0, "TabLineSel", { fg = "#ffffff", bg = "NONE", bold = true })

	-- Cmdline / Messages (falls Noice aus)
	hl(0, "MsgArea", { fg = "#c0c0c0", bg = "NONE" })
	hl(0, "MsgSeparator", { fg = "#555555", bg = "NONE" })
	hl(0, "ModeMsg", { fg = "#c0c0c0", bg = "NONE", bold = true })

	-- Noice (Cmdline türkis)
	hl(0, "NoiceCmdline", { fg = "#c0c0c0", bg = "NONE" })
	hl(0, "NoiceCmdlinePrompt", { fg = "#ffffff", bg = "NONE", bold = true })
	hl(0, "NoiceCmdlineIcon", { fg = "#c0c0c0", bg = "NONE" })
	hl(0, "NoiceCmdlinePopup", { fg = "#c0c0c0", bg = "NONE" })
	hl(0, "NoiceCmdlinePopupBorder", { fg = "#555555", bg = "NONE" })
	hl(0, "NoiceCmdlinePopupTitle", { fg = "#c0c0c0", bg = "NONE" })

	-- Treesitter
	hl(0, "@comment", { link = "Comment" })
	hl(0, "@keyword", { link = "Keyword" })
	hl(0, "@function", { link = "Function" })
	hl(0, "@type", { link = "Type" })
	hl(0, "@variable", { link = "Identifier" })
	hl(0, "@constant", { link = "Constant" })
	hl(0, "@string", { link = "String" })
	hl(0, "@number", { link = "Number" })

	-- LSP semantic tokens
	hl(0, "@lsp.type.keyword", { link = "@keyword" })
	hl(0, "@lsp.type.function", { link = "@function" })
	hl(0, "@lsp.type.type", { link = "@type" })
	hl(0, "@lsp.type.variable", { link = "@variable" })
	hl(0, "@lsp.type.constant", { link = "@constant" })
end

vim.api.nvim_create_autocmd("ColorScheme", { callback = ibm_hl })
vim.api.nvim_create_autocmd("User", { pattern = "VeryLazy", callback = ibm_hl })

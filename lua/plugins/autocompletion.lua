return {
  "saghen/blink.cmp",
  version = not vim.g.lazyvim_blink_main and "*",
  build = vim.g.lazyvim_blink_main and "cargo build --release",
  dependencies = {
    "rafamadriz/friendly-snippets",
    { "saghen/blink.compat", optional = true, version = not vim.g.lazyvim_blink_main and "*" },
  },
  event = "InsertEnter",
  opts = {
    snippets = {
      expand = function(snippet, _)
        return LazyVim.cmp.expand(snippet)
      end,
    },
    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "mono",
    },
    completion = {
      accept = { auto_brackets = { enabled = true } },
      menu = { draw = { treesitter = { "lsp" } } },
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
      ghost_text = { enabled = vim.g.ai_cmp },
    },
    sources = {
      compat = {},
      default = { "lsp", "path", "snippets", "buffer" },
    },
    cmdline = { enabled = false },
    keymap = { preset = "enter", ["<C-y>"] = { "select_and_accept" } },
  },
  opts_extend = { "sources.completion.enabled_providers", "sources.compat", "sources.default" },
  config = function(_, opts)
    local enabled = opts.sources.default
    for _, src in ipairs(opts.sources.compat or {}) do
      opts.sources.providers[src] =
        vim.tbl_deep_extend("force", { name = src, module = "blink.compat.source" }, opts.sources.providers[src] or {})
      if type(enabled) == "table" and not vim.tbl_contains(enabled, src) then
        table.insert(enabled, src)
      end
    end

    if not opts.keymap["<Tab>"] then
      if opts.keymap.preset == "super-tab" then
        opts.keymap["<Tab>"] = {
          require("blink.cmp.keymap.presets")["super-tab"]["<Tab>"][1],
          LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
          "fallback",
        }
      else
        opts.keymap["<Tab>"] = { LazyVim.cmp.map({ "snippet_forward", "ai_accept" }), "fallback" }
      end
    end

    opts.sources.compat = nil
    for _, provider in pairs(opts.sources.providers or {}) do
      if provider.kind then
        local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
        local kind_idx = #CompletionItemKind + 1
        CompletionItemKind[kind_idx] = provider.kind
        CompletionItemKind[provider.kind] = kind_idx

        local transform_items = provider.transform_items
        provider.transform_items = function(ctx, items)
          items = transform_items and transform_items(ctx, items) or items
          for _, item in ipairs(items) do
            item.kind = kind_idx or item.kind
            item.kind_icon = LazyVim.config.icons.kinds[item.kind_name] or item.kind_icon
          end
          return items
        end

        provider.kind = nil
      end
    end

    require("blink.cmp").setup(opts)
  end,
}

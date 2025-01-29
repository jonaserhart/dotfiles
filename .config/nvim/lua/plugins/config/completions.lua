return {
  "saghen/blink.cmp",
  dependencies = { 'rafamadriz/friendly-snippets', { 'L3MON4D3/LuaSnip', version = 'v2.*' } },
  -- use a release tag to download pre-built binaries
  version = '*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    keymap = { preset = 'super-tab' },

    signature = { enabled = true },
    completion = {
      ghost_text = {
        enabled = true,
      }
    },

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- Will be removed in a future release
      use_nvim_cmp_as_default = false,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    snippets = { preset = "luasnip" },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },
  opts_extend = { "sources.default" },
  config = function(_, opts)
    require("luasnip.loaders.from_vscode").lazy_load()
    require("blink.cmp").setup(opts)
  end
}
--   dependencies = {
--     "onsails/lspkind.nvim",
--     "L3MON4D3/LuaSnip",
--     "saadparwaiz1/cmp_luasnip",
--     "rafamadriz/friendly-snippets",
--   },
--   config = function()
--     local cmp = require("cmp")
--     require("luasnip.loaders.from_vscode").lazy_load()
--     cmp.setup({
--       snippet = {
--         expand = function(args)
--           require("luasnip").lsp_expand(args.body)
--         end,
--       },
--       window = {
--         completion = cmp.config.window.bordered({
--           winhighlight = 'Normal:Normal,FloatBorder:BorderBG,CursorLine:Visual,Search:None'
--         }),
--       },
--       experimental = {
--         ghost_text = true,
--       },
--       formatting = {
--         fields = { "kind", "abbr", "menu" },
--         format = function(entry, vim_item)
--           local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
--           local strings = vim.split(kind.kind, "%s", { trimempty = true })
--           kind.kind = " " .. (strings[1] or "") .. " "
--           kind.menu = "    (" .. (strings[2] or "") .. ")"
--
--           return kind
--         end,
--       },
--       mapping = cmp.mapping.preset.insert({
--         ["<C-e>"] = cmp.mapping.abort(),
--         ["<C-CR>"] = cmp.mapping.confirm({ select = true }),
--         ["<C-Space>"] = cmp.mapping.complete(),
--         ["<CR>"] = cmp.mapping.confirm({ select = false }),
--         ["<C-j>"] = cmp.mapping.select_next_item(),
--         ["<C-k>"] = cmp.mapping.select_prev_item(),
--         ["<Tab>"] = cmp.mapping(function(fallback)
--           local luasnip = require("luasnip")
--           if luasnip.jumpable(1) == 1 then
--             luasnip.jump(1)
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--         ["<S-Tab>"] = cmp.mapping(function()
--           local luasnip = require("luasnip")
--           luasnip.jump(-1)
--         end, { "i", "s" }),
--       }),
--       sources = {
--         { name = "nvim_lsp" },
--         { name = "luasnip" },
--         { name = "buffer" },
--         { name = 'orgmode' }
--       },
--     })
--
--     vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
--     vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
--     vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
--     vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })
--
--     vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#B5585F", bg = "NONE" })
--     vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#B5585F", bg = "NONE" })
--     vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#B5585F", bg = "NONE" })
--
--     vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#9FBD73", bg = "NONE" })
--     vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#9FBD73", bg = "NONE" })
--     vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#9FBD73", bg = "NONE" })
--
--     vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#D4BB6C", bg = "NONE" })
--     vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#D4BB6C", bg = "NONE" })
--     vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#D4BB6C", bg = "NONE" })
--
--     vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#A377BF", bg = "NONE" })
--     vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#A377BF", bg = "NONE" })
--     vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#A377BF", bg = "NONE" })
--     vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#A377BF", bg = "NONE" })
--     vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#A377BF", bg = "NONE" })
--
--     vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#7E8294", bg = "NONE" })
--     vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#7E8294", bg = "NONE" })
--
--     vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#D4A959", bg = "NONE" })
--     vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#D4A959", bg = "NONE" })
--     vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#D4A959", bg = "NONE" })
--
--     vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#6C8ED4", bg = "NONE" })
--     vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#6C8ED4", bg = "NONE" })
--     vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#6C8ED4", bg = "NONE" })
--
--     vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#58B5A8", bg = "NONE" })
--     vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#58B5A8", bg = "NONE" })
--     vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#58B5A8", bg = "NONE" })
--
--     -- Set up custom snippets
--     require("config.utils").req_custom_module("snippets")
--   end,
-- }

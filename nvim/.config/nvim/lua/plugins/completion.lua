-- ============================================================================
-- Autocompletion with Blink.cmp
-- ============================================================================

return {
  'saghen/blink.cmp',
  version = '*',
  dependencies = {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = (function()
      if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
        return
      end
      return 'make install_jsregexp'
    end)(),
    dependencies = {
      {
        'rafamadriz/friendly-snippets',
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load()
        end,
      },
    },
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  opts = {
    keymap = {
      -- Presets:
      -- 'default' (recommended) - mappings similar to built-in completions
      --   <c-y> to accept ([y]es) - auto-imports and expands snippets
      -- 'super-tab' - tab to accept
      -- 'enter' - enter to accept
      -- 'none' - no mappings
      --
      -- See `:help ins-completion` for understanding the default preset
      --
      -- Common mappings (all presets):
      -- <tab>/<s-tab>: move right/left in snippet expansion
      -- <c-space>: Open menu or docs if already open
      -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
      -- <c-e>: Hide menu
      -- <c-k>: Toggle signature help
      preset = 'default',
    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      nerd_font_variant = 'mono',
    },

    completion = {
      documentation = {
        auto_show = false,
        auto_show_delay_ms = 500,
      },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'lazydev' },
      providers = {
        lazydev = {
          module = 'lazydev.integrations.blink',
          score_offset = 100,
        },
      },
    },

    snippets = {
      preset = 'luasnip',
    },

    fuzzy = {
      implementation = 'lua',
    },

    signature = {
      enabled = true,
    },
  },
}

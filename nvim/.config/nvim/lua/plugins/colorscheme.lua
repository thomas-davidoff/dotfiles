-- ============================================================================
-- Colorscheme
-- ============================================================================
-- You can easily change to a different colorscheme.
-- To see what colorschemes are already installed, use `:Telescope colorscheme`.

return {
  'folke/tokyonight.nvim',
  priority = 1000, -- Load before all other start plugins
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('tokyonight').setup {
      styles = {
        comments = { italic = false }, -- Disable italics in comments
      },
    }

    -- Load the colorscheme
    -- Other variants: 'tokyonight-storm', 'tokyonight-moon', 'tokyonight-day'
    vim.cmd.colorscheme 'tokyonight-night'
  end,
}

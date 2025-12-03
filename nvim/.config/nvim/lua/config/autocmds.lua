-- ============================================================================
-- Autocommands
-- ============================================================================
-- See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
-- Try it with `yap` in normal mode
-- See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Open config file in a new tab
vim.api.nvim_create_user_command('Config', function()
  vim.cmd 'tabnew ~/.config/nvim/init.lua'
end, {})

-- Add more autocommands here as needed

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

-- Yank absolute current file path to clipboard
vim.keymap.set('n', '<leader>yp', function()
  vim.fn.setreg('+', vim.fn.expand '%:p')
  print('Yanked: ' .. vim.fn.expand '%:p')
end, { desc = 'Yank absolute path' })

-- Yank relative current file path to clipboard
vim.keymap.set('n', '<leader>yr', function()
  vim.fn.setreg('+', vim.fn.expand '%')
  print('Yanked: ' .. vim.fn.expand '%')
end, { desc = 'Yank relative path' })

-- Yank just filename
vim.keymap.set('n', '<leader>yf', function()
  vim.fn.setreg('+', vim.fn.expand '%:t')
  print('Yanked: ' .. vim.fn.expand '%:t')
end, { desc = 'Yank filename' })

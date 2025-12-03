-- ============================================================================
-- Vim Options and Settings
-- ============================================================================
-- See `:help vim.o` and `:help option-list`

-- Line Numbers
vim.o.number = true -- Show line numbers
vim.o.relativenumber = true -- Show relative line numbers

-- Mouse
-- vim.o.mouse = 'a'        -- Enable mouse mode (uncomment if desired)

-- UI
vim.o.showmode = false -- Don't show mode (already in status line)
vim.o.cursorline = true -- Highlight the current line
vim.o.scrolloff = 10 -- Minimum lines to keep above/below cursor
vim.o.signcolumn = 'yes' -- Always show sign column

-- Clipboard
-- Sync clipboard between OS and Neovim
-- Schedule the setting after `UiEnter` to avoid increasing startup time
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Indentation
vim.o.breakindent = true -- Enable break indent
vim.o.expandtab = true -- Enable expanding tabs to spaces
vim.o.shiftwidth = 4

-- Undo
vim.o.undofile = true -- Save undo history to file

-- Search
vim.o.ignorecase = true -- Case-insensitive searching...
vim.o.smartcase = true -- ...unless \C or capital in search
vim.o.inccommand = 'split' -- Preview substitutions live

-- Timing
vim.o.updatetime = 250 -- Decrease update time
vim.o.timeoutlen = 300 -- Decrease mapped sequence wait time

-- Splits
vim.o.splitright = true -- Vertical splits open to the right
vim.o.splitbelow = true -- Horizontal splits open below

-- Whitespace Characters
vim.o.list = true
vim.opt.listchars = {
  tab = '» ',
  trail = '·',
  nbsp = '␣',
}

-- Confirmation Dialog
vim.o.confirm = true -- Raise dialog instead of failing on unsaved changes

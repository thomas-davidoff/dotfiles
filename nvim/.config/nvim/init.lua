-- ============================================================================
-- Neovim Configuration Entry Point
-- ============================================================================
-- This file loads all configuration modules in the correct order.
--
-- Structure:
--   lua/config/options.lua    - Vim options and settings
--   lua/config/keymaps.lua    - Key mappings
--   lua/config/autocmds.lua   - Autocommands
--   lua/config/lazy.lua       - Plugin manager setup
--   lua/plugins/*.lua         - Individual plugin configurations

-- Set leader keys before anything else
-- Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Only if nerd font is actually installed
vim.g.have_nerd_font = true

-- Load configuration modules
require 'config.options' -- Load all vim options
require 'config.keymaps' -- Load all keymaps
require 'config.autocmds' -- Load autocommands
require 'config.lazy' -- Load plugin manager and plugins

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

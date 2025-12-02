# Neovim Configuration

This is a modular nvim config based on [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).
On first launch, lazy.nvim will automatically install all plugins.

## 📁 Directory Structure

```sh
nvim/
├── init.lua                      # Entry point - loads all modules
├── lua/
│   ├── config/                   # Core configuration
│   │   ├── options.lua          # Vim options (line numbers, indentation, etc.)
│   │   ├── keymaps.lua          # Key mappings
│   │   ├── autocmds.lua         # Autocommands
│   │   └── lazy.lua             # Plugin manager setup
│   ├── plugins/                  # Plugin configurations (one file per plugin/group)
│   │   ├── basics.lua           # Basic utility plugins
│   │   ├── which-key.lua        # Keybinding hints
│   │   ├── telescope.lua        # Fuzzy finder
│   │   ├── lsp.lua              # LSP configuration
│   │   ├── completion.lua       # Autocompletion
│   │   ├── autoformat.lua       # Auto-formatting
│   │   ├── colorscheme.lua      # Color scheme
│   │   ├── mini.lua             # Mini.nvim modules
│   │   ├── treesitter.lua       # Syntax highlighting
│   │   └── kickstart.lua        # Additional kickstart plugins
│   └── kickstart/                # Optional kickstart plugins
│       └── plugins/
│           ├── indent_line.lua
│           ├── autopairs.lua
│           ├── neo-tree.lua
│           ├── gitsigns.lua
│           ├── debug.lua
│           └── lint.lua
```

## Customizing

### Changing Options

Edit `lua/config/options.lua` to modify Vim settings:

```lua
vim.o.number = true              -- Show line numbers
vim.o.relativenumber = true      -- Show relative line numbers
vim.o.tabstop = 4                -- Set tab width
```

### Adding Keymaps

Edit `lua/config/keymaps.lua` to add new key mappings:

```lua
-- Example: Press <leader>w to save file
vim.keymap.set('n', '<leader>w', '<cmd>write<CR>', { desc = 'Save file' })
```

The leader key is set to `<Space>` in `init.lua`.

### Adding Autocommands

Edit `lua/config/autocmds.lua` to add new autocommands:

```lua
-- Example: Auto-format on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.lua',
  callback = function()
    vim.lsp.buf.format()
  end,
})
```

### Adding/Modifying Plugins

Each plugin (or group of related plugins) has its own file in `lua/plugins/`.

**To add a new plugin**, create a new file like `lua/plugins/myplugin.lua`:

```lua
return {
  'username/plugin-name',
  config = function()
    -- Plugin configuration here
  end,
}
```

**To modify an existing plugin**, edit its file in `lua/plugins/`.

**To disable a plugin**, either:

- Delete its file from `lua/plugins/`
- Comment out the entire return statement
- Move it to a different location

### Configuring LSP Servers

Edit `lua/plugins/lsp.lua` and add servers to the `servers` table:

```lua
local servers = {
  lua_ls = { ... },
  pyright = {},      -- Add Python support
  tsserver = {},     -- Add TypeScript support
  rust_analyzer = {}, -- Add Rust support
}
```

Run `:Mason` to see available LSP servers and tools.

### Changing the Colorscheme

Edit `lua/plugins/colorscheme.lua`:

```lua
-- Change the plugin
return {
  'catppuccin/nvim',  -- Different colorscheme plugin
  name = 'catppuccin',
  config = function()
    vim.cmd.colorscheme('catppuccin')
  end,
}
```

Or just change the variant in the existing config:

```lua
vim.cmd.colorscheme('tokyonight-storm')  -- Try storm, moon, or day
```

## Commands

### Plugin Management (Lazy.nvim)

- `:Lazy` - Open plugin manager
- `:Lazy update` - Update all plugins
- `:Lazy sync` - Install missing and update existing plugins
- `:Lazy clean` - Remove unused plugins

### LSP

- `:LspInfo` - Show LSP client info
- `:Mason` - Open Mason (LSP installer)
- `gd` - Go to definition
- `gr` - Show references
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol

### Telescope (Fuzzy Finder)

- `<leader>sf` - Search files
- `<leader>sg` - Search by grep
- `<leader>sh` - Search help
- `<leader><leader>` - Search buffers

### File Explorer (Neo-tree)

- `<leader>e` - Toggle file explorer
- (inside neo-tree) `?` - Show help

## 🆘 Getting Help

- `:help` - Neovim help system
- `:help lua-guide` - Lua guide for Neovim
- `:help vim.keymap.set` - Help for keymaps
- `:help vim.o` - Help for options
- `:Telescope help_tags` - Search all help tags

## Resources

- [Neovim Lua Guide](https://neovim.io/doc/user/lua-guide.html)
- [lazy.nvim Documentation](https://github.com/folke/lazy.nvim)
- [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
- `:Tutor` - Neovim's built-in tutorial

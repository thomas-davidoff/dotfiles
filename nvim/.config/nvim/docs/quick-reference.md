# Quick Reference Card

## 📁 File Structure

```sh
nvim/
├── init.lua                 ← Start here (entry point)
├── lua/
│   ├── config/
│   │   ├── options.lua     ← Vim settings
│   │   ├── keymaps.lua     ← Key bindings
│   │   ├── autocmds.lua    ← Autocommands
│   │   └── lazy.lua        ← Plugin manager
│   └── plugins/
│       ├── *.lua           ← Individual plugins
│       └── kickstart/      ← Optional plugins
├── README.md               ← Full documentation
├── MIGRATION_GUIDE.md      ← Before/after comparison
└── LUA_CHEATSHEET.md       ← Lua syntax guide
```

## ✏️ Common Tasks

### Change a Setting

1. Open `lua/config/options.lua`
2. Find or add the option (e.g., `vim.o.number = true`)
3. Save and restart Neovim

### Add a Keymap

1. Open `lua/config/keymaps.lua`
2. Add: `vim.keymap.set('n', '<leader>x', '<cmd>command<CR>', { desc = 'Description' })`
3. Save and restart Neovim

### Add a Plugin

1. Create `lua/plugins/myplugin.lua`
2. Add:
   ```lua
   return {
     'author/plugin-name',
     config = function()
       require('plugin-name').setup({})
     end,
   }
   ```
3. Save and restart Neovim
4. Run `:Lazy sync`

### Remove a Plugin

1. Delete the file from `lua/plugins/`
2. Restart Neovim
3. Run `:Lazy clean`

### Change Colorscheme

1. Edit `lua/plugins/colorscheme.lua`
2. Change the plugin or the variant
3. Save and restart Neovim

## 🎮 Useful Commands

| Command | Description |
|---------|-------------|
| `:Lazy` | Open plugin manager |
| `:Lazy sync` | Install/update all plugins |
| `:Mason` | Open LSP/tool installer |
| `:LspInfo` | Show LSP status |
| `:checkhealth` | Check Neovim health |
| `:help lua-guide` | Neovim Lua help |

## ⌨️ Key Mappings

### File Navigation (Telescope)

- `<leader>sf` - Search files
- `<leader>sg` - Search by grep
- `<leader>sh` - Search help
- `<leader><leader>` - Search buffers

### LSP

- `gd` - Go to definition
- `gr` - Show references
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol

### Window Navigation

- `<C-h/j/k/l>` - Move between windows

### File Explorer

- `<leader>e` - Toggle Neo-tree

## Troubleshooting

**Plugins not loading?**

- Run `:Lazy sync`
- Restart Neovim

**LSP not working?**

- Run `:Mason` and install language servers
- Run `:LspInfo` to check status

**Keymaps not working?**

- Check for conflicts in `lua/config/keymaps.lua`
- Run `:Telescope keymaps` to see all keymaps

**Syntax errors?**

- Check for missing `end` keywords
- Lua is very particular about syntax!


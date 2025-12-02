# Directory Structure

```sh
nvim/
│
├── init.lua                          # Entry point - loads all modules
│
├── lua/                              # All Lua code goes here
│   │
│   ├── config/                       # Core configuration files
│   │   ├── options.lua              # Vim options (line numbers, tabs, etc.)
│   │   ├── keymaps.lua              # Key mappings
│   │   ├── autocmds.lua             # Autocommands (auto-actions)
│   │   └── lazy.lua                 # Plugin manager setup
│   │
│   ├── plugins/                      # Plugin configurations (one per file)
│   │   ├── basics.lua               # guess-indent, gitsigns, todo-comments
│   │   ├── which-key.lua            # Keybinding popup hints
│   │   ├── telescope.lua            # Fuzzy finder + keymaps
│   │   ├── lsp.lua                  # Language Server Protocol setup
│   │   ├── completion.lua           # Blink.cmp autocompletion
│   │   ├── autoformat.lua           # Conform.nvim formatting
│   │   ├── colorscheme.lua          # Tokyo Night theme
│   │   ├── mini.lua                 # Mini.nvim (statusline, surround, etc.)
│   │   ├── treesitter.lua           # Syntax highlighting
│   │   └── kickstart.lua            # Loads optional kickstart plugins
│   │
│   └── kickstart/                    # Optional plugins from Kickstart
│       ├── health.lua               # Health check
│       └── plugins/
│           ├── indent_line.lua      # Indent guides (enabled)
│           ├── autopairs.lua        # Auto-close brackets (enabled)
│           ├── neo-tree.lua         # File explorer (enabled)
│           ├── gitsigns.lua         # Git keymaps (enabled)
│           ├── debug.lua            # Debugging (disabled by default)
│           └── lint.lua             # Linting (disabled by default)
│
├── .stylua.toml                      # Stylua formatter config
├── lazy-lock.json                    # Plugin version lock file
│
└── Documentation/
    ├── README.md                     # Complete guide
    ├── MIGRATION_GUIDE.md            # Before/after comparison
    ├── LUA_CHEATSHEET.md             # Lua syntax for beginners
    └── QUICK_REFERENCE.md            # Quick reference card
```

## File Purposes

### Root Level

| File | Purpose |
| ------ | --------- |
| `init.lua` | Main entry point - sets leader keys and loads all modules |
| `.stylua.toml` | Configuration for Stylua Lua formatter |
| `lazy-lock.json` | Locks plugin versions (like package-lock.json) |

### lua/config/

| File | Purpose |
|------|---------|
| `options.lua` | All Vim settings and options |
| `keymaps.lua` | All keyboard shortcuts |
| `autocmds.lua` | Auto-commands (e.g., highlight on yank) |
| `lazy.lua` | Sets up lazy.nvim plugin manager |

### lua/plugins/

Each file is a plugin or group of related plugins.

| File | Plugin(s) | Purpose |
|------|-----------|---------|
| `basics.lua` | guess-indent, gitsigns, todo-comments | Basic utilities |
| `which-key.lua` | which-key.nvim | Shows pending keybindings |
| `telescope.lua` | telescope.nvim + extensions | Fuzzy finder |
| `lsp.lua` | nvim-lspconfig, mason | Language servers |
| `completion.lua` | blink.cmp, luasnip | Autocompletion |
| `autoformat.lua` | conform.nvim | Code formatting |
| `colorscheme.lua` | tokyonight.nvim | Color scheme |
| `mini.lua` | mini.nvim | Statusline, surround, textobjects |
| `treesitter.lua` | nvim-treesitter | Syntax highlighting |
| `kickstart.lua` | (loader) | Loads kickstart plugins |

There are a few more blarg.

## Code Flow

```sh
Start Neovim
    │
    ├─> Load init.lua
    │       │
    │       ├─> Set leader keys (Space)
    │       │
    │       ├─> require('config.options')    → Load lua/config/options.lua
    │       │
    │       ├─> require('config.keymaps')    → Load lua/config/keymaps.lua
    │       │
    │       ├─> require('config.autocmds')   → Load lua/config/autocmds.lua
    │       │
    │       └─> require('config.lazy')       → Load lua/config/lazy.lua
    │               │
    │               └─> lazy.setup({ import = 'plugins' })
    │                       │
    │                       ├─> Load lua/plugins/autoformat.lua
    │                       ├─> Load lua/plugins/autopairs.lua
    │                       ├─> Load lua/plugins/basics.lua
    │                       ├─> Load lua/plugins/colorscheme.lua
    │                       ├─> Load lua/plugins/completion.lua
    │                       ├─> Load lua/plugins/debug.lua
    │                       ├─> Load lua/plugins/gitsigns.lua
    │                       ├─> Load lua/plugins/indent_line.lua
    │                       ├─> Load lua/plugins/lint.lua
    │                       ├─> Load lua/plugins/lsp.lua
    │                       ├─> Load lua/plugins/mini.lua
    │                       ├─> Load lua/plugins/neo-tree.lua
    │                       ├─> Load lua/plugins/telescope.lua
    │                       ├─> Load lua/plugins/treesitter.lua
    │                       └─> Load lua/plugins/which-key.lua
    └─> Done
```

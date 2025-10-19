# Neovim Configuration

A modern, modular Neovim configuration with LSP support, advanced terminal management, and theme switching capabilities.

## Features

- **LSP Support**: Integrated language server protocol with Mason for easy server management
- **Auto-completion**: Powered by nvim-cmp with snippet support
- **File Explorer**: Neo-tree for intuitive file navigation
- **Fuzzy Finder**: Telescope for searching files, buffers, and more
- **Terminal Management**: Built-in terminal with multi-instance support
- **Theme Switching**: Dynamic theme management with dark/light mode toggle
- **VSCode Integration**: Compatible with VSCode Neovim extension

## Requirements

- Neovim >= 0.9.0
- Git
- A Nerd Font (for icons)
- ripgrep (for Telescope live grep)
- Linux with Wayland support (optional, for clipboard integration)

## Installation

1. Clone this repository to your Neovim config directory:
```bash
git clone https://github.com/delt4d/nvim-config.git ~/.config/nvim
```

2. Launch Neovim:
```bash
nvim
```

3. Lazy.nvim will automatically install all plugins on first launch.

## Key Bindings

### General

| Key | Mode | Description |
|-----|------|-------------|
| `Space` | Normal | Leader key |
| `\` | Normal | Local leader key |
| `<C-s>` | Normal/Insert | Save file |
| `<C-n>` | Normal | Toggle Neo-tree file explorer |

### Navigation

| Key | Mode | Description |
|-----|------|-------------|
| `<Home>` | Normal/Visual/Operator | Jump to first non-whitespace character |
| `<End>` | Normal/Visual/Operator | Jump to last non-whitespace character |
| `<Leader>o` | Normal | Insert blank line below (stay in normal mode) |
| `<Leader>O` | Normal | Insert blank line above (stay in normal mode) |
| `<Leader>n` | Normal | Go to next buffer |
| `<Leader>p` | Normal | Go to previous buffer |

### Terminal

| Key | Mode | Description |
|-----|------|-------------|
| `<C-j>` | Normal/Insert/Terminal | Toggle terminal |
| `<M-j>` | Normal/Insert/Terminal | Create new terminal |
| `<Esc>` | Terminal | Exit terminal mode |
| `<C-n>` | Terminal | Go to next terminal instance |
| `<C-p>` | Terminal | Go to previous terminal instance |
| `<C-o>` | Normal/Terminal | Jump to previous buffer |
| `<C-i>` | Normal/Terminal | Jump to next buffer |

### LSP

| Key | Mode | Description |
|-----|------|-------------|
| `<Leader>gh` | Normal | Show hover information |
| `<Leader>gd` | Normal | Go to definition |
| `<Leader>gr` | Normal | Show references |
| `<Leader>gi` | Normal | Go to implementation |
| `<Leader>rn` | Normal | Rename symbol |
| `<Leader>ca` | Normal | Code actions |
| `<Leader>=` | Normal | Format document |

### Diagnostics

| Key | Mode | Description |
|-----|------|-------------|
| `<Leader>do` | Normal | Show line diagnostics |
| `<Leader>dq` | Normal | Show all diagnostics in quickfix |
| `]d` | Normal | Next diagnostic |
| `[d` | Normal | Previous diagnostic |

### Telescope

| Key | Mode | Description |
|-----|------|-------------|
| `<Leader>ff` | Normal | Find files |
| `<Leader>fg` | Normal | Live grep |
| `<Leader>fb` | Normal | Browse buffers |
| `<Leader>fh` | Normal | Help tags |

### Completion (nvim-cmp)

| Key | Mode | Description |
|-----|------|-------------|
| `<C-Space>` | Insert | Trigger completion |
| `<CR>` | Insert | Confirm selection |
| `<Tab>` | Insert | Next item / expand snippet |
| `<S-Tab>` | Insert | Previous item / jump back in snippet |
| `<C-e>` | Insert | Abort completion |
| `<C-y>` | Insert | Confirm selection |
| `<C-b>` | Insert | Scroll docs up |
| `<C-f>` | Insert | Scroll docs down |

## Custom Commands

### Quit Commands

- `:Q` - Quit all windows (safe, stops if unsaved)
- `:QQ` - Force quit all windows (discard unsaved changes)
- `:WQ` - Save all buffers and quit

### Theme Commands

- `:Dark` - Switch to configured dark theme
- `:Light` - Switch to configured light theme
- `:SetDarkTheme` - Set which theme to use as dark theme
- `:SetLightTheme` - Set which theme to use as light theme
- `:ToggleTheme` - Toggle between dark and light themes

## Configuration Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lua/
│   ├── config/             # Core configuration
│   │   ├── init.lua        # Config loader
│   │   ├── options.lua     # Vim options
│   │   ├── globals.lua     # Global variables
│   │   ├── diagnostic.lua  # Diagnostic configuration
│   │   ├── lazy.lua        # Plugin manager setup
│   │   └── vscode.lua      # VSCode integration
│   ├── plugins/            # Plugin configurations
│   │   ├── cmp.lua         # Auto-completion
│   │   ├── lsp.lua         # LSP setup
│   │   ├── neotree.lua     # File explorer
│   │   ├── telescope.lua   # Fuzzy finder
│   │   ├── keys.lua        # Screenkey display
│   │   └── sleuth.lua      # Auto-detect indentation
│   ├── custom/             # Custom functionality
│   │   ├── clipboard.lua   # Clipboard integration
│   │   ├── editing.lua     # Editing enhancements
│   │   ├── lsp.lua         # LSP keybindings
│   │   ├── navigation.lua  # Navigation helpers
│   │   ├── quit.lua        # Quit commands
│   │   ├── terminal.lua    # Terminal keybindings
│   │   └── theme.lua       # Theme initialization
│   └── shared/             # Shared utilities
│       ├── buffers/        # Buffer utilities
│       ├── explorer/       # Explorer utilities
│       ├── terminal/       # Terminal management
│       └── theme/          # Theme management
└── lazy-lock.json          # Plugin version lock file
```

## LSP Servers

The following LSP servers are pre-configured:

- `lua_ls` - Lua Language Server
- `jsonls` - JSON Language Server
- `bashls` - Bash Language Server
- `lemminx` - XML Language Server

To install additional servers, use `:Mason` and browse available packages.

## Clipboard Support

- **Linux + Wayland**: Uses `wl-clipboard` (wl-copy/wl-paste)
- **Other systems**: Uses system clipboard directly

## Theme Persistence

Theme preferences are automatically saved to `~/.local/share/nvim/theme_config.json` and restored on startup.

## VSCode Integration

When running inside VSCode with the Neovim extension, the configuration automatically adapts to use VSCode commands and features.

## Plugins

This configuration uses the following plugins:

- [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
- [mason.nvim](https://github.com/williamboman/mason.nvim) - LSP/DAP/Linter installer
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP configuration
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Auto-completion
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet engine
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) - File explorer
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Auto-close pairs
- [vim-sleuth](https://github.com/tpope/vim-sleuth) - Auto-detect indentation
- [screenkey.nvim](https://github.com/NStefan002/screenkey.nvim) - Show pressed keys

## License

MIT License - See [LICENSE](LICENSE) file for details.

## Credits

Created by [delt4d](https://github.com/delt4d)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
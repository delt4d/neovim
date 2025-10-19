# Neovim Configuration

A modern, modular Neovim configuration with LSP support, advanced terminal management, and theme switching capabilities.

## Features

- **LSP Support**: Integrated language server protocol with Mason for easy server management
- **Auto-completion**: Powered by nvim-cmp with snippet support
- **File Explorer**: Neo-tree for intuitive file navigation
- **Fuzzy Finder**: Telescope for searching files, buffers, and more
- **Terminal Management**: Built-in terminal with multi-instance support
- **Theme Switching**: Dynamic theme management with dark/light mode toggle
- **Auto-pairs**: Automatic bracket and quote pairing
- **VSCode Integration**: Compatible with VSCode Neovim extension
- **Screenkey Display**: Visual display of pressed keys

## Requirements

- Neovim >= 0.9.0
- Git
- A Nerd Font (for icons)
- ripgrep (for Telescope live grep)
- Linux with Wayland support (optional, for clipboard integration with wl-clipboard)

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
| `<C-n>` | Normal | Toggle Neo-tree file explorer (floating) |
| `<C-w>` | Insert | Normal Ctrl+W behavior |

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
| `<Tab>` | Terminal | Normal Tab behavior in terminal |

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
│   │   ├── clipboard.lua   # Clipboard configuration
│   │   └── lazy.lua        # Plugin manager setup
│   ├── plugins/            # Plugin configurations
│   │   ├── cmp.lua         # Auto-completion
│   │   ├── lsp.lua         # LSP setup
│   │   ├── neotree.lua     # File explorer
│   │   ├── telescope.lua   # Fuzzy finder
│   │   ├── keys.lua        # Screenkey display
│   │   └── sleuth.lua      # Auto-detect indentation
│   ├── custom/             # Custom functionality
│   │   ├── editing.lua     # Editing enhancements
│   │   ├── init.lua        # Custom module loader
│   │   ├── lsp.lua         # LSP keybindings
│   │   ├── navigation.lua  # Navigation helpers
│   │   ├── quit.lua        # Quit commands
│   │   ├── terminal.lua    # Terminal keybindings
│   │   ├── theme.lua       # Theme initialization
│   │   └── vscode.lua      # VSCode integration
│   └── shared/             # Shared utilities
│       ├── buffers/        # Buffer utilities
│       │   └── init.lua
│       ├── explorer/       # Explorer utilities
│       │   └── init.lua
│       ├── terminal/       # Terminal management
│       │   ├── init.lua
│       │   └── utils.lua
│       └── theme/          # Theme management
│           ├── init.lua
│           ├── picker.lua
│           └── utils.lua
└── lazy-lock.json          # Plugin version lock file
```

## LSP Servers

The following LSP servers are pre-configured:

- `lua_ls` - Lua Language Server
- `jsonls` - JSON Language Server (with SchemaStore integration)
- `bashls` - Bash Language Server
- `lemminx` - XML Language Server

To install additional servers, use `:Mason` and browse available packages.

## Clipboard Support

- **Linux + Wayland**: Uses `wl-clipboard` (wl-copy/wl-paste)
- **Other Linux systems**: Uses standard `unnamedplus` clipboard
- **Other systems**: Uses system clipboard directly

## Theme Persistence

Theme preferences are automatically saved to `~/.local/share/nvim/theme_config.json` and restored on startup. The theme picker allows you to preview themes before selecting them using Telescope.

## VSCode Integration

When running inside VSCode with the Neovim extension, the configuration automatically adapts to use VSCode commands and features. Additional VSCode-specific keybindings include:

- `F2` - Refactor
- `<C-/>` - Toggle comment
- `<C-h>` - Navigate left split
- `<C-l>` - Navigate right split
- `<Leader>q` - Close editor
- `gp` - Peek definition
- `<Leader>gg` - Open source control
- `<Leader>gd` - Open git changes

## Plugins

This configuration uses the following plugins:

- [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
- [mason.nvim](https://github.com/williamboman/mason.nvim) - LSP/DAP/Linter installer
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Bridge between Mason and LSPConfig
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP configuration
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Auto-completion
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - LSP completion source
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - Buffer completion source
- [cmp-path](https://github.com/hrsh7th/cmp-path) - Path completion source
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline) - Command line completion source
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet engine
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) - Snippet completion source
- [lspkind.nvim](https://github.com/onsails/lspkind.nvim) - VS Code-like pictograms
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - Lua utility functions
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) - File explorer
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim) - UI component library
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - File icons
- [nvim-window-picker](https://github.com/s1n7ax/nvim-window-picker) - Window picker for Neo-tree
- [nvim-lsp-file-operations](https://github.com/antosha417/nvim-lsp-file-operations) - LSP file operations
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Auto-close pairs
- [vim-sleuth](https://github.com/tpope/vim-sleuth) - Auto-detect indentation
- [schemastore.nvim](https://github.com/b0o/schemastore.nvim) - JSON schemas
- [screenkey.nvim](https://github.com/NStefan002/screenkey.nvim) - Show pressed keys

## License

MIT License - See [LICENSE](LICENSE) file for details.
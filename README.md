# Neovim Configuration

A modern, feature-rich Neovim configuration with LSP support, file management, and dual-environment compatibility (VSCode and standalone).

## Features

- **LSP Integration**: Full Language Server Protocol support with Mason for automatic server management
- **File Management**: Neo-tree file explorer with floating windows
- **Terminal Integration**: Advanced terminal management with multiple terminal support
- **Advanced Theme System**: Interactive theme picker with live preview, dual-theme configuration, and automatic persistence
- **VSCode Compatibility**: Seamless integration when running inside VSCode
- **Auto-completion**: Intelligent completion with nvim-cmp and snippet support
- **Git Integration**: Built-in Git support with vim-fugitive
- **Fuzzy Finding**: Telescope integration for file and text searching
- **Syntax Highlighting**: Tree-sitter powered syntax highlighting
- **Cross-platform**: Linux/Wayland clipboard support

## Quick Start

1. **Prerequisites**:
   - Neovim 0.9+ 
   - Git
   - Node.js (for LSP servers)
   - ripgrep (for Telescope live grep)

2. **Installation**:
   ```bash
   # Backup existing config (if any)
   mv ~/.config/nvim ~/.config/nvim.backup
   
   # Clone this configuration
   git clone <your-repo-url> ~/.config/nvim
   
   # Start Neovim (plugins will auto-install)
   nvim
   ```

3. **First Launch**:
   - Lazy.nvim will automatically install all plugins
   - Mason will prompt to install LSP servers
   - Configure your themes with `:SetDarkTheme` and `:SetLightTheme` (see Theme System below)

## Key Bindings

### General Navigation
| Key | Mode | Action |
|-----|------|--------|
| `<Space>` | Normal | Leader key |
| `<C-s>` | Normal/Insert | Save file |
| `<Home>` | Normal/Visual/Operator | Jump to first non-whitespace character |
| `<End>` | Normal/Visual/Operator | Jump to last non-whitespace character |
| `<Leader>o` | Normal | Insert blank line below (stay in normal) |
| `<Leader>O` | Normal | Insert blank line above (stay in normal) |


### Document Scrolling
| Key | Mode | Action |
|-----|------|--------|
| `<C-d>` | Normal | Scroll down half a page |
| `<C-u>` | Normal | Scroll up half a page |
| `<C-f>` | Normal | Scroll down one full page (forward) |
| `<C-b>` | Normal | Scroll up one full page (backward) |
| `<C-e>` | Normal | Scroll down one line (cursor stays in place) |
| `<C-y>` | Normal | Scroll up one line (cursor stays in place) |
| `}` | Normal | Jump to next paragraph/block |
| `{` | Normal | Jump to previous paragraph/block |

### File Management (Neo-tree)
| Key | Mode | Action |
|-----|------|--------|
| `<C-n>` | Normal | Toggle Neo-tree filesystem (floating) |
| `<Leader>gb` | Normal | Toggle buffers view (floating) |
| `<Leader>gs` | Normal | Toggle git status view (floating) |

### Terminal Management
| Key | Mode | Action |
|-----|------|--------|
| `<C-j>` | Normal/Insert/Terminal | Toggle terminal |
| `<M-j>` | Normal/Insert/Terminal | Create new terminal |
| `<C-q>` | Insert/Terminal | Quit terminal |
| `<C-n>` | Terminal | Next terminal |
| `<C-p>` | Terminal | Previous terminal |

### Fuzzy Finding (Telescope)
| Key | Mode | Action |
|-----|------|--------|
| `<C-p>` | Normal | Find files |
| `<Leader>fg` | Normal | Live grep |

### LSP Features (Auto-configured when LSP attaches)
| Key | Mode | Action |
|-----|------|--------|
| `<Leader>h` | Normal | Show hover information |
| `<Leader>gd` | Normal | Go to definition |
| `<Leader>d` | Normal | Show line diagnostics |
| `<Leader>q` | Normal | Show all diagnostics in quickfix |
| `]d` | Normal | Next diagnostic |
| `[d` | Normal | Previous diagnostic |
| `gr` | Normal | Show references |
| `gi` | Normal | Go to implementation |
| `<Leader>rn` | Normal | Rename symbol |
| `<Leader>ca` | Normal | Code actions |
| `<Leader>f` | Normal | Format document |

### Git (Fugitive)
| Key | Mode | Action |
|-----|------|--------|
| `<Leader>gs` | Normal | Git status (from fugitive plugin) |

### Completion (nvim-cmp)
| Key | Mode | Action |
|-----|------|--------|
| `<C-Space>` | Insert | Trigger completion |
| `<Tab>` | Insert | Next completion item / expand snippet |
| `<S-Tab>` | Insert | Previous completion item |
| `<C-y>` | Insert | Confirm selection |
| `<C-e>` | Insert | Abort completion |
| `<CR>` | Insert | Confirm completion |

## Commands

### Theme Management

The configuration includes a sophisticated theme system that supports separate dark and light themes with persistence and live preview.

#### Basic Theme Commands
- `:Dark` - Switch to configured dark theme
- `:Light` - Switch to configured light theme  
- `:ToggleTheme` - Toggle between light and dark themes

#### Theme Configuration Commands
- `:SetDarkTheme [theme_name]` - Configure dark theme (opens picker if no theme specified)
- `:SetLightTheme [theme_name]` - Configure light theme (opens picker if no theme specified)

#### Interactive Theme Picker

When you run `:SetDarkTheme` or `:SetLightTheme` without arguments, an interactive Telescope-based theme picker opens with the following features:

**Picker Controls:**
- **Live Preview**: Themes are applied in real-time as you navigate
- **`<C-j>`/`<C-k>`**: Navigate up/down with live preview
- **`<Enter>`**: Select and apply the highlighted theme
- **`<Esc>`**: Cancel and restore previous theme
- **Type to filter**: Start typing to filter theme names

**Example Usage:**
```vim
" Open interactive dark theme picker
:SetDarkTheme

" Set specific theme directly  
:SetDarkTheme catppuccin-mocha

" Open interactive light theme picker
:SetLightTheme

" Set specific theme directly
:SetLightTheme catppuccin-latte

" Toggle between your configured themes
:ToggleTheme
```

### Session Management
- `:Q` - Quit all windows (safe, stops if unsaved)
- `:QQ` - Force quit all windows (discard changes)
- `:WQ` - Save all buffers and quit

## Theme System Deep Dive

### How It Works
1. **Dual Configuration**: Separate dark and light theme preferences
2. **Persistence**: Theme choices are saved to `~/.local/share/nvim/theme_config.json`
3. **Auto-restore**: Last used theme mode (dark/light) is restored on startup
4. **Live Preview**: Interactive picker shows themes in real-time

### Available Themes
The configuration includes several high-quality themes:
- **Catppuccin** - Modern, warm colorscheme with multiple variants
- **OneDarkPro** - Professional One Dark theme variations  
- **Gruvbox** - Retro groove colorscheme
- **Tokyo Night** - Clean, modern theme inspired by VS Code

### Theme Persistence Structure
```json
{
  "dark": "catppuccin-mocha",
  "light": "catppuccin-latte", 
  "last": "dark"
}
```

### Advanced Theme Usage

**Set up a complete theme workflow:**
```vim
" Configure your preferred themes
:SetDarkTheme catppuccin-mocha
:SetLightTheme catppuccin-latte

" Now you can quickly switch
:Dark      " Switch to catppuccin-mocha  
:Light     " Switch to catppuccin-latte
:ToggleTheme " Toggle between them
```

**Pro tip**: The theme picker remembers your last selection and will restore it when you restart Neovim.

## Supported Languages

The configuration includes LSP support for:
- **Lua** - lua_ls (with Neovim-specific settings)
- **JavaScript/TypeScript** - ts_ls
- **JSON** - jsonls

Additional syntax highlighting for:
- C/C#
- Bash
- Docker
- SQL
- YAML
- Markdown
- Python
- Java

## Plugin Overview

### Core Plugins
- **lazy.nvim** - Plugin manager
- **mason.nvim** - LSP server installer
- **nvim-lspconfig** - LSP configuration
- **nvim-cmp** - Completion engine
- **telescope.nvim** - Fuzzy finder (also powers theme picker)
- **neo-tree.nvim** - File explorer

### Enhancement Plugins
- **nvim-treesitter** - Syntax highlighting
- **lualine.nvim** - Status line
- **which-key.nvim** - Key binding hints
- **nvim-autopairs** - Auto-close brackets/quotes
- **vim-sleuth** - Auto-detect indentation
- **vim-fugitive** - Git integration

### Themes
- **catppuccin** - Modern colorscheme with multiple variants
- **onedarkpro.nvim** - One Dark theme variations
- **gruvbox** - Retro groove colorscheme  
- **tokyonight.nvim** - VS Code inspired theme

### VSCode Integration
- **vscode-multi-cursor.nvim** - Multi-cursor support in VSCode
- Custom VSCode keybindings and notifications

## Configuration Structure

```
lua/
├── config/           # Core configuration
│   ├── autocmds.lua  # Auto commands & LSP keymaps
│   ├── keymaps.lua   # Key mappings
│   ├── lazy.lua      # Plugin manager setup
│   ├── linux.lua     # Linux/Wayland specific settings
│   ├── options.lua   # Vim options and globals
│   ├── usercmds.lua  # Custom user commands
│   └── vscode.lua    # VSCode integration
├── plugins/          # Plugin configurations
└── shared/           # Utility modules
    ├── buffers.lua   # Buffer management utilities
    ├── globals.lua   # Global configuration
    ├── jobs.lua      # Job/process utilities
    ├── terminal.lua  # Terminal management
    └── theme.lua     # Advanced theme switching system
```

## Environment Detection

The configuration automatically detects and adapts to:
- **Linux systems** - Enables Linux-specific features
- **Wayland** - Configures clipboard for Wayland
- **VSCode** - Loads VSCode-specific integrations
- **Regular Neovim** - Full standalone functionality

## Customization

### Adding LSP Servers
Edit `lua/shared/globals.lua` and add servers to the `lsp_servers` table:

```lua
M.lsp_servers = { "lua_ls", "jsonls", "ts_ls", "your_server" }
```

### Custom Keybindings
Add to `lua/config/keymaps.lua`:

```lua
vim.keymap.set('n', '<your_key>', '<your_command>', { desc = "Description" })
```

### LSP Keybindings
LSP keybindings are automatically configured when an LSP server attaches to a buffer. These are defined in `lua/config/autocmds.lua` in the `LspAttach` autocommand.

### Adding Custom Themes
To add more themes, create entries in `lua/plugins/colorschemes.lua`:

```lua
{
    "author/theme-name",
    lazy = false,
    priority = 1000
}
```

Then they'll be available in the theme picker automatically.

## Terminal Integration

The advanced terminal system provides:
- **Multiple terminals** - Create and switch between terminals
- **Smart toggling** - Seamlessly switch between code and terminal
- **Auto-hide Neo-tree** - Automatically manages file explorer visibility
- **Cross-mode bindings** - Works in normal, insert, and terminal modes

## Troubleshooting

### LSP Issues
1. Check Mason installation: `:Mason`
2. Verify server installation: `:LspInfo`
3. Check logs: `:messages`

### Plugin Issues
1. Update plugins: `:Lazy sync`
2. Check plugin status: `:Lazy`
3. Clear cache: Remove `~/.local/share/nvim/`

### Theme Issues
1. List available themes: `:colorscheme <Tab>`
2. Check theme config: `cat ~/.local/share/nvim/theme_config.json`
3. Reset themes: Delete the config file and reconfigure with `:SetDarkTheme` and `:SetLightTheme`
4. Test theme picker: Run `:SetDarkTheme` without arguments

### Common Theme Solutions
- **Theme not applying**: Make sure the theme plugin is installed (check `:Lazy`)
- **Picker not working**: Ensure Telescope is loaded (dependency issue)
- **Settings not persisting**: Check write permissions for `~/.local/share/nvim/`

## License

This configuration is provided as-is under the MIT License. Individual plugins retain their respective licenses.

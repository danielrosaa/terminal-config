# Dotfiles

Personal development environment configuration managed with symlinks and install scripts. One command sets up Zsh, Tmux, Neovim, and NVM on a fresh machine.

## What's Included

| Tool | Description |
|------|-------------|
| **Zsh** | Shell with [Oh My Zsh](https://ohmyz.sh/), [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme, and [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) |
| **Tmux** | Terminal multiplexer with [TPM](https://github.com/tmux-plugins/tpm), session persistence, and vim-tmux navigation |
| **Neovim** | Editor powered by [lazy.nvim](https://github.com/folke/lazy.nvim) with LSP, autocompletion, Telescope, Treesitter, and 40+ plugins |
| **NVM** | Node Version Manager with automatic LTS installation |

## Structure

```
.dotfiles/
├── install.sh          # Root bootstrapper
├── zsh/
│   ├── install.sh      # Installs Oh My Zsh, Powerlevel10k, plugins
│   ├── .zshrc          # Shell configuration
│   └── .p10k.zsh       # Powerlevel10k theme config
├── tmux/
│   ├── install.sh      # Installs TPM and plugins
│   └── .tmux.conf      # Tmux configuration
├── nvim/
│   ├── init.lua         # Neovim entry point
│   ├── .vimrc           # Vim fallback config
│   └── lua/
│       ├── core/        # Options, keymaps, autocommands
│       └── plugins/     # Plugin configurations
├── nvm/
│   └── install.sh      # Installs NVM and Node LTS
└── utils/
    └── git-completion.bash
```

## Installation

```bash
git clone https://github.com/<user>/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

The install script is idempotent — safe to run multiple times. It will:

1. Set up Zsh with Oh My Zsh, Powerlevel10k, and plugins
2. Symlink Tmux config and install TPM plugins
3. Symlink Neovim config to `~/.config/nvim`

### Symlinks Created

| Source | Target |
|--------|--------|
| `zsh/.zshrc` | `~/.zshrc` |
| `zsh/.p10k.zsh` | `~/.p10k.zsh` |
| `tmux/.tmux.conf` | `~/.tmux.conf` |
| `nvim/` | `~/.config/nvim` |

## Highlights

### Zsh

- **Plugins**: git, nvm, zsh-autosuggestions, docker, docker-compose, python, ubuntu, tmux
- **Git aliases**: `gs`, `gpull`, `gpush`, `gc`, `gm`, `gdiff`, `glog` (with tab completion)
- Powerlevel10k prompt — run `p10k configure` to customize

### Tmux

- Prefix: `Ctrl+Space`
- Vim-style pane resizing (`hjkl`)
- Vi copy mode with system clipboard support
- Plugins: vim-tmux-navigator, resurrect, continuum, cpu-mem-monitor
- Nord color scheme

### Neovim

- **Plugin manager**: lazy.nvim
- **LSP servers** (via Mason): lua, python, typescript, bash, docker, yaml, json, sql, tailwindcss, html, css, terraform, and more
- **Formatting**: prettier, stylua, shfmt, ruff
- **Navigation**: Telescope fuzzy finder, Neo-tree file explorer
- **Git**: gitsigns, fugitive, rhubarb
- **Theme**: Nord with optional transparency (`<leader>bg`)
- **Leader key**: `Space`

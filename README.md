# Configuration Files

MacOS development tools:

* Terminal: Ghostty
* Editor: LazyVim

## Files

### `.zprofile`

Shell configuration file loaded for login shells. Contains:

* Homebrew environment initialization
* Kubernetes command aliases (`kc`, `kctx`, `kns`, etc.)
* Docker Compose aliases
* Editor aliases (vim/vi to nvim)
* Terraform alias
* Custom `w()` function for watching command output with a specified interval

### `VictorMono-VariableFont_wght.ttf`

Victor Mono variable font file used by Ghostty terminal. A monospaced font with cursive italics and programming ligatures.

### `.config/ghostty/config`

Ghostty terminal emulator configuration. Includes:

* Font family set to Victor Mono
* Custom keybindings for split navigation (`cmd+shift+hjkl`)
* Custom keybindings for split resizing (`cmd+ctrl+hjkl`)

### `.config/nvim/lua/config/keymaps.lua`

LazyVim custom keymaps configuration. Overrides:

* `;` mapped to `:` for easier command mode entry
* Window resizing with `ctrl+shift+hjkl` keys

### `.config/nvim/lua/plugins/copilot.lua`

GitHub Copilot plugin configuration for LazyVim. Configures:

* Copilot.lua integration with LSP support
* NES (Neural Editing System) enabled with custom keymaps
* Accept and go-to suggestion mapped to `<leader>cp`
* Dismiss suggestions with `Esc`

## MacOS configurations

* Rebind CAPS LOCK to ESC for Vim
* Install Rectangle for tiling window management

## Packages to install

* Ghostty
* Homebrew
* nvim
* LazyVim
* oh-my-zsh

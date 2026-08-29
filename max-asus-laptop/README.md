# Max ASUS laptop

Personal Omarchy configuration for the ASUS Zenbook 14 UM3406GA.

## Included

- `.config/hypr/` — Hyprland input, keybindings, gestures, display, idle, and appearance settings
- `.config/omarchy/` — shell, menu, background, hooks, and enabled/custom plugins
- `.config/inputactions/` — touchpad gesture actions
- `.config/ghostty/` — terminal configuration
- `.config/nvim/` — LazyVim configuration and plugins
- `.config/chrome-ui-font/` — Chrome-only GTK font settings
- `.local/bin/` — personal Omarchy and launcher helpers
- `.zshrc` and `.zprofile` — Linux-safe shell configuration imported from the shared configuration files
- `packages/` — captured package inventories and system metadata

## Package inventory

- `packages/pacman-all.txt` contains every installed package with its current version.
- `packages/pacman-explicit.txt` contains packages explicitly selected by the user and is the best starting point for a reinstall.
- `packages/pacman-foreign.txt` contains packages not supplied by the configured Arch repositories (for example, AUR or locally built packages).
- `packages/metadata.txt` records the capture time, Omarchy version, kernel, architecture, and package counts.

Backups, generated runtime data, embedded Git histories, and plugin documentation/test assets are intentionally omitted.

# dotfiles

macOS tiling window manager setup with AeroSpace + SketchyBar.
Tokyo Night theme.

## Overview

```
~/.config/
├── aerospace/
│   └── aerospace.toml              # AeroSpace config
├── borders/                        # JankyBorders config
├── bordersrc                       # JankyBorders rc
├── nvim/                           # Neovim (LazyVim) config
│   ├── lua/
│   └── init.lua
└── sketchybar/
    ├── sketchybarrc                # SketchyBar main config
    └── plugins/
        ├── aerospace.sh            # Workspace indicator (Tokyo Night themed)
        ├── clock.sh                # Clock widget
        └── volume.sh               # Volume widget
```

## Workspaces

| Key | Workspace | App | Icon |
|-----|-----------|-----|------|
| `alt-t` | T | Microsoft Teams | 󰊻 |
| `alt-i` | I | iTerm2 |  |
| `alt-c` | C | Chrome |  |
| `alt-b` | B | Brave | 🦁 |
| `alt-p` | P | PyCharm |  |
| `alt-y` | Y | YouTube |  |
| `alt-o` | O | Obsidian |  |
| `alt-1`~`5` | 1–5 | General | — |

Apps are auto-assigned to their workspace via `on-window-detected`.

## Workspace Indicator

`aerospace.sh` handles workspace rendering in SketchyBar. Each workspace is mapped to a Nerd Font icon, and the focused workspace is highlighted with the Tokyo Night accent color.

```
 Focused:   Tokyo Night Blue background (#7aa2f7) + dark icon (#15161e)
 Unfocused: No background + muted icon (#a9b1d6)
```

Focus detection uses the `$FOCUSED_WORKSPACE` environment variable passed from AeroSpace's `exec-on-workspace-change`, avoiding per-render `aerospace` command calls for better performance.

## Key Bindings

| Binding | Action |
|---------|--------|
| `alt-h/j/k/l` | Focus left/down/up/right |
| `alt-shift-h/j/k/l` | Move window |
| `alt-shift-{key}` | Move window to workspace (with focus follow) |
| `alt-tab` | Workspace back-and-forth |
| `alt-shift-d` | Move workspace to next monitor |
| `alt-shift-semicolon` | Enter service mode |
| `alt-minus/equal` | Resize ±50 |

## Color Palette (Tokyo Night)

| Role | Hex | Used in |
|------|-----|---------|
| Bar background | `#414868` | SketchyBar bar, item backgrounds |
| Active accent | `#7aa2f7` | Focused workspace, JankyBorders |
| Label text | `#c0caf5` | Default icon/label color |
| Active icon | `#15161e` | Icon on focused workspace |
| Inactive icon | `#a9b1d6` | Icon on unfocused workspace |

## Dependencies

```bash
brew install --cask nikitabobko/tap/aerospace
brew install --cask font-hack-nerd-font
brew install felixkratz/formulae/sketchybar
brew install switchaudio-osx
```

## Install

```bash
git clone https://github.com/<your-username>/dotfiles.git
cd dotfiles

# Symlink
ln -sf $(pwd)/aerospace/aerospace.toml ~/.config/aerospace/aerospace.toml
ln -sf $(pwd)/sketchybar ~/.config/sketchybar
ln -sf $(pwd)/borders ~/.config/borders
ln -sf $(pwd)/bordersrc ~/.config/bordersrc
ln -sf $(pwd)/nvim ~/.config/nvim

# Make plugins executable
chmod +x ~/.config/sketchybar/plugins/*.sh
```

## Notes

- `outer.top` gap is set per-monitor to avoid overlap with SketchyBar (45px for external, 5px for built-in).
- Nerd Font icons require Hack Nerd Font installed and configured in your terminal.
- `--focus-follows-window` is enabled on all `move-node-to-workspace` bindings to keep SketchyBar in sync.

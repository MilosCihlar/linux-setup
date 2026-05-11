# Linux Setup

Personal Linux environment based on i3, tmux, zsh, vim, and Alacritty.

## Install

```bash
./install.sh --desktop   # full setup: i3, alacritty, polybar, rofi, zsh, tmux, vim
./install.sh --robot     # headless: zsh, tmux, vim (no GUI)
```

After first tmux launch, press `prefix + I` to install plugins.

---

## i3

**Mod key = `Alt`**

| Key | Action |
|-----|--------|
| `Alt+Enter` | new terminal |
| `Alt+d` | launch app (rofi) |
| `Alt+Shift+q` | close window |
| `Alt+h/j/k/l` | move focus |
| `Alt+Shift+h/j/k/l` | move window |
| `Alt+1–0` | switch workspace |
| `Alt+Shift+1–0` | move window to workspace |
| `Alt+f` | fullscreen |
| `Alt+v` / `Alt+b` | split vertical / horizontal |
| `Alt+Shift+space` | toggle floating / tiling |
| `Alt+r` | resize mode (`h/j/k/l` to resize, `Esc` to exit) |
| `Alt+Shift+c` | reload config |
| `Alt+Shift+r` | restart i3 |

---

## Tmux

**Prefix = `Ctrl+a`**

| Key | Action |
|-----|--------|
| `Ctrl+t` | new window |
| `Ctrl+Alt+h/l` | switch window left/right |
| `prefix + 0` | split horizontal |
| `prefix + 9` | split vertical |
| `Ctrl+h/j/k/l` | switch pane |
| `prefix + r` | reload config |
| `kk` (alias) | kill session |
| `prefix + Ctrl+[` | copy mode (vi) — `v` select, `y` yank |
| `prefix + P` | paste |
| `prefix + I` | install plugins (TPM, first time only) |

**tmux-resurrect** (plugin):

| Key | Action |
|-----|--------|
| `prefix + Ctrl+s` | save session |
| `prefix + Ctrl+r` | restore session after reboot |

---

## Zsh aliases

| Alias | Command |
|-------|---------|
| `ra` | ranger (cd into last dir on exit) |
| `kk` | kill tmux session |
| `cb` | `colcon build` + source (ROS 2) |
| `rtl/rti/rte` | `ros2 topic list/info/echo` |
| `rnl/rni` | `ros2 node list/info` |
| `rsl/rsc` | `ros2 service list/call` |

---

## Changing settings

Everything lives in this repo and changes apply **instantly** via symlinks:

| What to change | File | Apply |
|---|---|---|
| Tmux colors, keybindings | `.tmux.conf` | `prefix+r` |
| i3 keybindings, borders | `config` | `Alt+Shift+r` |
| Terminal font, colors | `alacritty.toml` | live reload |
| Shell aliases, plugins | `.zshrc` | `exec zsh` |
| Polybar layout, colors | `polybar/config.ini` | re-run `launch.sh` |

Saving changes:
```bash
git add -A && git commit -m "description"
```

Fresh machine setup:
```bash
git clone <repo>
cd linux-setup
./install.sh --desktop
```

# utils

Miscellaneous scripts and configuration files used across the system.

## Files

### `91-havit-h2002yg.rules`
udev rule that automatically sets the PCM volume to 100% when the Havit
H2002YG headset dongle is connected. The dongle initializes with extremely low
volume by default, so this rule fires on every `add` event for that specific
USB device.

To install:
```bash
sudo cp 91-havit-h2002yg.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
```

See `havit-alsa-fix.md` for the full explanation.

---

### `disable-wakeup.sh`
Disables all ACPI wakeup sources listed as enabled in `/proc/acpi/wakeup`.
Useful to prevent the computer from waking up from sleep due to USB devices,
network adapters, or other peripherals.

To install as a systemd service so it runs on every boot:
```bash
sudo cp disable-wakeup.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/disable-wakeup.sh
```

---

### `reconnect_vpn.sh`
Reconnects NordVPN by disconnecting and immediately connecting again
(`nordvpn d && nordvpn c`). Handy as a quick alias or keybinding when the VPN
drops.

---

### `git-completion.bash`
Official Git completion script for bash/zsh. Enables tab completion for Git
commands, branch names, tags, remote names, and common flags.

To install:
```bash
cp git-completion.bash ~/.git-completion.bash
```

Then source it in your `~/.bashrc` or `~/.zshrc`:
```bash
source ~/.git-completion.bash
```

---

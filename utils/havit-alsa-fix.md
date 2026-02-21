# Fixing Low Volume on Havit D2002YG in Linux

## Problem

When connecting the Havit D2002YG headset's 2.4GHz dongle, ALSA initializes
the device with extremely low volume. The configuration saved with `alsactl
store` is not automatically restored when the dongle is reconnected.

## Solution

Create a udev rule that detects when the dongle is connected and automatically
adjusts the volume via `amixer`.

### Why udev?

udev is the Linux device manager. It monitors hardware events and allows
commands to be executed in response to them — such as plugging in a USB device.
It is the correct way to react to hotplug events in Linux.

---

## Step by step

### 1. Identify the dongle via lsusb

```bash
lsusb
```

Look for the line corresponding to the headset. For the Havit D2002YG:

```
Bus 003 Device 003: ID 3206:0881 H2002YG H2002YG
```

The relevant values are:
- `idVendor`: `3206`
- `idProduct`: `0881`

### 2. Identify the volume control for the device

With the dongle connected, find the sound card number:

```bash
aplay -l
```

Look for the entry with the headset name and note the number after `card`.

Then list the available controls for that card (replace `1` with the correct
number):

```bash
amixer -c 1 scontrols
```

For the Havit D2002YG, the audio volume control is `PCM`.

### 3. Create the udev rule

```bash
sudo tee /etc/udev/rules.d/91-havit-headset.rules << 'EOF'
ACTION=="add", SUBSYSTEM=="sound", KERNEL=="card*", ATTRS{idVendor}=="3206", ATTRS{idProduct}=="0881", RUN+="/usr/bin/amixer -c %n sset PCM 100%%"
EOF
```

Explanation of each part of the rule:

| Part | Meaning |
|---|---|
| `ACTION=="add"` | Fires only when the device is connected |
| `SUBSYSTEM=="sound"` | Filters events from the kernel's audio subsystem |
| `KERNEL=="card*"` | Matches the moment the sound card is registered |
| `ATTRS{idVendor}=="3206"` | Filters by the dongle's manufacturer |
| `ATTRS{idProduct}=="0881"` | Filters by the exact dongle model |
| `RUN+=...` | Command to execute when the rule matches |
| `%n` | udev variable dynamically replaced by the card number |
| `100%%` | `%%` becomes `%` after udev substitution, passing `100%` to amixer |

### 4. Reload the udev rules

```bash
sudo udevadm control --reload-rules
```

---

## Behavior after setup

- **Boot without dongle connected:** rule is ignored
- **Plugging the dongle in after boot:** rule fires and fixes the volume
- **Boot with dongle already connected:** Linux detects the device during boot,
  fires the `add` event, and the rule is applied normally

## Testing without reconnecting the dongle

```bash
sudo udevadm trigger --action=add --subsystem-match=sound
```

## Adjusting the volume

To use a value other than 100%, edit the rule file:

```bash
sudo nano /etc/udev/rules.d/91-havit-headset.rules
```

Replace `100%%` with the desired value (e.g. `80%%`) and reload the rules:

```bash
sudo udevadm control --reload-rules
```

---

## Why does the filename start with 91?

The number in the filename defines the execution order of udev rules. Files
with a lower number run first. System rules are generally numbered between 60
and 80, so using 91 ensures the rule runs after the system has finished
initializing the audio device, avoiding race conditions. It is a convention,
not a requirement.

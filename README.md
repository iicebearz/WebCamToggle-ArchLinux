# 🖥️ Webcam Toggle for Arch Linux (GNOME Wayland)

Toggle your webcam on/off with a single keyboard shortcut! Perfect for privacy protection during video calls, streaming, or when using platforms like OmeTV and Omegle.

## ✨ Features

- 🔒 **Privacy Control**: Instantly disable/enable your webcam hardware
- ⌨️ **Keyboard Shortcut**: Quick toggle via customizable keybind
- 🎯 **Virtual Camera Friendly**: Works seamlessly with OBS VirtualCam and similar tools
- 🛡️ **Secure**: Uses Polkit for safe privilege escalation
- 💬 **Desktop Notifications**: Get instant feedback when toggling

## 📋 Prerequisites

### Required Packages

Install the V4L2 loopback driver:

```bash
# Using paru
paru -S v4l2loopback-dkms

# OR using yay
yay -S v4l2loopback-dkms
```

### Verify Available Webcams

Check which webcams are currently detected:

```bash
v4l2-ctl --list-devices
```

## 🚀 Installation

### Step 1: Install the Toggle Script

Copy the script to your local bin directory:

```bash
cp toggle_webcam.sh ~/.local/bin/
chmod +x ~/.local/bin/toggle_webcam.sh
```

### Step 2: Configure Polkit Rules

Copy the Polkit rules file to allow password-less execution:

```bash
sudo cp 99-webcam-toggle.rules /etc/polkit-1/rules.d/
```

**Important**: Edit the username in `99-webcam-toggle.rules` :

```javascript
subject.user == "your_username"  // Replace '[username]' with your actual username
```

### Step 3: Restart Polkit Service

Apply the new Polkit rules:

```bash
sudo systemctl restart polkit
```

*Alternatively, log out and log back in.*

## ⚙️ Setup Keyboard Shortcut

### GNOME Settings

1. Open **Settings** → **Keyboard** → **View and Customize Shortcuts**
2. Click **+** to add a custom shortcut
3. Configure as follows:
   - **Name**: `Toggle Webcam`
   - **Command**: `~/.local/bin/toggle_webcam.sh`
   - **Shortcut**: Press your desired key combination (e.g., `Ctrl+Alt+W`)

## 🔧 How It Works

The script toggles the `uvcvideo` kernel module:

- **Disable**: Unloads the `uvcvideo` module (`rmmod uvcvideo`)
- **Enable**: Loads the `uvcvideo` module (`modprobe uvcvideo`)

Desktop notifications confirm each action.

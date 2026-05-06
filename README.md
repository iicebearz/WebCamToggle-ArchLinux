# 🖥️WebCamToggle-ArchLinux
Jadi disini aku membuat Shortcut Keybin untuk Archlinux GNOME Wayland
untuk kalian bingung saat bermain omeTV atau omeggle pasti ke bingungan dengan kamera yang kalian pakai tidak terdeteksi walaupun sudah menggunakan VirtualCam pada OBS atau sejenisnya walaupun kalaian sudah setting penggunaan kamera pada Broswer kalian tapi masih yang terbaca atau otomatis digunakan adalah webcam bawaan (laptop).

## Syarat
Hal pertama yang perlu kalian install adalah V4L2Loopback, kalian bisa install di Paru/yay dengan command
~/> paru -S v4l2loopback-dkms
atau
~/> yay -S v4l2loopback-dkms

## Test Webcam yang tersedia
kegunaan V4L2Loopback ini untuk pengencekan webcam aktif atau tidak, atau pengencekan lainnya, cara pengencekanya dengan command
~/> v4l2-ctl --list-devices

Contoh Outputnya:
❯ v4l2-ctl --list-devices
Iriun Webcam (platform:v4l2loopback-000):
	/dev/video0

ACER HD User Facing: ACER HD Us (usb-0000:00:14.0-6):
	/dev/video1
	/dev/video2
	/dev/media0

~
end.

## Cara Settings
nah dari sini aku akan memberikan Shell code dan bagaimana cara setupnya ke kalian agar bisa di jadikan Shortcut untuk mempermudah.
 1. toggle_webcam.sh
 pada Toggel webcam yang sudah aku berikan kalian bisa masukan ke directory ~/.local/bin/
 jangan lupa di berikan akses 777 atau Chmod +x pada Toggel Webcamnya
 
 2. 99-webcam-toggle.rules
 pada polkit ini kalian bisa masukan ke directory /etc/polkit-1/rules.d/
 setelah kalian masukan polkit wajib restar polkit atau login kembali user
 sudo systemctl restart polkita

lalu kalian bisa setting keybind shortcut nya di GUI setting GNOME yang ada di Settings kalian, lalu kalian path commandnya menggunakan toggle_webcam.sh yang ada di usr/local/bin kalian.

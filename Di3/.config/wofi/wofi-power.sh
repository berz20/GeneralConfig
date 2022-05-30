#!/bin/sh


Shutdown_command="systemctl poweroff"
Reboot_command="systemctl reboot"
Logout_command="i3-msg exit"
Hibernate_command="systemctl hibernate"
Lock_command="i3lock -i /home/berz/Pictures/Wallpaper/lock.png"
Back_command=""

# you can customise the rofi command all you want ...
rofi_command="rofi -theme /home/berz/.config/wofi/launcherSmoll.rasi"
options='Lock\nShutdown\nReboot\nLogout\nHibernate'

# ... because the essential options (-dmenu and -p) are added here
eval \$"$(echo "$options" | $rofi_command -dmenu -p "")_command"

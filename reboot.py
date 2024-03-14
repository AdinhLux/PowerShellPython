import os
import ctypes

# Rebooting launch
print("REBOOTING")
os.system("shutdown -t 60 -r -f")

# Popup
message = 'Your machine will reboot in 60 seconds'
title = 'Rebooting OS'
ctypes.windll.user32.MessageBoxW(0, message, title, 0)
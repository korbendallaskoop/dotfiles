## Function to list passwords on Firefox
## edited from Chris Dardis' https://github.com/autokey/autokey/wiki/Scripting#advanced-scripts
## 

## menu - edit
keyboard.send_keys("<ctrl>+t")
## time.sleep(0.5)
keyboard.send_keys("about:preferences#privacy")
time.sleep(0.7)
keyboard.send_keys("<enter>")
time.sleep(0.5)
keyboard.send_keys("<shift>+<alt>+l")
time.sleep(0.9)
keyboard.send_keys("<shift>+<alt>+l")
keyboard.send_keys("<enter>")

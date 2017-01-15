on run argv
  if argv as string is equal to "" then
    log "argv is empty"
    set UserScript to "id -un"
    set user_name to do shell script UserScript
    log user_name
  else
    log "argv is not empty"
    set user_name to argv
    log argv
  end if

  tell application "Cisco AnyConnect Secure Mobility Client" to activate
  tell application "System Events"
  tell process "Cisco AnyConnect Secure Mobility Client"
    if name of button 1 of window 1 is equal to "Disconnect" then
      click button "Disconnect" of window 1
      repeat 
        if name of button 1 of window 1 is equal to "Connect" then
          delay 1
          tell application "Cisco AnyConnect Secure Mobility Client" to quit
          exit repeat
        end if
        delay 1
      end repeat
    else
      click button "Connect" of window 1
      repeat
        if name of button 1 of window 1 is equal to "Cancel" then exit repeat
        delay 1
      end repeat
    set PWScript to "security find-generic-password -D \"802.1X Password\" -w -a " & user_name
      set passwd to do shell script PWScript
      keystroke passwd
      keystroke return
      delay 2
      keystroke return
    end if
  end tell
  end tell
end run
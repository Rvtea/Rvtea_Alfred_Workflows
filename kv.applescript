set vpn_name to "USA_VPN"
set appname to "UserNotificationCenter"

tell application "System Events"
	set rc to do shell script "scutil --nc status " & vpn_name
	if rc starts with "Connected" then
		do shell script "scutil --nc stop " & vpn_name
	else
		set UserScript to "id -un"
		set user_name to do shell script UserScript
		set PWScript to "security find-generic-password -D \"802.1X Password\" -w -a " & user_name
		set passwd to do shell script PWScript
		do shell script "scutil --nc start " & vpn_name & " --user " & user_name
		repeat
			delay 1
			if process appname exists then
				delay 2
				if visible of process appname is false then exit repeat
			end if
		end repeat
		keystroke passwd
		keystroke return
		delay 2
		keystroke return
	end if
end tell
# Overview
This repo is used to share the workflows that I created and used in my daily work & life.

## kv.alfredworkflow
> use: kv USA_VPN
> USA_VPN stands for the VPN name that you config in your settings.

This workflow is used to connect VPN in macOS without input password again and again and just need to modify the
workflow with your personal accuont name, password should be autocompleted by keychain in macOS as long as you have let
it remember your account password.

## Cisco Anyconnect toggle tool 
> use: vo your_account_name
> use: vo 
> Note: you may need to config the workflow script to set the user_name as your own account belongs to.
This is also a VPN related workflow that I used to toggle vpn when using alfred without needed to input password. I do
not add async process to avoid the case the connect to server for too long while I think delay 5 is fairly enough for
most cases. You just need to config the script with your own account name then you can just input the "vo" command in
Alfred for using.

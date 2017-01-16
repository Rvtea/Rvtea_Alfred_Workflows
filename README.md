# Overview
This repo is used to share the workflows that I created and used in my daily work & life.

## BYR BBS Top 10 posts

> use: bbs

> use: bbs boardName

Easy to use, just see the gif below.

![](https://raw.githubusercontent.com/Rvtea/Rvtea_Alfred_Workflows/master/assets/bbstop10.gif)

## kv.alfredworkflow
> use: kv VPN_name

This alfred workflow do not store/send your password, but just using the password that you store in the macOS Keychains, so if you do not store the LDAP account info in Keychains, this workflow will be useless for you.

This workflow is used to connect VPN in macOS without input password again and again and just need to modify the workflow with your personal accuont name, password should be autocompleted by keychain in macOS as long as you have let it remember your account password.

## Cisco Anyconnect toggle tool 
> use: vo your_account_name

> use: vo 

> [Note]: you may need to config the workflow script to set the user_name as your own account belongs to use the second way for more quicker toggle experience.

This is also a VPN related workflow that I used to toggle VPN when using alfred without needed to input password. You just need to config the script with your own account name then you can just input the "vo" command in Alfred for using.

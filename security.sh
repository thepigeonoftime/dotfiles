#!/bin/sh
 
# Alot of these configs have been taken from the various places
# on the web, most from here
# https://github.com/mathiasbynens/dotfiles/blob/master/.osx
 
# Set the colours you can use
black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
 
# Resets the style
reset=`tput sgr0`
 
# Color-echo. Improved. [Thanks @joaocunha]
# arg $1 = message
# arg $2 = Color
cecho() {
  echo "${2}${1}${reset}"
  return
}

# Set continue to false by default
CONTINUE=false
 
echo ""
cecho "###############################################" $red
cecho "#        DO NOT RUN THIS SCRIPT BLINDLY       #" $red
cecho "#         YOU'LL PROBABLY REGRET IT...        #" $red
cecho "#                                             #" $red
cecho "#              READ IT THOROUGHLY             #" $red
cecho "#         AND EDIT TO SUIT YOUR NEEDS         #" $red
cecho "###############################################" $red
echo ""
 
 
echo ""
cecho "Have you read through the script you're about to run and " $red
cecho "understood that it will make changes to your computer? (y/n)" $red
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  CONTINUE=true
fi
 
if ! $CONTINUE; then
  # Check if we're continuing and output a message if not
  cecho "Please go read the script, it only takes a few minutes" $red
  exit
fi
 
# Here we go.. ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Set computer name (as done via System Preferences → Sharing)
#sudo scutil --set ComputerName "0x6D746873"
#sudo scutil --set HostName "0x6D746873"
#sudo scutil --set LocalHostName "0x6D746873"
#sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "0x6D746873"

# Set standby delay to 24 hours (default is 1 hour)
#pmset -a standbydelay 86400

# Disable the sound effects on boot
nvram SystemAudioVolume=" "


###############################################################################
# Security			                                                          #
###############################################################################

echo ""
cecho "Disable unnecessary LaunchAgents/Daemons for security / performance (!! high chance of breaking stuff !!)  ?" $red
cecho "(y/n)" $red
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then


	# unload LaunchAgents
	
	#launchctl unload -w /System/Library/LaunchAgents/com.apple.imklaunchagent.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.AirPlayUIAgent.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.AirPortBaseStationAgent.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.AOSPushRelay.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.appstoreupdateagent.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.bluetoothUIServer.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.bookstoreagent.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.familycontrols.useragent.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.icbaccountsd.plist	
	launchctl unload -w /System/Library/LaunchAgents/com.apple.icloud.AOSNotificationAgent.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.icloud.AOSNotificationLoginAgent.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.IMLoggingAgent.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.IMLoggingAgent.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.java.InstallOnDemand.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.java.updateSharing.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.ManagedClient.agent.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.ManagedClient.enrollagent.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.Maps.pushdaemon.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.maspushagent.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.RemoteDesktop.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.safaridavclient.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.SafariNotificationAgent.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.SafariNotificationAgent.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.scopedbookmarkagent.xpc.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.screensharing.agent.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.screensharing.MessagesAgent.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.soagent.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.SocialPushAgent.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.softwareupdate_notify_agent.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.SSInvitationAgent.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.store_helper.plist
	launchctl unload -w /System/Library/LaunchAgents/com.apple.SubmitDiagInfo.plist
	
	
	#unload LaunchDaemons
	
	launchctl unload -w /System/Library/LaunchDaemons/com.apple.AirPlayXPCHelper.plist
	launchctl unload -w /System/Library/LaunchDaemons/com.apple.blued.plist
	launchctl unload -w /System/Library/LaunchDaemons/com.apple.iCloudStats.plist
	launchctl unload -w /System/Library/LaunchDaemons/com.apple.InternetSharing.plist
	launchctl unload -w /System/Library/LaunchDaemons/com.apple.laterscheduler.plist
	launchctl unload -w /System/Library/LaunchDaemons/com.apple.locate.plist
	launchctl unload -w /System/Library/LaunchDaemons/com.apple.locationd.plist
	launchctl unload -w /System/Library/LaunchDaemons/com.apple.ManagedClient.cloudconfigurationd.plist
	launchctl unload -w /System/Library/LaunchDaemons/com.apple.ManagedClient.enroll.plist
	launchctl unload -w /System/Library/LaunchDaemons/com.apple.ManagedClient.plist
	launchctl unload -w /System/Library/LaunchDaemons/com.apple.ManagedClient.startup.plist
	launchctl unload -w /System/Library/LaunchDaemons/com.apple.mbicloudsetupd.plist
	launchctl unload -w /System/Library/LaunchDaemons/com.apple.mdmclient.daemon.plist
	launchctl unload -w /System/Library/LaunchDaemons/com.apple.nis.ypbind.plist
	launchctl unload -w /System/Library/LaunchDaemons/com.apple.racoon.plist
	launchctl unload -w /System/Library/LaunchDaemons/com.apple.RemoteDesktop.PrivilegeProxy.plist
	launchctl unload -w /System/Library/LaunchDaemons/com.apple.remotepairtool.plist
	launchctl unload -w /System/Library/LaunchDaemons/com.apple.RFBEventHelper.plist
	launchctl unload -w /System/Library/LaunchDaemons/com.apple.softwareupdate_firstrun_tasks.plist
	launchctl unload -w /System/Library/LaunchDaemons/com.apple.softwareupdated.plist
	launchctl unload -w /System/Library/LaunchDaemons/com.apple.SubmitDiagInfo.Root.plist
	launchctl unload -w /System/Library/LaunchDaemons/com.apple.UserNotificationCenter.plist
	launchctl unload -w /System/Library/LaunchDaemons/com.apple.webdavfs_load_kext.plist
	launchctl unload -w /System/Library/LaunchDaemons/org.postfix.master.plist
	
	
fi


echo ""
cecho "Do you also want to move the Daemons|Agents into a separate 'disabled'-directory, for better overview? (e.g. /System/Library/LaunchAgentsDisabled)
echo "" " $red
cecho "(y/n)" $red
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then

	# create directories for hard-disabled agents/daemons
	mkdir /System/Library/LaunchAgentsDisabled
	mkdir /System/Library/LaunchDaemonsDisabled
	
	
	#mv /System/Library/LaunchAgents/com.apple.imklaunchagent.plist
	mv /System/Library/LaunchAgents/com.apple.AirPlayUIAgent.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.AirPortBaseStationAgent.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.AOSPushRelay.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.appstoreupdateagent.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.bluetoothUIServer.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.bookstoreagent.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.familycontrols.useragent.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.icbaccountsd.plist	 /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.icloud.AOSNotificationAgent.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.icloud.AOSNotificationLoginAgent.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.IMLoggingAgent.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.IMLoggingAgent.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.java.InstallOnDemand.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.java.updateSharing.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.ManagedClient.agent.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.ManagedClient.enrollagent.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.Maps.pushdaemon.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.maspushagent.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.notificationcenterui.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.RemoteDesktop.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.safaridavclient.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.SafariNotificationAgent.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.SafariNotificationAgent.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.scopedbookmarkagent.xpc.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.screensharing.agent.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.screensharing.MessagesAgent.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.soagent.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.SocialPushAgent.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.softwareupdate_notify_agent.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.SSInvitationAgent.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.store_helper.plist /System/Library/LaunchAgentsDisabled
	mv /System/Library/LaunchAgents/com.apple.SubmitDiagInfo.plist /System/Library/LaunchAgentsDisabled
	 
	
	
	mv /System/Library/LaunchDaemons/com.apple.AirPlayXPCHelper.plist /System/Library/LaunchDaemonsDisabled
	mv /System/Library/LaunchDaemons/com.apple.blued.plist /System/Library/LaunchDaemonsDisabled
	mv /System/Library/LaunchDaemons/com.apple.iCloudStats.plist /System/Library/LaunchDaemonsDisabled
	mv /System/Library/LaunchDaemons/com.apple.InternetSharing.plist /System/Library/LaunchDaemonsDisabled
	mv /System/Library/LaunchDaemons/com.apple.laterscheduler.plist /System/Library/LaunchDaemonsDisabled
	mv /System/Library/LaunchDaemons/com.apple.locate.plist /System/Library/LaunchDaemonsDisabled
	mv /System/Library/LaunchDaemons/com.apple.locationd.plist /System/Library/LaunchDaemonsDisabled
	mv /System/Library/LaunchDaemons/com.apple.ManagedClient.cloudconfigurationd.plist /System/Library/LaunchDaemonsDisabled
	mv /System/Library/LaunchDaemons/com.apple.ManagedClient.enroll.plist /System/Library/LaunchDaemonsDisabled
	mv /System/Library/LaunchDaemons/com.apple.ManagedClient.plist /System/Library/LaunchDaemonsDisabled
	mv /System/Library/LaunchDaemons/com.apple.ManagedClient.startup.plist /System/Library/LaunchDaemonsDisabled
	mv /System/Library/LaunchDaemons/com.apple.mbicloudsetupd.plist /System/Library/LaunchDaemonsDisabled
	mv /System/Library/LaunchDaemons/com.apple.mdmclient.daemon.plist /System/Library/LaunchDaemonsDisabled
	mv /System/Library/LaunchDaemons/com.apple.nis.ypbind.plist /System/Library/LaunchDaemonsDisabled
	mv /System/Library/LaunchDaemons/com.apple.racoon.plist /System/Library/LaunchDaemonsDisabled
	mv /System/Library/LaunchDaemons/com.apple.RemoteDesktop.PrivilegeProxy.plist /System/Library/LaunchDaemonsDisabled
	mv /System/Library/LaunchDaemons/com.apple.remotepairtool.plist /System/Library/LaunchDaemonsDisabled
	mv /System/Library/LaunchDaemons/com.apple.RFBEventHelper.plist /System/Library/LaunchDaemonsDisabled
	mv /System/Library/LaunchDaemons/com.apple.softwareupdate_firstrun_tasks.plist /System/Library/LaunchDaemonsDisabled
	mv /System/Library/LaunchDaemons/com.apple.softwareupdated.plist /System/Library/LaunchDaemonsDisabled
	mv /System/Library/LaunchDaemons/com.apple.SubmitDiagInfo.Root.plist /System/Library/LaunchDaemonsDisabled
	mv /System/Library/LaunchDaemons/com.apple.UserNotificationCenter.plist /System/Library/LaunchDaemonsDisabled
	mv /System/Library/LaunchDaemons/com.apple.webdavfs_load_kext.plist /System/Library/LaunchDaemonsDisabled
	mv /System/Library/LaunchDaemons/org.postfix.master.plist /System/Library/LaunchDaemonsDisabled
	

fi

echo ""
cecho "Disable Setuid and Setguid Binaries?" $red
cecho "(y/n)" $red
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then

	
	# disable Setuid and Setguid Binaries
	chmod ug-s /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/MacOS/ARDAgent
	chmod ug-s /System/Library/Printers/IOMs/LPRIOM.plugin/Contents/MacOS/LPRIOMHelper
	#/System/Library/PrivateFrameworks/Admin.framework/Versions/A/Resources/readconfig
	#/System/Library/PrivateFrameworks/Install.framework/Versions/A/Resources/runner
	
	chmod ug-s /sbin/mount_nfs
	
	chmod ug-s /usr/bin/at
	chmod ug-s /usr/bin/atq
	chmod ug-s /usr/bin/atrm
	chmod ug-s /usr/bin/batch
	chmod ug-s /usr/bin/chpass
	chmod ug-s /usr/bin/crontab
	chmod ug-s /usr/bin/ipcs
	chmod ug-s /usr/bin/newgrp
	chmod ug-s /usr/bin/procmail
	chmod ug-s /usr/bin/wall
	chmod ug-s /usr/bin/write
	chmod ug-s /bin/rcp
	chmod ug-s /usr/bin/rlogin
	chmod ug-s /usr/bin/rsh
	chmod ug-s /usr/lib/sa/sadc
	
	chmod ug-s /usr/sbin/postdrop
	chmod ug-s /usr/sbin/postqueue
	chmod ug-s /usr/sbin/scselect
	chmod ug-s /usr/sbin/traceroute
	chmod ug-s /usr/sbin/traceroute6
	
fi

echo ""
cecho "Apply miscellaneous Application modifications?" $red
cecho "(y/n)" $red
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then

	# disable Bonjour
	 defaults write /System/Library/LaunchDaemons/com.apple.mDNSResponder ProgramArguments -array-add "-NoMulticastAdvertisements"
	
	# disable SafeSleep/Hibernate
	# pmset hibernatemode 0
	 rm -rf /var/vm/sleepimage
	
	# disable AutoPowerOff
	 pmset -a autopoweroff 0
	
	# disable sudden motion sensor
	 sudo pmset -a sms 0
	
	# update sysctl settings
	cat sysctl.conf >> /etc/sysctl.conf
	
	# restart sysctl
	sysctl -w
	
	
	###############################################################################
	# Safari & WebKit                                                             #
	###############################################################################
	
	# Privacy: don’t send search queries to Apple
	defaults write com.apple.Safari UniversalSearchEnabled -bool false
	defaults write com.apple.Safari SuppressSearchSuggestions -bool true
	
	# Press Tab to highlight each item on a web page
	defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
	defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true
	
	# Show the full URL in the address bar (note: this still hides the scheme)
	defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
	
	# Set Safari’s home page to `about:blank` for faster loading
	defaults write com.apple.Safari HomePage -string "about:blank"
	
	# Prevent Safari from opening ‘safe’ files automatically after downloading
	defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
	
	# Allow hitting the Backspace key to go to the previous page in history
	defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true
	
	# Hide Safari’s bookmarks bar by default
	defaults write com.apple.Safari ShowFavoritesBar -bool false
	
	# Hide Safari’s sidebar in Top Sites
	defaults write com.apple.Safari ShowSidebarInTopSites -bool false
	
	# Disable Safari’s thumbnail cache for History and Top Sites
	defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2
	
	# Enable Safari’s debug menu
	defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
	
	# Make Safari’s search banners default to Contains instead of Starts With
	defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
	
	# Remove useless icons from Safari’s bookmarks bar
	defaults write com.apple.Safari ProxiesInBookmarksBar "()"
	
	# Enable the Develop menu and the Web Inspector in Safari
	defaults write com.apple.Safari IncludeDevelopMenu -bool true
	defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
	defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
	
	# Add a context menu item for showing the Web Inspector in web views
	defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
	
	
	
	
	
	###############################################################################
	# Activity Monitor                                                            #
	###############################################################################
	
	# Show the main window when launching Activity Monitor
	defaults write com.apple.ActivityMonitor OpenMainWindow -bool true
	
	# Visualize CPU usage in the Activity Monitor Dock icon
	defaults write com.apple.ActivityMonitor IconType -int 5
	
	# Show all processes in Activity Monitor
	defaults write com.apple.ActivityMonitor ShowCategory -int 0
	
	# Sort Activity Monitor results by CPU usage
	defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
	defaults write com.apple.ActivityMonitor SortDirection -int 0
	
	
	
	###############################################################################
	# Address Book, Dashboard, iCal, TextEdit, and Disk Utility                   #
	###############################################################################
	
	# Enable the debug menu in Address Book
	defaults write com.apple.addressbook ABShowDebugMenu -bool true
	
	# Enable Dashboard dev mode (allows keeping widgets on the desktop)
	defaults write com.apple.dashboard devmode -bool true
	
	# Enable the debug menu in iCal (pre-10.8)
	defaults write com.apple.iCal IncludeDebugMenu -bool true
	
	# Use plain text mode for new TextEdit documents
	defaults write com.apple.TextEdit RichText -int 0
	# Open and save files as UTF-8 in TextEdit
	defaults write com.apple.TextEdit PlainTextEncoding -int 4
	defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
	
	# Enable the debug menu in Disk Utility
	defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
	defaults write com.apple.DiskUtility advanced-image-options -bool true
	
	
	
	###############################################################################
	# Mac App Store                                                               #
	###############################################################################
	
	# Enable the WebKit Developer Tools in the Mac App Store
	defaults write com.apple.appstore WebKitDeveloperExtras -bool true
	
	# Enable Debug Menu in the Mac App Store
	defaults write com.apple.appstore ShowDebugMenu -bool true
	
	###############################################################################
	# Messages                                                                    #
	###############################################################################
	
	# Disable automatic emoji substitution (i.e. use plain text smileys)
	defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false
	
	# Disable smart quotes as it’s annoying for messages that contain code
	defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false
	
	# Disable continuous spell checking
	defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false
	
	
	###############################################################################
	# Google Chrome & Google Chrome Canary                                        #
	###############################################################################
	
	# Allow installing user scripts via GitHub Gist or Userscripts.org
	defaults write com.google.Chrome ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"
	defaults write com.google.Chrome.canary ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"
	
	# Disable the all too sensitive backswipe on trackpads
	defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
	defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false
	
	# Disable the all too sensitive backswipe on Magic Mouse
	defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
	defaults write com.google.Chrome.canary AppleEnableMouseSwipeNavigateWithScrolls -bool false
	
	# Use the system-native print preview dialog
	defaults write com.google.Chrome DisablePrintPreview -bool true
	defaults write com.google.Chrome.canary DisablePrintPreview -bool true
	
	# Expand the print dialog by default
	defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
	defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true
	
fi	
###############################################################################
# Kill affected applications                                                  #
###############################################################################

echo ""
cecho "Kill and restart affected Applications?" $red
cecho "(y/n)" $red
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	
	
	
	for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
		"Dock" "Finder" "Google Chrome" "Google Chrome Canary" "Mail" "Messages" \
		"Opera" "Safari" "SizeUp" "Spectacle" "SystemUIServer" "Terminal" \
		"Transmission" "Twitter" "iCal"; do
		killall "${app}" > /dev/null 2>&1
	done
fi

echo "Done. Note that some of these changes require a logout/restart to take effect."	
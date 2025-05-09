
setup-org-notify:
		cp ./files/orgmodenotify.plist ~/Library/LaunchAgents/com.user.orgmode-cron.plist
		launchctl load ~/Library/LaunchAgents/com.user.orgmode-cron.plist
		launchctl list | grep com.user.orgmode-cron
		echo "REMEMBER TO SET NVIMENV IN PLIST ENV"

		

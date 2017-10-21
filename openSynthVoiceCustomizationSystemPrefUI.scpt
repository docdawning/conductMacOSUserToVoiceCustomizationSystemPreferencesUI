# JTS 2017-10-21
# This attempts to open up the deeply-buried Voice Customization UI within System Preferences
# It works on macOS 10.13 and likely a few versions before this.
# This is a flimsy approach since it shouldn't likely work with systems running with non-English localizations
# This little diddy took me a long time to figure out since I don't really get how AppleScript works
#
# View this code on github: https://github.com/docdawning/conductMacOSUserToVoiceCustomizationSystemPreferencesUI

tell application "System Preferences"
    activate
    reveal anchor "TextToSpeech" of pane id "com.apple.preference.universalaccess"
end tell
tell application "System Events"
    tell application process "System Preferences"
        repeat while not (window 1 exists)
        end repeat
        tell window 1

##### Very helpful! Lists the objects within the current object, needed for figuring out where to go #####
#	    set allItems to entire contents 
#	    repeat with eachItem in allItems
#		log eachItem
#            end repeat
##########################################################################################################

	    # System needs time to get to "TextToSpeech" of pane id "com.apple.preference.universalaccess"
	    # "System Voice:" pop up button (a drop-down list) won't exit until the system arrives
	    repeat while not (pop up button "System Voice:" exists)
	    end repeat

	    set voiceSelectionPopUpButtonListKajigger to pop up button "System Voice:"

	    tell voiceSelectionPopUpButtonListKajigger
		click
		tell menu 1
			click menu item "Customize..."
		end tell
	    end tell

        end tell
    end tell
end tell

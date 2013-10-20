-- This applescript first fetches the name & artist of the song currently playing in iTunes,
-- uses these values to compose a tweet and then send it to Firefox (new tab)

tell application "iTunes"
	set trackName to (get name of current track)
	set trackArtist to (get artist of current track)
	
	set theTweet to "Now playing : ♫ " & trackName & " - " & trackArtist & " ♫ "
end tell

set theURL to "http://twitter.com/intent/tweet?text=" & theTweet

tell application "Firefox"
	activate
	tell application "System Events"
		keystroke "t" using command down
		keystroke "l" using command down
		delay 1
		open location theURL
	end tell
end tell

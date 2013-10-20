-- This applescript first fetches the name & artist of the song currently playing in iTunes,
-- uses these values to compose a tweet and then send it to Safari (new tab)

tell application "iTunes"
	set trackName to (get name of current track)
	set trackArtist to (get artist of current track)
	
	set theTweet to "Now playing : ♫ " & trackName & " - " & trackArtist & " ♫ "
end tell

set theURL to "http://twitter.com/intent/tweet?text=" & theTweet
tell application "Safari"
	activate
	try
		tell window 1 to set current tab to make new tab with properties {URL:theURL}
	on error
		open location theURL
	end try
end tell
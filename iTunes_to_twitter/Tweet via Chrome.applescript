-- This applescript first fetches the name & artist of the song currently playing in iTunes,
-- uses these values to compose a tweet and then send it to Chrome (new tab)

tell application "iTunes"
	set trackName to (get name of current track)
	set trackArtist to (get artist of current track)
	
	set theTweet to "#NowPlaying : ♫ " & trackName & " - " & trackArtist & " ♫ "
end tell

set theURL to "http://twitter.com/intent/tweet?text=" & theTweet

tell application "Google Chrome"
	tell window 1
		set newTab to make new tab with properties {URL:theURL}
	end tell
end tell
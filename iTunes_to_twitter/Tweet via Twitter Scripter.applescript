-- This applescript first fetches the name & artist of the song currently playing in iTunes,
-- uses these values to compose a tweet and then send it to Twitter Scripter 

tell application "iTunes"
	set trackName to (get name of current track)
	set trackArtist to (get artist of current track)
	
	set theTweet to "Now playing : ♫ " & trackName & " - " & trackArtist & " ♫ "
end tell

tell application "Twitter Scripter"
	tweet theTweet using account "your_twitter_useraccount"	
end tell

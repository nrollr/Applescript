-- AppleScript  ExtractDB.scpt
-- Define variables; BackupFolder corresponds to the UDID iPhone
on run
	-- Set up different directory definitions
	display dialog "Enter the UDID of your iPhone" default answer ""
	set BackUpFolder to text returned of result
	set dbName to "3d0d7e5fb2ce288813306e4d4636395e047a3d28"
	
	set DefaultFolder to ((path to home folder) as text) & "Library:Application Support:MobileSync:Backup"
	set BackupFile to DefaultFolder & ":" & BackUpFolder & ":" & dbName
	set TempFolder to ((path to home folder) as text) & "Temp"
	
	-- Copy the Messages database to your Home directory and rename
	tell application "Finder"
		copy file BackupFile to folder TempFolder
		
		set dbCopy to TempFolder & ":" & dbName
		set dbFile to "ExtractDB.sqlite"
		set name of file dbCopy to dbFile
		
	end tell
end run
-- Define variables
display dialog "Enter the UDID of your iPhone" default answer ""
set BackupFolder to text returned of result
property dbName : "3d0d7e5fb2ce288813306e4d4636395e047a3d28"
	
-- Directory and File name definitions	
set DefaultFolder to ((path to home folder) as text) & "Library:Application Support:MobileSync:Backup"
set BackupFile to DefaultFolder & ":" & BackupFolder & ":" & dbName
set TempFolder to ((path to home folder) as text) & "Temp"
	
-- Copy the database file and rename to MessagesDB.sqlite
tell application "Finder"
	copy file BackupFile to folder TempFolder	
	set dbCopy to TempFolder & ":" & dbName
	set dbFile to "MessagesDB.sqlite"
	set name of file dbCopy to dbFile
end tell

-- All individual scipts should be compiled to GetMessages.app (ref. GetMessages.scpt)

-- Snippet from AppleScript ExtractDB.scpt
-- Define variables; BackupFolder corresponds to the UDID 
display dialog "Enter the UDID of your iPhone" default answer ""
set BackUpFolder to text returned of result
property dbName : "3d0d7e5fb2ce288813306e4d4636395e047a3d28"

-- Set up different directory definitions
set DefaultFolder to ((path to home folder) as text) & "Library:Application Support:MobileSync:Backup"
set BackupFile to DefaultFolder & ":" & BackUpFolder & ":" & dbName
set TempFolder to ((path to home folder) as text) & "Temp"
	
-- Copy the Messages database to your Home directory and rename
tell application "Finder"
	copy file BackupFile to folder TempFolder
		
	set dbCopy to TempFolder & ":" & dbName
	set dbFile to "MessagesDB.sqlite"
	set name of file dbCopy to dbFile	
end tell

-- Snippet from AppleScript CreateDB.scpt
-- Place this script in the same directory as the MessagesDB file
tell application "Finder" to get folder of (path to me) as Unicode text
	set workingDir to POSIX path of result

-- Create a new database called MasterDB and add table structure
	set targetDB to space & workingDir & "MasterDB.sqlite" & space
	set start to "sqlite3" & targetDB & quote

-- Optimized for iOS6 (new SQLite table structure)
	set action to "BEGIN TRANSACTION; CREATE TABLE message (main_id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT, handle_id INTEGER DEFAULT 0, date INTEGER, is_from_me INTEGER DEFAULT 0); COMMIT;"
do shell script start & action & quote

-- Snippet from AppleScript  InsertData.scpt
-- Copy data from WorkingDB to targetDB
	set workingDB to space & workingDir & "MessagesDB.sqlite" & space
	set begin to "sqlite3" & workingDB & quote

	set targetDB to workingDir & "MasterDB.sqlite"
	set loadCmd to "ATTACH DATABASE '" & targetDB & "' AS target;"
	set copyData to "INSERT INTO target.message SELECT ROWID,text,handle_id,date,is_from_me FROM main.message ORDER BY date ASC;"
do shell script begin & loadCmd & copyData & quote

-- Cleanup rule
do shell script "cd " & workingDir & "; rm *.sqlite-*"














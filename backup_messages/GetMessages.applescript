-- GetMessages.applescript combines all individual scipts listed in the actions directory

-- From AppleScript ExtractDB
-- Step {1}: Define variables
display dialog "Enter the UDID of your iPhone" default answer ""
set BackupFolder to text returned of result
property dbName : "3d0d7e5fb2ce288813306e4d4636395e047a3d28"

-- Step {2}: Directory and File name definitions
set DefaultFolder to ((path to home folder) as text) & "Library:Application Support:MobileSync:Backup"
set BackupFile to DefaultFolder & ":" & BackupFolder & ":" & dbName
set TempFolder to ((path to home folder) as text) & "Temp"

-- Step {3}: Copy the Messages database to your Home directory and rename
tell application "Finder"
	copy file BackupFile to folder TempFolder
	set dbCopy to TempFolder & ":" & dbName
	set dbFile to "MessagesDB.sqlite"
	set name of file dbCopy to dbFile
end tell

-- From AppleScript CreateDB
-- Place this script in the same directory as the MessagesDB file
tell application "Finder" to get folder of (path to me) as Unicode text
	set workingDir to POSIX path of result

-- Step {4}: Create a new database called NewDB.sqlite and add table structure
	set targetDB to space & workingDir & "NewDB.sqlite" & space
	set start to "sqlite3" & targetDB & quote

-- Step {5}: Add table structure in NewDB.sqlite
	set messagesTbl to "BEGIN TRANSACTION; CREATE TABLE messages (identifier INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, handle_id INTEGER DEFAULT 0, service TEXT, date INTEGER, from_me INTEGER DEFAULT 0, text TEXT); COMMIT;"
do shell script start & messagesTbl & quote
	set handleTbl to "BEGIN TRANSACTION; CREATE TABLE contacts (handle INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, contact TEXT NOT NULL); COMMIT;"
do shell script start & handleTbl & quote

-- From AppleScript InsertData
-- Step{6}: Copy relevant fields from MessagesDB.sqlite to NewDB.sqlite
	set workingDB to space & workingDir & "MessagesDB.sqlite" & space
	set begin to "sqlite3" & workingDB & quote
	set targetDB to workingDir & "NewDB.sqlite"
	set loadCmd to "ATTACH DATABASE '" & targetDB & "' AS target;"
-- Copy contents of messages table
	set copyMessages to "INSERT INTO target.messages SELECT ROWID,handle_id,service,date,is_from_me,text FROM main.message ORDER BY date ASC;"
do shell script begin & loadCmd & copyMessages & quote
-- Copy contents of contacts table
set copyContacts to "INSERT INTO target.contacts SELECT ROWID,id FROM main.handle;"
do shell script begin & loadCmd & copyContacts & quote

-- Cleanup rule
do shell script "cd " & workingDir & "; rm *.sqlite-*"

-- From AppleScript ImportDB
-- Step{7}: Create a dump of NewDB.sqlite
do shell script "cd " & workingDir & "; sqlite3 NewDB.sqlite .dump > sqlite_dump.sql"

-- Step{8}: Convert SQLite to MySQL using ConvertDB.py
-- Make sure the Python script ConvertDB.py exists in /Users/{username}/Temp
do shell script "cd " & workingDir & "; cat sqlite_dump.sql | python ConvertDB.py > mysql_dump.sql"

-- Step{9}: Import mysql_dump.sql into MySQL
-- Make sure the "Messages" database exists and change -ppassword to your own
-- Depending on your MySQL configuration, check and change the path to mysql if necessary
do shell script "/usr/local/Cellar/mysql/5.6.27/bin/mysql -u root -ppassword Messages < " & workingDir & "mysql_dump.sql"

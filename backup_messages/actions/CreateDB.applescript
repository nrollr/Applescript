-- Save this script to /Users/{username}/Temp
tell application "Finder" to get folder of (path to me) as Unicode text
	set workingDir to POSIX path of result

-- Create a new database called NewDB.sqlite and add table structure
	set targetDB to space & workingDir & "NewDB.sqlite" & space
	set start to "sqlite3" & targetDB & quote

-- Add table structure in NewDB.sqlite
	set messagesTbl to "BEGIN TRANSACTION; CREATE TABLE messages (identifier INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, handle_id INTEGER DEFAULT 0, service TEXT, date INTEGER, from_me INTEGER DEFAULT 0, text TEXT); COMMIT;"
do shell script start & messagesTbl & quote
	set handleTbl to "BEGIN TRANSACTION; CREATE TABLE contacts (handle INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, contact TEXT NOT NULL); COMMIT;"
do shell script start & handleTbl & quote
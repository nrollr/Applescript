
-- Path to Places.sqlite file: ~/Library/Application Support/Firefox/Profiles/<profile_id>/ 
-- All steps mentioned beneath are compiled in GetBookmarks.app (ref. GetBookmarks.scpt)
-- Define variables; ProfileFolder corresponds to the <profile_id> 
property ProfileFolder : "<profile_id>" -- change/edit <profile_id> to your own 
property dbName : "places.sqlite"

on run
	-- Set up different directory definitions
	set DefaultFolder to ((path to home folder) as text) & "Library:Application Support:Firefox:Profiles"
	set BackupFile to DefaultFolder & ":" & ProfileFolder & ":" & dbName
	set TempFolder to ((path to home folder) as text) & "Temp"
	
	-- Copy the Messages database to your Home directory and rename
	tell application "Finder"
		copy file BackupFile to folder TempFolder
		
		set dbCopy to TempFolder & ":" & dbName
		set dbFile to "PlacesDB.sqlite"
		set name of file dbCopy to dbFile
	end tell
	
	-- Variable: sourceDB = PlacesDB.sqlite
	-- Variable: destinationDB = BookmarksDB.sqlite
	
	-- Place this script in the same directory as the PlacesDB.sqlite file
	tell application "Finder" to get folder of (path to me) as Unicode text
	set workingDir to POSIX path of result
	
	-- Create a new database called BookmarksDB.sqlite and add tables
	set destinationDB to space & workingDir & "BookmarksDB.sqlite" & space
	set start to "sqlite3" & destinationDB & quote
	set tableA to "CREATE TABLE _bookmarks (type INTEGER, fk INTEGER DEFAULT NULL, parent INTEGER, title LONGVARCHAR);"
	set tableB to "CREATE TABLE _places (id INTEGER PRIMARY KEY, url LONGVARCHAR);"
	do shell script start & tableA & tableB & quote
	
	-- Copy data from PlacesDB.sqlite to BookmarksDB.sqlite
	set sourceDB to space & workingDir & "PlacesDB.sqlite" & space
	set begin to "sqlite3" & sourceDB & quote
	set destinationDB to workingDir & "BookmarksDB.sqlite"
	
	set addDB to "ATTACH DATABASE '" & destinationDB & "' AS new;"
	set copyA to "INSERT INTO new._bookmarks SELECT type,fk,parent,title FROM moz_bookmarks;"
	set copyB to "INSERT INTO new._places SELECT id,url FROM moz_places;"
	set remDB to "DETACH new;"
	do shell script begin & addDB & copyA & copyB & remDB & quote
	
	-- Sanitize data in BookmarksDB.sqlite 
	set destinationDB to space & workingDir & "BookmarksDB.sqlite" & space
	set start to "sqlite3" & destinationDB & quote
	
	set join to "CREATE TABLE bookmarks AS SELECT * FROM _bookmarks LEFT OUTER JOIN _places ON _bookmarks.fk = _places.id;"
	set dropA to "DROP TABLE _bookmarks;"
	set dropB to "DROP TABLE _places;"
	set final to "CREATE TABLE data AS SELECT type,parent,title,url FROM bookmarks;"
	set dropC to "DROP TABLE bookmarks;"
	do shell script start & join & dropA & dropB & final & dropC & quote
	
	-- Cleanup rule
	do shell script "cd " & workingDir & "; rm *.sqlite-*"
	
end run
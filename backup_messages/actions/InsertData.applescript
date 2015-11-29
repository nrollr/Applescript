-- Save this script to /Users/{username}/Temp
tell application "Finder" to get folder of (path to me) as Unicode text
	set workingDir to POSIX path of result

-- Copy relevant fields from MessagesDB.sqlite to NewDB.sqlite
	set workingDB to space & workingDir & "MessagesDB.sqlite" & space
	set begin to "sqlite3" & workingDB & quote
	set targetDB to workingDir & "NewDB.sqlite"
	set loadCmd to "ATTACH DATABASE '" & targetDB & "' AS target;"

-- Copy contents to messages table
	set copyMessages to "INSERT INTO target.messages SELECT ROWID,handle_id,service,date,is_from_me,text FROM main.message ORDER BY date ASC;"
do shell script begin & loadCmd & copyMessages & quote

-- Copy contents to contacts table
set copyContacts to "INSERT INTO target.contacts SELECT ROWID,id FROM main.handle;"
do shell script begin & loadCmd & copyContacts & quote

-- Cleanup rule
do shell script "cd " & workingDir & "; rm *.sqlite-*"
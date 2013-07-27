-- AppleScript  InsertData.scpt
-- Copy data from WorkingDB to targetDB
tell application "Finder" to get folder of (path to me) as Unicode text
set workingDir to POSIX path of result

-- Load both DB files and copy data
set workingDB to space & workingDir & "MessagesDB.sqlite" & space
set begin to "sqlite3" & workingDB & quote

set targetDB to workingDir & "MasterDB.sqlite"
set loadCmd to "ATTACH DATABASE '" & targetDB & "' AS target;"
set copyData to "INSERT INTO target.message SELECT ROWID,text,handle_id,date,is_from_me FROM main.message ORDER BY date ASC;"

do shell script begin & loadCmd & copyData & quote

-- Cleanup rule
do shell script "cd " & workingDir & "; rm *.sqlite-*"
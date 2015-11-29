-- Save this script to /Users/{username}/Temp
tell application "Finder" to get folder of (path to me) as Unicode text
	set workingDir to POSIX path of result

-- Create a dump of NewDB.sqlite
do shell script "cd " & workingDir & "; sqlite3 NewDB.sqlite .dump > sqlite_dump.sql"

-- Make sure the Python script ConvertDB.py exists in /Users/{username}/Temp
-- Convert SQLite to MySQL using ConvertDB.py
do shell script "cd " & workingDir & "; cat sqlite_dump.sql | python ConvertDB.py > mysql_dump.sql"

-- Import mysql_dump.sql into MySQL
-- Make sure the "Messages" database exists and change -ppassword to your own
-- Depending on your MySQL configuration, check and change the path to mysql if necessary
do shell script "/usr/local/Cellar/mysql/5.6.27/bin/mysql -u root -ppassword Messages < " & workingDir & "mysql_dump.sql"
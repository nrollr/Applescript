##Extract your text messages from your iPhone backup

This script retrieves your text messages from your iPhone backup directory and copies the relevant content to a brand new database file (.sqlite format) 

> Script tested on **OSX 10.8.4**, **iTunes version 11.0.4**, with a backup of an iPhone 5 running **iOS 6.1.4**


###GetMessages script

`GetMessages.scpt` compiles three individual actions/scripts located in the [actions](https://github.com/nrollr/applescript/tree/master/backup_messages/actions) directory:
 
* **_ExtractDB.scpt_** : extracts the sqlite file from your iPhone backup and stores it as `MessagesDB.sqlite`
* **_CreateDB.scpt_** : creates a clean sqlite file called `MasterDB.sqlite` and populates the database with table a structure optimized for iOS6 content
* **_InsertData.scpt_** : only extracts relevant content from `MessagesDB.sqlite` and injects it in `MasterDB.sqlite`

###Running the script

First create a new directory called **/Temp** in your home folder and copy the `GetMessages.scpt`-file into the new directory. Next open Applescript Editor and run it. 

When you run the `GetMessages`script, you will be prompted to enter your UDID
> If you don't know your UDID, open iTunes, connect your iPhone, on the **Summary** page click on **Serial Number** and you'll notice it switches to **Identifier (UDID)** automatically. Next right click the UDID number and select **Copy Identifier (UDID)** and paste in the prompt of the `GetMessages`script. 

After executing the script, you'll end up with two .sqlite files in your directory. An easy way to consult the contents of the produced `MasterDB.sqlite`-file is using a Firefox add-on called [SQLite Manager](https://code.google.com/p/sqlite-manager)  - *currently version 0.8.0*  

####Additonal info
* Path to backup file: `/Users/admin/Library/Application Support/MobileSync/Backup/<UDID>`
* File containing text messages: `3d0d7e5fb2ce288813306e4d4636395e047a3d28`
* Text messages are stored in the `messages`table. Required columns are _rowid; text; handle_id; date; is_from_me_

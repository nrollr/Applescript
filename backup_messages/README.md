##Extract your text messages from your iPhone backup

The title is quite self explanatory: the script retrieves your text messages from your iPhone backup directory and copies only the relevant content to a brand new database file (.sqlite format) 

> Script tested on **OSX 10.8.4**, **iTunes version 11.0.4**, with a backup of an iPhone 5 running **iOS 6.1.4**


###GetMessages script

`GetMessages.scpt` compiles three individual scripts located in the *actions* -directory:
 
* **_ExtractDB.scpt_** : extracts the sqlite file from your iPhone backup and stores it as `MessagesDB.sqlite`
* **_CreateDB.scpt_** : creates a clean sqlite file called `MasterDB.sqlite` and populates the database with table a structure optimized for iOS6 content
* **_InsertData.scpt_** : only extracts relevant content from `MessagesDB.sqlite` and injects it in `MasterDB.sqlite`

###Running the script

As a recommendation, first create a new directory in your home folder (eg. _Temp_), copy the `GetMessages.scpt`-file into the new directory, open Applescript Editor and run it. 

When you run the `GetMessages`script, you will be prompted to enter your UDID
> If you don't know your UDID, open iTunes, connect your iPhone, on the **Summary** page click on **Serial Number** and you'll notice it switches to **Identifier (UDID)** automatically. Next right click the UDID number and select **Copy Identifier (UDID)** and paste in the prompt of the `GetMessages`script. 

After executing the script, you'll end up with two .sqlite files in your directory
An easy way to consult the contents of the produced `MasterDB.sqlite`-file is using a Firefox add-on called [SQLite Manager](https://code.google.com/p/sqlite-manager) (_currently version 0.8.0_)  
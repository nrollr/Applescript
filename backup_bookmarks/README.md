##Extract your bookmarks from Firefox

The script allows you to backup your Firefox bookmarks to a separate database file (.sqlite format)

> Script tested on **OSX 10.8.4** and **Firefox version 22.0**


###GetBookmarks script

`GetBookmarks.scpt` consists of a couple of actions:
 
* Copies the `places.sqlite` file from your Firefox profile directory and renames it as `PlacesDB.sqlite`
* Creates a new database called `BookmarksDB.sqlite`, including a simplified table structure
* Extracts relevant content from `PlacesDB.sqlite` and injects it in `BookmarksDB.sqlite`
* Executes a sanitization process

###Running the script

First create a new directory called **/Temp** in your home folder and copy the `GetBookmarks.scpt` file to the new directory. Next open the script with Applescript Editor and replace`<profile_id>` with your own _(see remark in the **Additional info** section)_. Finally execute the script. _(takes a couple fo seconds to complete)_

> **Important:** In order to execute this script, make sure /Applications/Firefox.app is not running

After execution of the script, you'll end up with two files `PlacesDB.sqlite` and `BookmarksDB.sqlite` in your **/Temp** directory. An easy way to consult the contents of the produced .sqlite files is using a Firefox add-on called [SQLite Manager](https://code.google.com/p/sqlite-manager) (_currently version 0.8.0_)  

####Additonal info
* Path to **places.sqlite** file: `~/Library/Application Support/Firefox/Profiles/<profile folder>`
* The repository also contains [GetBookmarks.pdf](https://github.com/nrollr/applescript/tree/master/backup_bookmarks/GetBookmarks.pdf) which is a visual representation of all manipulations within the script.

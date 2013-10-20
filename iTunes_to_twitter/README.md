##iTunes to Twitter 

This script fetches the name and artist of the song currently playing in iTunes, compose a tweet with these values and sends it to Twitter using two methods (depending on the script you choose) : 

1. Passing a formatted URL to the browser of your choice. There are custom scripts for [Safari]() and/or [Chrome]() 
2. Using the [Twitter Scripter](itunes.apple.com/us/app/twitter-scripter/id645249778?mt=12) an agent that provides simplified access to the Twitter API directly from AppleScript.


###How it works

First we fetch the **name** and the **artist** value from iTunes, which are used to compose the tweet in a format: "Now playing : ♫ _`trackName` - `trackArtist`_ ♫ "

If you choose to post it to Twitter using a browser the tweet is appended to an URL `http://twitter.com/intent/tweet?text=` and then passed on to your browser of choice (which still requires you to sign in and hit the tweet button manually). Or you may use the Twitter Scripter agent to post it directly to Twitter, with no further user interaction required.  

####Formatted URL for browsers

* `Tweet via Safari.applescript` for Safari 
* `Tweet via Chrome.applescript` for Google Chrome 
  
The compiled versions can be found in the [scpt files](https://github.com/nrollr/applescript/tree/master/iTunes_to_twitter/scpt%20files) directory

 
####Using the Twitter Scripter

* `Tweet via Twitter Scripter.applescript` - Do not forget to adapt the `"your_twitter_useraccount"` field in the script to your own

> **Important notice**: After installing the Twitter Scripter agent, there is some configuration required. For more information and script examples go to [mousedown.net](http://mousedown.net/mouseware/TwitterScripter_Examples.html)

> 1. You will need at least one Twitter account in the "Mail, Contacts & Calendars" System preference in 10.8 (or "Internet Accounts" in 10.9)
> 
> 2. You will need to give Twitter Scripter permission to access Twitter via the "Security & Privacy" System preference, Privacy tab.




###Additonal info
* Script tested on **OSX 10.9** and **iTunes version 11.1.1** 
* All compiled scripts can be found in the [scpt files](https://github.com/nrollr/applescript/tree/master/iTunes_to_twitter/scpt%20files) directory
* [Twitter Scripter](itunes.apple.com/us/app/twitter-scripter/id645249778?mt=12) is free agent and can be downloaded from the Mac Apple Store.



> You will notice there is a script for Firefox as well, though currently there is an issue, as the Unicode character U+266B in the composed tweet are is passed on correctly to the Firefox address field. 
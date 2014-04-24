##Shorten GitHub URL's

A simple AppleScript requesting a [GitHub](https://github.com) URL as input and returns the shortened `git.io` URL. The short URL is directly copied to the clipboard, when completed the user receives an additional notification via the OSX notification center. 

###Git.io

If you are not familiar with the **Git.io** URL shortening service, here are some examples:
 
`https://github.com/philipwalton/solved-by-flexbox` is shortened to [git.io/rfNDMw](http://git.io/rfNDMw)  
`https://github.com/jordansinger/hook.js/` is shortened to [git.io/NPeLpw](http://git.io/NPeLpw)
  
> **Important notice**: the `git.io` URL shortening service **only** works for GitHub URLs and thus serves another purpose as more common URL shortening services out there like [bit.ly](https://bitly.com/)

 
###How it works

As the prompted dialog box requests: _"Enter the GitHub URL to shorten"_ and click OK. In the background a shell script requests the **Git.io** service to return the shortened version, like you would do via command line with `curl -i git.io -F "url=your.github.com"`.  
The actual shortened URL is extracted from the output returned by the **Git.io** service and copied to the clipboard. The enduser is informed about this via a notification, using the OSX notification center. (see [screenshot](http://cl.ly/T5rA) of the notification)

**Note:** the use and integration of the Applescript with OSX notification center is only valid if you are running the script in the latest version of OSX, Mavericks. If you plan on using the script in earlier versions of OSX, you need to remove or change the last line in the script `display notification` 
 
The compiled version can be found in the [scpt file](https://github.com/nrollr/applescript/tree/master/shorten_URL/Shorten%20Github%20URL/scpt%20file) directory





###Additonal info
Script was tested on **OSX 10.9.1** and **AppleScript 2.3** 
 
> More about the AppleScript `"display notification"` command can be found in: 
> 
* an article posted on the [Mac OS X Automation](http://macosxautomation.com/mavericks/notifications/01.html) website
* the official [AppleScript Language Guide](https://developer.apple.com/library/mac/documentation/applescript/conceptual/applescriptlangguide/AppleScriptLanguageGuide.pdf) (.pdf file)


















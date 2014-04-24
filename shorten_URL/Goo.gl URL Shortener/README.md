##Shorten URL's with Goo.gl

A simple AppleScript requesting any type of URL as input and returns a shortened `goo.gl` URL. The short URL is directly copied to the clipboard, when completed the user receives an additional notification via the OSX notification center. 

###Goo.gl

If you are not familiar with the Google URL Shortener service, here is an example:  
`https://developers.google.com/url-shortener/v1` is shortened to [goo.gl/ll5bAa](http://goo.gl/ll5bAa)  

For more information about the Google URL Shortener API, please read the API documentation on  [developers.google.com](https://developers.google.com/url-shortener/v1/getting_started) . Also note: the use of a (personal) API key or auth token is highly recommended according to the documentation: 
> _"Requests to the Google URL Shortener API for public data must be accompanied by an identifier, which can be an API key or an auth token."_  
     
The section _"**Acquiring and using an API key**"_ will guide your through this process.
  
 
###How it works

As the prompted dialog box requests: _"Enter a long URL"_ and click OK. In the background a shell script requests the **Goo.gl** service to return the shortened version.
The shortened URL returned by the **Goo.gl** service and copied to the clipboard. The enduser is informed about this via a notification, using the OSX notification center. (see [screenshot](http://cl.ly/T5rA) of the notification)
  
**Note #1:** Since the API documentation recommends to include an identifier, make sure to modify the script to reflect your own personal API key:   
> In `https://www.googleapis.com/urlshortener/v1/url?key={YOUR_API_KEY}`   
where `YOUR_API_KEY` should be replaced with your actual personal API key provided by Google.  

**Note #2:** the use and integration of the Applescript with OSX notification center is only valid if you are running the script in the latest version of OSX, Mavericks. If you plan on using the script in earlier versions of OSX, you need to remove or change the last line in the script `display notification` 
 
The compiled version can be found in the [scpt file](https://github.com/nrollr/applescript/tree/master/shorten_URL/scpt%20file) directory

  

###Additonal info
Script was tested on **OSX 10.9.2** and **AppleScript 2.3.1** 
 
> More about the AppleScript `"display notification"` command can be found in: 
> 
* An article posted on the [Mac OS X Automation](http://macosxautomation.com/mavericks/notifications/01.html) website
* The official [AppleScript Language Guide](https://developer.apple.com/library/mac/documentation/applescript/conceptual/applescriptlangguide/AppleScriptLanguageGuide.pdf) (.pdf file)

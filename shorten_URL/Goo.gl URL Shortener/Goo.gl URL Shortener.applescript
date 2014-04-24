-- Use the Goo.gl URL Shortener service to shorten your URLs
display dialog "Enter a long URL" default answer ""

set longURL to text returned of result
set shortURL to do shell script "curl -s https://www.googleapis.com/urlshortener/v1/url?key={YOUR_API_KEY} -H 'Content-Type: application/json' -d \"{\\\"longUrl\\\": \\\"" & longURL & "\\\"}\" | awk '/\"id\":/{print substr($2, 2, length($2)-3)}'"

set the clipboard to shortURL as text
-- Alternative: display dialog shortURL

display notification "Short URL copied to clipboard"
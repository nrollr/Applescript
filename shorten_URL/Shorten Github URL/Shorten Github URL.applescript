-- Use the Git.io online service to shorten your GitHub URls
display dialog "Enter the GitHub URL to shorten" default answer ""

set theURL to text returned of result
set theResult to do shell script "curl -i git.io -F url=" & theURL & " | grep Location |cut -d' ' -f2"

set the clipboard to theResult as text
-- alternative: display dialog theResult

display notification "Short URL copied to clipboard"
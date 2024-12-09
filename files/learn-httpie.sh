http GET https://api.example.com/posts
http --offline https://api.example.com/posts
http :/users    # http://localhost/users
http :5000/rss  # http://localhost:5000/rss
http https://api.example.com/tags # GET tags
http https://api.example.com/tags title="Tutorial" slug="tutorial" # POST a new tag
http https://api.example.com/search q==httpie per_page==20
http POST https://api.example.com/posts title="Hello" body="World"
http -f POST https://api.example.com/submit name=John email=john@example.com
http --form POST https://api.example.com/upload file@/path/to/file.txt
http GET https://api.example.com/posts Authorization:"Bearer Token" User-Agent:"HTTPie"
http -a username:password GET https://api.example.com/protected
https -A bearer -a token https://api.example.com/admin
http GET https://api.example.com/data Accept:application/json  # Pretty Print JSON

http GET https://api.example.com/image --output image.png      # Save Response to File

http --follow GET https://example.com  # Follow Redirects

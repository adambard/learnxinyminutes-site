
http GET https://api.example.com/posts

http --offline https://api.example.com/posts

http :/users    # http://localhost/users
http :5000/rss  # http://localhost:5000/rss

http https://api.example.com/tags # GET - Seleciona as tags
http https://api.example.com/tags title="Tutorial" slug="tutorial" # POST - Cria uma nova tag

http https://api.example.com/search q==httpie per_page==20

http POST https://api.example.com/posts title="Olá" body="Mundo"

http -f POST https://api.example.com/submit name=John email=john@example.com

http --form POST https://api.example.com/upload file@/caminho/do/arquivo.txt

http GET https://api.example.com/posts Authorization:"Bearer Token" User-Agent:"HTTPie"

http -a usuario:senha GET https://api.example.com/protected

https -A bearer -a token https://api.example.com/admin

http GET https://api.example.com/data Accept:application/json  # Exibe o JSON de uma forma legível

http GET https://api.example.com/image --output image.png      # Grava a resposta em um arquivo

http --follow GET https://example.com  # Segue redirecionamentos


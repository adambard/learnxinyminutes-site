
# Instala o binário composer.phar no diretório atual
curl -sS https://getcomposer.org/installer | php
# Se você fizer desta forma, você precisará chamar o composer assim:
php composer.phar about

# Instala o binário em ~/bin/composer
# Nota: certifique-se de que ~/bin está na variável de ambiente PATH do seu shell
curl -sS https://getcomposer.org/installer | php -- --install-dir=~/bin --filename=composer

# Verifica a versão e lista as opções
composer

# Para obter ajuda com os comandos
composer help require

# Verifica se o Composer tem as permissões necessárias e se está atualizado
composer diagnose
composer diag # atalho

# Atualiza o binário do Composer para a última versão
composer self-update
composer self # atalho

# Cria um novo projeto na pasta atual
composer init
# Executa um questionário interativo, te pedindo detalhes sobre o projeto.
# Você pode deixar o questionário em branco, desde que não haja outros projetos dependendo deste.

# Se um arquivo composer.json já existir, baixa as dependências
composer install

# Para baixar apenas as dependências de produção, excluindo as de desenvolvimento
composer install --no-dev

# Adiciona uma dependência de produção ao projeto
composer require guzzlehttp/guzzle
# O Composer se encarrega de verificar qual é a última versão de
# guzzlehttp/guzzle, baixar e adicionar a nova dependência no
# campo 'require' do composer.json

composer require guzzlehttp/guzzle:6.0.*
# O composer baixa a última versão que combine com o padrão informado (6.0.2, por exemplo)
# e adiciona essa dependência ao campo 'require' do arquivo composer.json

composer require --dev phpunit/phpunit:~4.5.0
# O composer irá baixar a dependencia como desenvolvimento,
# usando a versão mais recente >= 4.5.0 e < 4.6.0

composer require-dev phpunit/phpunit:^4.5.0
# O composer irá baixar a dependencia como desenvolvimento,
# usando a versão mais recente >= 4.5.0 e < 5.0

# Para mais informações sobre os padrões de versões, veja a
# Documentação sobre Versões do Composer: https://getcomposer.org/doc/articles/versions.md (EN)

# Para ver quais pacotes estão disopníveis e quais estão instalados
composer show

# Para ver quais pacotes estão instalados
composer show --installed

# Para encontrar um pacote que tenha 'mailgun' no nome ou descrição
composer search mailgun

# Atualizar todas as dependências para a versão mais recente (ainda dentro das preferências definidas)
composer update

# Para atualizar a versão de uma dependência específica:
composer update phpunit/phpunit

# Para migrar um pacote para uma nova preferência de versão, você pode precisar
# remover o pacote antigo e suas dependências primeiro
composer remove --dev phpunit/phpunit
composer require --dev phpunit/phpunit:^5.0

require __DIR__ . '/vendor/autoload.php';

$mailgun = new Mailgun\Mailgun("key");

{
  "autoload": {
    "psr-4": {"Acme\\": "src/"}
  }
}

composer dump-autoload
composer dump # shorthand

# Otimiza pacotes PSR-0 e PSR-4 para carregar com mapas de classes também.
# É mais demorado, mas melhora a performance em produção.
composer dump-autoload --optimize --no-dev

# O Composer irá evitar baixar pacotes caso eles estejam no cache. Para limpar o cache:
composer clear-cache

composer diagnose
composer self-update
composer clear-cache


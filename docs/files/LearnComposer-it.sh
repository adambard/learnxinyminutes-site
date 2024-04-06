
# Se installi l'eseguibile in una cartella...
curl -sS https://getcomposer.org/installer | php
# ...dovrai utilizzare questo approccio, invocando Composer in questo modo:
php composer.phar about

# Se installi l'eseguibile nella directory ~/bin/composer
# Nota: assicurati che ~/bin si trovi nella variabile di ambiente PATH
curl -sS https://getcomposer.org/installer | php -- --install-dir=~/bin --filename=composer

# Controlla la versione e la lista delle opzioni disponibili
composer

# Ottieni ulteriori informazioni riguardanti le opzioni
composer help require

# Controlla se Composer ha tutto il necessario per funzionare come si deve
# e se è aggiornato correttamente all'ultima versione disponibile.
composer diagnose
composer diag # alias

# Aggiorna Composer all'ultima versione disponibile
composer self-update
composer self # alias

# Crea un nuovo progetto nella cartella attuale
composer init
# ti verranno chieste delle domande interrative riguardanti il tuo progetto. 
# Puoi evitare di rispondere almeno che tu non stia sviluppando altri progetti 
# che che possano dipendere da questo.

# Se il file composer.json esiste già, scarichera' le dipendenze necessarie
composer install

# Scarica le dipendenze necessarie per l'ambiente di produzione
composer install --no-dev

# Aggiunge una dipendenza per l'ambiente di produzione
composer require guzzlehttp/guzzle
# automaticamente selezionera' l'ultima versione, la scarichera' e la aggiungera'
# come dipendenza nell'apposito campo del file composer.json.

composer require guzzlehttp/guzzle:6.0.*
# scarichera' l'ultima versione disponibile corrispondente al pattern (es. 6.0.2)
# e lo aggiungera' come dipendenza nell'apposito campo del file composer.json.

composer require --dev phpunit/phpunit:~4.5.0
# aggiungera' la dipendenza nell'ambiente di sviluppo utilizzando l'ultima versione
# disponibile nel range >=4.5.0 e < 4.6.0.

composer require-dev phpunit/phpunit:^4.5.0
# aggiungera' la dipendenza nell'ambiente di sviluppo utilizzando l'ultima versione
# disponibile nel range >=4.5.0 and < 5.0.

# Per ulteriori dettagli riguardo le versioni, vedi [la documentazione di Composer sulle versioni](https://getcomposer.org/doc/articles/versions.md) per ulteriori dettagli

# Per vedere quali pacchetti sono installabili e quali sono gia' stati installati
composer show

# Per vedere solo quali pacchetti sono gia' stati installati
composer show --installed

# Per trovare una dipendenza con 'mailgun' nel suo nome o nella descrizione.
composer search mailgun

# Se vuoi aggiornare tutte le dipendenze all'ultima versione che corrisponde al pattern descritto
composer update

# Se vuoi scaricare l'ultima versione di una particolare dipendenza:
composer update phpunit/phpunit

# Se vuoi cambiare la versione di una una dipendenza, potresti dover rimuovere
# quello attualmente selezionato, per poi richiedere quello corretto successivamente,
# attraverso i seguenti comandi:
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
composer dump # alias

# Ottimizza i pacchetti PSR0 e PSR4 per essere caricati anche con le classmap.
# Sara' lento, ma migliorera' le performance in produzione.
composer dump-autoload --optimize --no-dev

# Composer utilizzera i pacchetti scaricati anche per i progetti futuri. Per evitare che accada:
composer clear-cache

composer diagnose
composer self-update
composer clear-cache


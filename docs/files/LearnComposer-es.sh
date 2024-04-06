
# Instala el binario 'composer.phar' en el directorio actual
curl -sS https://getcomposer.org/installer | php
# Si utiliza este método, tendrá que invocar a 'composer' de esta manera:
php composer.phar about

# Instala el binario en ~/bin/composer
# Nota: asegúrese de que ~/bin está en la variable de entorno PATH del shell
curl -sS https://getcomposer.org/installer | php -- --install-dir=~/bin --filename=composer

# Comprobar la versión y lista las opciones
composer

# Obtener más ayuda para las opciones
composer help require

# Comprueba si composer es capaz hacer las cosas que necesita y si está actualizado
composer diagnose
composer diag # versión corta

# Actualiza el binario composer a la última versión
composer self-update
composer self # versión corta

# Crear un nuevo proyecto en la carpeta actual
composer init
# Este corre un cuestionario interactivo que le pide detalles sobre su proyecto. 
# Dejándolos en blanco está bien a menos que usted está haciendo otros proyectos que dependen de éste.

# Si un archivo 'composer.json' ya existe, descargar las dependencias
composer install

# Para descargar solo las dependencias de producción, es decir, excluyendo las 
# dependencias de desarrollo
composer install --no-dev

# Añadir una dependencia de producción a este proyecto
composer require guzzlehttp/guzzle
# Composer buscará cuál es la última versión de guzzlehttp/Guzzle, lo descarga,
# y finalmente añade la nueva dependencia al campo requerido en 'composer.json'.

composer require guzzlehttp/guzzle:6.0.*
# Composer descargará la versión más reciente que coincida con el patrón 
# (ej 6.0.2) y añade la dependencia al campo requerido en 'composer.json'.

composer require --dev phpunit/phpunit:~4.5.0
# Se requerirá como una dependencia de desarrollo. Se usará la última 
# versión >= 4.5.0 y < 4.6.0

composer require-dev phpunit/phpunit:^4.5.0
# Se requerirá como una dependencia de desarrollo. Se usará la última versión >= 4.5.0 y <  5.0

# Para obtener más información sobre las coincidencias de versiones de Composer, 
ver [La Documentación de Composer\'s Sobre Versiones (EN)](https://getcomposer.org/doc/articles/versions.md)

# Para ver qué opciones están disponibles para instalar y los paquetes instalados actualmente  
composer show

# Para ver qué paquetes están instalados actualmente
composer show --installed

# Para encontrar un paquete con 'mailgun' en su nombre o descripción
composer search mailgun

# Si desea actualizar todas las dependencias a su versión más reciente aún que coincidan con sus preferencias versión
composer update

# Si desea la nueva versión de una dependencia particular:
composer update phpunit/phpunit

# Si desea migrar la preferencia de un paquete a una versión más reciente, puede que tenga que quitar primero el paquete de más antiguo y sus dependencias.
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

# Optimiza los paquetes PSR0 y PSR4 a ser cargados con classmaps también. Es lento para correr, pero mejora el rendimiento en producción.
composer dump-autoload --optimize --no-dev

# Composer retendrá los paquetes descargados para su uso en el futuro. Puede removerlos con:
composer clear-cache

composer diagnose
composer self-update
composer clear-cache


# Installs the composer.phar binary into the current directory
curl -sS https://getcomposer.org/installer | php
# If you use this approach, you will need to invoke composer like this:
php composer.phar about

# Installs the binary into ~/bin/composer
# Note: make sure ~/bin is in your shell's PATH environment variable
curl -sS https://getcomposer.org/installer | php -- --install-dir=~/bin --filename=composer
# Check version and list options
composer

# Get more help for options
composer help require

# Check if Composer is able to do the things it needs, and if it's up to date
composer diagnose
composer diag # shorthand

# Updates the Composer binary to the latest version
composer self-update
composer self # shorthand
# Create a new project in the current folder
composer init
# runs an interactive questionnaire asking you for details about your project.  Leaving them blank is fine unless you are making other projects dependent on this one.

# If a composer.json file already exists, download the dependencies
composer install

# To download the just the production dependencies, i.e. excluding development dependencies
composer install --no-dev

# Add a production dependency to this project
composer require guzzlehttp/guzzle
# will figure out what the latest version of guzzlehttp/guzzle is, download it, and add the new dependency to composer.json's require field.

composer require guzzlehttp/guzzle:6.0.*
# will download the latest version matching the pattern (eg. 6.0.2) and add the dependency to composer.json's require field

composer require --dev phpunit/phpunit:~4.5.0
# will require as a development dependency. Will use the latest version >=4.5.0 and < 4.6.0

composer require-dev phpunit/phpunit:^4.5.0
# will require as a development dependency. Will use the latest version >=4.5.0 and < 5.0

# For more information on Composer version matching, see [Composer's documentation on Versions](https://getcomposer.org/doc/articles/versions.md) for more details

# To see what packages are available to install and currently installed
composer show

# To see what packages are currently installed
composer show --installed

# To find a package with 'mailgun' in its name or description
composer search mailgun
# If you want to update all the dependencies to their newest version still matching your version preferences
composer update

# If you want the new version of a particular dependency:
composer update phpunit/phpunit

# If you wish to migrate a package to a newer version preference, you may need to remove the older package and its dependencies first.
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

# Optimizes PSR0 and PSR4 packages to be loaded with classmaps too. Slow to run, but improves performance on production.
composer dump-autoload --optimize --no-dev
# Composer will retain downloaded packages to use in the future. Clear it with:
composer clear-cache
composer diagnose
composer self-update
composer clear-cache


# Устанавливаем composer.phar в текущую папку
curl -sS https://getcomposer.org/installer | php
# Если вы используете этот подход, вам нужно будет вызвать Composer следующим образом:
php composer.phar about

# Устанавливаем бинарный файл в ~/bin/composer
# Примечание: убедитесь, что ~/bin находится в переменной PATH вашего окружения
curl -sS https://getcomposer.org/installer | php -- --install-dir=~/bin --filename=composer

# # Проверить версию и перечислить параметры
composer

# Получить дополнительную помощь для параметров
composer help require

# Проверить, способен ли Composer делать то, что ему нужно, и обновлён ли он
composer diagnose
composer diag # краткий вариант

# Обновление Composer до последней версии
composer self-update
composer self # краткий вариант

#  Создать новый проект в текущей папке
composer init
# запускается интерактивная анкета с просьбой предоставить подробную информацию о вашем проекте.
# Вы прекрасно можете оставить ответы пустыми, если не делаете другие проекты 
# зависимыми от создаваемого проекта.

# Если файл composer.json уже существует, загрузите зависимости
composer install

# Чтобы загрузить только зависимости для готового продукта, т.е. 
# исключая зависимости для разработки
composer install --no-dev

# Добавить зависимость для готового продукта к этому проекту
composer require guzzlehttp/guzzle
# выяснит, какая существует последняя версия guzzlehttp / guzzle,
# загрузит её и добавит новую зависимость в поле require файла composer.json.

composer require guzzlehttp/guzzle:6.0.*
# Загрузит последнюю версию, соответствующую шаблону (например, 6.0.2),
# и добавит зависимость к полю require файла composer.json

composer require --dev phpunit/phpunit:~4.5.0
# Добавит как зависимость для разработки.
# Будет использовать последнюю версию> = 4.5.0 и <4.6.0

composer require-dev phpunit/phpunit:^4.5.0
# Добавит как зависимость для разработки.
# Будет использовать последнюю версию> = 4.5.0 и <5.0

# Для получения дополнительной информации о совместимости версий Composer см.
# [Документацию Composer по версиям] (https://getcomposer.org/doc/articles/versions.md)

# Чтобы узнать, какие пакеты доступны для установки и в настоящее время установлены
composer show

# Чтобы узнать, какие пакеты в настоящее время установлены
composer show --installed

# Чтобы найти пакет со строкой «mailgun» в названии или описании
composer search mailgun

# Если вы хотите обновить все зависимости до новейших версий,
# которые по-прежнему соответствуют вашим предпочтениям для версий
composer update

# Если вам нужна новая версия определённой зависимости:
composer update phpunit/phpunit

# Если вы хотите перенести пакет на более новую версию 
#с изменением предпочитаемой версии,
# вам может потребоваться сначала удалить старый пакет и его зависимости.
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
composer dump # краткий вариант

# Оптимизирует пакеты PSR0 и PSR4 для загрузки классов с помощью карты классов.
# Медленно запускается, но улучшает производительность готового продукта.
composer dump-autoload --optimize --no-dev

# Composer хранит загруженные пакеты для использования в будущем. Очистите кэш с помощью:
composer clear-cache

composer diagnose
composer self-update
composer clear-cache


#!/usr/bin/env bash
set -e

# graphql dependencies
composer require oxid-esales/graphql-base --no-update &&
composer require oxid-esales/graphql-storefront --no-update &&
composer update

./vendor/bin/oe-console oe:module:install-configuration ./vendor/oxid-esales/graphql-base ./source/modules/oe/graphql-base
./vendor/bin/oe-console oe:module:install-configuration ./vendor/oxid-esales/graphql-storefront ./source/modules/oe/graphql-storefront

vendor/bin/oe-eshop-doctrine_migration migration:migrate oe_graphql_storefront

vendor/bin/oe-console oe:module:activate oe_graphql_base
vendor/bin/oe-console oe:module:activate oe_graphql_storefront

# your custom stuff here
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# SENS·COMMUN

## Présentation

## Demo

## Installation
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Développeurs

### INSTALLATION DE L'APPLICATION

```
bundle install
rails db:create
rails db:migrate
rails webpacker:install
```

### MÉTHODOLOGIE GIT

**Description des branches de l'application**

🔴 features/

 -> Branches dédiées au développement de fonctionnalités

🟠 develop

-> Branche principale de développement du projet

🟡 release

-> Branche de pré-livraison d'une nouvelle version de l'application

🟣 hotfix

-> Branche de réparation d'urgence

🟢 main

-> Branche en production

### PROCESS DE DÉVELOPPEMENT GIT

**Développement d'une feature**

* 1️⃣ git checkout develop
* 2️⃣ git  pull develop
* 3️⃣ git checkout -b feature/name

-> développement de la feature
* 4️⃣ git add .
* 5️⃣ git commit -m "description du commit"

-> fin du développement de la feature + tests
* 6️⃣ git checkout develop
* 7️⃣ git pull
* 8️⃣ git checkout feature/name
* 9️⃣ git merge develop
* 1️⃣0️⃣ git push origin feature/name 

### MÉTHODOLOGIE DE PUSH SUR HEROKU
liste à suivre pour les remotes heroku :
- heroku git:remote -a pure-chamber-27665
- git remote rename heroku heroku-release
- heroku git:remote -a sens-commun
- git remote rename heroku heroku-main
- heroku git:remote -a intense-oasis-07565
- git remote rename heroku heroku-develop

Après comment travailler sur chacun des remote(exemple sur heroku-develop):
- git push heroku-develop develop:main (ici on écrit develop:main car la branch develop dépend de main, si on voulait push le main sur heroku-main alors on ecrirait seulement main)
- heroku run rails db:migrate --remote heroku-develop
- heroku run rails db:seed --remote heroku-develop
- ...autre commande 

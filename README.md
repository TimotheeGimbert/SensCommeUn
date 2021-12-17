# README

### Lien en production
- [Sens-commun](https://sens-commun.herokuapp.com/)

### Présentation
- Création 
  Sens•Commun est un outil CRM destine aux acteurs de l'Economie Sociale et Solidaire.  
  
  Le but est de proposer une solution qui permet de centraliser des informations (documents,statuts,actualites,messages) d'une organisation et d'en gerer l'acces pour sa communaute. L'administrateur pourra ainsi creer/gerer les organisations de son reseau, les droits utilisateurs et communiquer avec eux via la plateforme.

  Sens•Commun centralise et uniformise differents outils en un seul tout en restant adaptable et modulable selon les besoins de chaque organisation.

### Business Model 
- Comment vous comptez rémunérer l'organisation
  - hebergement securise des donnes via la solution
  - aide au pilotage / integrations
  - formation a l'utilisation et l'optimisation
  - support et maintenance
### L'équipe en place : 
- Qui êtes-vous ?
  - Xavier Kinderf, developpeur et createur du projet
  - Louis Lorgere, developpeur
  - Timothee Gimbert, developpeur
  - Paola Aichour, developpeuse
  - Michael Rabarone, developpeur
### Nos clients
- Votre cible
Organisations du secteur de l'economie Sociale et Solidaire

### Nos résultats à date
- Si vous n'en n'avez pas, pas besoin d'inventer
Aucun car le produit est en phase de pilote
### Résultats escomptés dans trois ans
- Dites ce que vous comptez faire
work in progress
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

### COMPTES TEST PLATEFORME
- utilisateur : 
  - identifiants : user@user.com
  - mdp : azerty

- representant legal :
  - id : legalrep@legalrep.com
  - mdp : azerty

- administrateur :
  - id : admin@admin.com
  - mdp : azerty
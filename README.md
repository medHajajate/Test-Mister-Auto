# Test-Mister-Auto
Développer une mini application iOS qui permet de gérer la liste des tâches des utilisateurs. 

# Fonctionnement
Il s’agit d’une vue qui affiche une liste d’utilisateur récupérée via une API REST, en choisissant un
utilisateur je peux afficher ses tâches dans une autre vue.
Un utilisateur est désigné par son nom (name), son nom d’utilisateur (username) et son email
(email), les autres informations seront ignorées.
Une tâche est désignée par son titre (title) et l’état d’avancement (completed) qui indique si cette
dernière est complétée ou pas.

# API :
• Liste d’utilisateur : https://jsonplaceholder.typicode.com/users/

• Liste des tâches par utilisateur : https://jsonplaceholder.typicode.com/todos?userId=%d 


## How to build

1) Clone the repository

```bash
$ git clone https://github.com/medHajajate/Test-Mister-Auto.git
```

2) Install pods

```bash
$ cd Test\ Mister\ Auto/
$ pod install
```

3) Open the workspace in Xcode

```bash
$ open "Test\ Mister\ Auto.xcworkspace"
```
 
4) Compile and run the app in your simulator

# Libraries

* [Alamofire](https://github.com/Alamofire/Alamofire5)

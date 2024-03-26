# 🎮 Guide d'utilisation de votre projet Godot 

Ce guide vous aidera à démarrer avec un nouveau projet Godot et la mise en place d'une CI vers un déploiement vers itch.io. Il permet de simplifier vos développements/tests lors de vos game jam.
Il se base sur le template que vous pouvez trouver ici: https://github.com/bitbrain/godot-gamejam avec mes commandaires/améliorations sur ça mise en place.

## 1. 🚧 Création de votre nouveau repository

Dans cette première étape, on doit mettre en place notre nouveau repository dans github. 
Pour cela suivez ces étapes :
1. **Créez un nouveau repository sur GitHub :**
   - Accédez à votre compte GitHub.
   - Cliquez sur "Nouveau" pour créer un nouveau repository.
   - Donnez-lui un nom, une description et choisissez les options appropriées.
   - Cliquez sur "Create repository" pour le créer.

2. **Clonez votre repository sur votre machine locale :**
   ```bash
   git clone <URL_de_votre_repository>
   ```

## 2. ⛔ Ajouter le .gitignore
Ajoutez votre fichiers .gitignore pour ignorer les fichiers non nécessaires. J'ai pris l'exemple du contenue du .gitignore fournis ici : https://github.com/github/gitignore/blob/main/Godot.gitignore pour m'inspirer. Je l'ai un peu modifier pour faire fonctionner la CI (lier a un problème d'un fichier export_presets.cfg, je reviens dessus plus tard), mon fichier est comme celui-ci :
```
# Godot 4+ specific ignores
.godot/

# Godot-specific ignores
.import/
export.cfg

# Imported translations (automatically generated from CSV files)
*.translation

# Mono-specific ignores
.mono/
data_*/
mono_crash.*.json
```

## 3. 📁 Créer un projet Godot
1. **Ouvrir Godot :** Lancez l'application Godot sur votre ordinateur.
2. **Créer un nouveau projet :** Sur l'écran d'accueil de Godot, cliquez sur "Nouveau projet".
3. **Configurer les paramètres du projet :** Choisissez l'emplacement où vous avez créer votre repository pour votre projet et donnez-lui un nom.
4. **Choisir un modèle de projet :** Sélectionnez le modèle de projet qui correspond le mieux à vos besoins. Vous pouvez choisir entre "Projet 2D", "Projet 3D", "Projet 2D et 3D" ou "Modèle vide".
5. **Créer le projet :** Cliquez sur "Créer le projet" pour créer votre nouveau projet Godot.
6. **Explorez le projet :** Une fois le projet créé, vous serez dirigé vers l'interface de Godot où vous pourrez commencer à travailler sur votre jeu ou votre application.

## 4. Lier le projet itch.io à la pipeline
1. Accédez à l'URL [https://itch.io/user/settings](https://itch.io/user/settings) et trouvez la section "Developer/API Keys".
2. Générez une nouvelle clé API et copiez-la.
3. Accédez aux paramètres de votre compte GitHub.
4. Dans la section "Secrets and variables", sélectionnez "Actions".
5. Créez un nouveau secret nommé "BUTLER_API_KEY" et collez votre clé API précédemment générée.
6. Retournez sur itch.io et créez un nouveau projet.
7. Retournez sur GitHub et créez deux nouveaux secrets : 
   - "ITCHIO_GAME" avec le nom de votre jeu créé sur itch.io.
   - "ITCHIO_USERNAME" avec votre pseudo sur itch.io.

Assurez-vous que toutes les étapes sont suivies correctement pour garantir le bon fonctionnement de l'intégration entre itch.io et GitHub.


Todo: 
- Explications de la structure des fichiers
- 

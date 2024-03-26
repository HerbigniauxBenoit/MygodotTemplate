# 🎮 Guide d'utilisation de votre projet Godot 

Ce guide vous aidera à démarrer avec un nouveau projet Godot et la mise en place d'une CI vers un déploiement vers itch.io. Il permet de simplifier vos développements/tests lors de vos game jam.
Il se base sur le template que vous pouvez trouver ici: https://github.com/bitbrain/godot-gamejam avec mes commandaires/améliorations sur ça mise en place !

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
Assurez-vous d'ignorer les fichiers non nécessaires en ajoutant un fichier .gitignore. J'ai pris l'exemple du contenue du .gitignore fournis ici : https://github.com/github/gitignore/blob/main/Godot.gitignore pour m'inspirer. 

Je l'ai un peu modifier pour faire fonctionner la CI (lier a un problème d'un fichier export_presets.cfg, je reviens dessus plus tard), mon fichier est comme celui-ci :
```bash
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

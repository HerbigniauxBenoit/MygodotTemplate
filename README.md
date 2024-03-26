# Guide d'utilisation de votre projet Godot 🎮

Ce guide vous aidera à démarrer avec un nouveau projet Godot avec la mise en place d'un CI/CD vers un déploiement vers itch.io pour simplifier vos développements lors de vos gamejam.
Il se base sur le template de gamejam que vous pouvez trouver ici: [https://github.com/bitbrain/godot-gamejam] avec mes commandaires/améliorations !

## 1. Création de votre nouveau repository

Pour créer votre nouveau repository, suivez ces étapes :

```bash
# Initialisez un nouveau repository Git
git init

# Ajoutez tous les fichiers à l'index
git add .

# Faites un premier commit
git commit -m "Initial commit"
```

## 2. Ajouter le .gitignore
Assurez-vous d'ignorer les fichiers non nécessaires en ajoutant un fichier .gitignore. Vous pouvez utiliser un template correct pour un projet Godot.

Le contenu du fichier .gitignore que j'utilise :
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

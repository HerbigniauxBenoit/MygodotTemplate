# 🎮 Guide d'utilisation de votre projet Godot

Ce guide vous aidera à démarrer avec un nouveau projet Godot et à mettre en place une intégration continue (CI) pour le déploiement vers itch.io. Il vous permettra de simplifier vos développements et tests lors de vos game jams. Ce guide se base sur le template que vous pouvez trouver ici : [https://github.com/bitbrain/godot-gamejam](https://github.com/bitbrain/godot-gamejam) avec mes commandes/améliorations pour sa mise en place.

## 1. 🚧 Création de votre nouveau dépôt

Dans cette première étape, nous devons mettre en place un nouveau dépôt sur GitHub. Voici comment procéder :

1. **Créez un nouveau dépôt sur GitHub :**
   - Accédez à votre compte GitHub.
   - Cliquez sur "Nouveau" pour créer un nouveau dépôt.
   - Donnez-lui un nom, une description et choisissez les options appropriées.
   - Cliquez sur "Créer le dépôt" pour le créer.

2. **Clonez votre dépôt sur votre machine locale :**
   ```bash
   git clone <URL_de_votre_dépôt>
   ```

## 2. ⛔ Ajout du .gitignore

Ajoutez un fichier .gitignore pour ignorer les fichiers non nécessaires. Vous pouvez utiliser l'exemple fourni dans [https://github.com/github/gitignore/blob/main/Godot.gitignore](https://github.com/github/gitignore/blob/main/Godot.gitignore) en le modifiant selon vos besoins. Voici un exemple :

```gitignore
# Godot 4+ spécifique
.godot/

# Ignorés spécifiques à Godot
.import/
export.cfg

# Traductions importées (générées automatiquement à partir de fichiers CSV)
*.translation

# Ignorés spécifiques à Mono
.mono/
data_*/
mono_crash.*.json
```

## 3. 📁 Création d'un projet Godot

1. Lancez l'application Godot sur votre ordinateur.
2. Sur l'écran d'accueil de Godot, cliquez sur "Nouveau projet".
3. Choisissez l'emplacement de votre dépôt pour votre projet et donnez-lui un nom.
4. Sélectionnez le modèle de projet qui correspond le mieux à vos besoins. Vous pouvez choisir entre "Projet 2D", "Projet 3D", "Projet 2D et 3D" ou "Modèle vide".
5. Cliquez sur "Créer le projet" pour créer votre nouveau projet Godot.
6. Une fois le projet créé, vous serez dirigé vers l'interface de Godot où vous pourrez commencer à travailler sur votre jeu ou votre application.
7. Vous devez exporter au moins une fois votre jeu pour que le pipeline de build fonctionne. Le fichier appelé "export_presets.cfg" est important, il permet d'exporter votre jeu avec les bons paramètres lors de votre build.

## 4. ⚙️ Ajout de votre CI

Pour ajouter une intégration continue à votre projet, suivez ces étapes :

1. Dans votre dépôt, créez un dossier nommé `.github` et un sous-dossier nommé `workflows`.
2. Créez un fichier pour votre pipeline CI selon vos besoins (ex: `godot-ci.yml`).

Voici un exemple de pipeline pour l'exportation en version web :

```yaml
name: Godot CI/CD Pipeline

on: [push, pull_request]

env:
  GODOT_VERSION: "4.2.1"
  GODOT_STATUS: "stable"
jobs:
  import-assets:
    runs-on: ubuntu-latest
    container: barichello/godot-ci:4.2.1
    steps:
      - uses: actions/checkout@v4
      - name: Cache import assets
        uses: actions/cache@v3
        with:
          path: .godot/imported/
          key: import-assets-${{ runner.os }}-${{ github.sha }}
      - name: Import assets
        run: godot --headless --verbose --editor --quit

  export-game:
    runs-on: ubuntu-latest
    needs: import-assets
    steps:
      - uses: actions/checkout@v4
      - uses: actions/cache@v3
        with:
          path: .godot/imported/
          key: import-assets-${{ runner.os }}-${{ github.sha }}
      - name: install wine
        run: |
          sudo apt install wine64
          echo "WINE_PATH=$(which wine64)" >> $GITHUB_ENV
      - name: Export Game using Godot
        uses: firebelley/godot-export@v5.2.1
        with:
          godot_executable_download_url: "https://github.com/godotengine/godot/releases/download/${{ env.GODOT_VERSION }}-${{ env.GODOT_STATUS }}/Godot_v${{ env.GODOT_VERSION }}-${{ env.GODOT_STATUS }}_linux.x86_64.zip"
          godot_export_templates_download_url: "https://github.com/godotengine/godot/releases/download/${{ env.GODOT_VERSION }}-${{ env.GODOT_STATUS }}/Godot_v${{ env.GODOT_VERSION }}-${{ env.GODOT_STATUS }}_export_templates.tpz"
          relative_project_path: "./godot"
          archive_output: true
          cache: false
          wine_path: ${{ env.WINE_PATH }}
      - name: Upload HTML5
        uses: actions/upload-artifact@v4
        with:
          name: HTML5
          path: /home/runner/.local/share/godot/archives/HTML5.zip

  deploy-to-itchio-web:
    runs-on: ubuntu-latest
    needs: export-game
    steps:
      - uses: actions/checkout@v4
      - uses: actions/download-artifact@v4
        with:
          name: HTML5
      - name: Deploy to Itch.io (HTML5)
        uses: manleydev/butler-publish-itchio-action@master
        env:
          BUTLER_CREDENTIALS: ${{ secrets.BUTLER_API_KEY }}
          CHANNEL: web
          ITCH_GAME: ${{ secrets.ITCHIO_GAME }}
          ITCH_USER: ${{ secrets.ITCHIO_USERNAME }}
          PACKAGE: HTML5.zip
```

## 5. 🤩 Liaison du projet itch.io à la pipeline

1. Accédez à l'URL [https://itch.io/user/settings](https://itch.io/user/settings) et trouvez la section "Developer/API Keys".
2. Générez une nouvelle clé API et copiez-la.
3. Accédez aux paramètres de votre compte GitHub.
4. Dans la section "Secrets and variables", sélectionnez "Actions".
5. Créez un nouveau secret nommé "BUTLER_API_KEY" et collez votre clé API précédemment générée.
6. Retournez sur itch.io et créez un nouveau projet.
7. Retournez sur GitHub et créez deux nouveaux secrets :
   - "ITCHIO_GAME" avec le nom de votre jeu créé sur itch.io.
   - "ITCHIO_USERNAME" avec votre pseudo sur itch.io.


Vous pouvez faire une page de teste et lancer votre premiere pipeline de buil!

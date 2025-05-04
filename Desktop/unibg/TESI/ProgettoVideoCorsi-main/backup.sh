#!/bin/bash

# Directory del progetto
PROJECT_DIR="/Users/stefanocalza/Desktop/unibg/TESI/ProgettoVideoCorsi-main"

# Messaggio di commit con timestamp
COMMIT_MESSAGE="Auto-backup $(date '+%Y-%m-%d %H:%M:%S')"

# Vai alla directory del progetto
cd "$PROJECT_DIR"

# Aggiungi tutte le modifiche
git add .

# Crea il commit
git commit -m "$COMMIT_MESSAGE"

# Push su GitHub
git push origin main

# Log dell'operazione
echo "Backup completato: $COMMIT_MESSAGE" >> backup.log 
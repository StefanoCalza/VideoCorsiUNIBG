#!/bin/bash

# Directory del progetto
PROJECT_DIR="/Users/stefanocalza/Desktop/unibg/TESI/ProgettoVideoCorsi-main"

# Funzione per sostituire i package in un file
update_file() {
    local file=$1
    echo "Aggiornamento file: $file"
    
    # Sostituisce tutti i package javax.servlet con jakarta.servlet
    sed -i '' 's/javax\.servlet/jakarta.servlet/g' "$file"
}

# Aggiorna tutti i file Java nelle directory controller, utils e test
find "$PROJECT_DIR/src/main/java/controller" "$PROJECT_DIR/src/main/java/utils" "$PROJECT_DIR/src/test/java" -name "*.java" -type f | while read -r file; do
    update_file "$file"
done

echo "Aggiornamento completato!" 
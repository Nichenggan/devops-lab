#!/bin/bash
#Script pour exécuter l'application dans un conteneur Docker (port 8080)


# Lancer le conteneur en arrière-plan et exposer le port 8080
docker run -d -p 8080:8080 --name sample-app sample-app

# Message de confirmation
echo "L'application est en cours d'exécution dans un conteneur Docker."
echo "Ouvrez votre navigateur et visitez : http://localhost:8080"

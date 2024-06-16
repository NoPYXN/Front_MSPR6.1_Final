# Utilisez une image Node.js 16 comme image de base
FROM node:16

# Installe Expo CLI globalement
RUN npm install -g expo-cli

# Installer @expo/ngrok globalement
RUN npm install -g @expo/ngrok

# Définir le répertoire de travail
WORKDIR /app

# Copier le fichier package.json et package-lock.json
COPY package*.json ./

# Installer les dépendances
RUN npm install

# Copier tout le contenu du projet dans le conteneur
COPY . .

# Exposer les ports sur lesquels l'application va tourner
EXPOSE 19000 19001 19002

# Démarrer l'application
CMD ["expo", "start", "--tunnel"]

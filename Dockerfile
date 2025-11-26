# 1) Image Java pour exécuter l'app
FROM eclipse-temurin:17-jdk-alpine

# 2) Répertoire de travail dans le conteneur
WORKDIR /app

# 3) Copier le jar généré par Maven
COPY target/*.jar app.jar

# 4) Exposer le port de Spring Boot
EXPOSE 8080

# 5) Lancer l'application
ENTRYPOINT ["java", "-jar", "app.jar"]

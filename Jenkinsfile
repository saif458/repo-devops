pipeline {
    agent any
        tools {
        jdk 'jdk17'
        maven 'maven3'
    }
    
    stages {
        stage('Checkout Code') {
            steps {
               git branch: 'main', url: 'https://github.com/saif458/repo-devops.git'
            }
        }
        
         stage('Build Application') {
            steps {
            
                sh 'mvn clean package -DskipTests'
            }
        }

         stage('Build Docker Image') {
            steps {
                sh 'docker build -t saif4584851/my-spring-app:1.0 .'
            }
        }



       stage('Push to Docker Hub') {
            steps {
                // Using the credentials 'dockerhub-token' set in Jenkins
                withCredentials([string(credentialsId: 'Dockerhub-token', variable: 'TOKEN')]) {
                    // Login to Docker Hub using the token
                    sh 'echo $TOKEN | docker login -u saif4584851 --password-stdin'
                    // Push the built Docker image to Docker Hub
                    sh 'docker push saif4584851/my-spring-app:1.0'
                }
            }
        }
        
        stage('Save Results') {
            steps {
               
                archiveArtifacts artifacts: 'target/*.jar', followSymlinks: false
                
           
                echo ' Build terminé avec succès!'
            }
        }
    }
}



























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
                sh 'docker build -t saif458/my-spring-app:1.0 .'
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























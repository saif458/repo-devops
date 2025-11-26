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



        stage('Push to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'ddde5624-1688-4cac-b0ea-9a68315efe88', variable: 'TOKEN')]) {
    sh 'echo $TOKEN | docker login -u saif458 --password-stdin'
    sh 'docker push saif458/my-spring-app:1.0'
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

























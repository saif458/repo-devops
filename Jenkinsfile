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
            
                sh 'mvn clean package'
             


            }
        }

stage('SonarQube Analysis') {
            steps {
                withCredentials([string(credentialsId: 'sonarqube-token', variable: 'SONAR_TOKEN')]) {
                    sh '''
                        mvn sonar:sonar \
                        -Dsonar.projectKey=student-management \
                        -Dsonar.host.url=http://localhost:9000 \
                        -Dsonar.login=$SONAR_TOKEN
                    '''
                }
            }
        }



        

         stage('Build Docker Image') {
            steps {
                sh 'docker build -t saif4584851/my-spring-app:1.0 .'
            }
        }



       stage('Push to Docker Hub') {
    steps {
        withCredentials([string(credentialsId: 'dockerhub-token', variable: 'TOKEN')]) {
            sh '''
                echo "$TOKEN" | docker login --username saif4584851 --password-stdin
                docker push saif4584851/my-spring-app:1.0
            '''
        }
    }
}


        
        
    }
}























































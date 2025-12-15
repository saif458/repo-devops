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




         stage('Deploy to Kubernetes') {
            steps {
                sh '''
                    # 1. Mettre à jour l'image Docker dans le fichier YAML
                    sed -i 's|image: .*|image: saif4584851/my-spring-app:1.0|' spring-deployment.yaml
                    
                    # 2. Déployer sur Kubernetes
                    kubectl apply -f mysql-pv-pvc.yaml -n devops
                    kubectl apply -f mysql-deployment.yaml -n devops
                    kubectl apply -f spring-config-secret.yaml -n devops
                    kubectl apply -f spring-deployment.yaml -n devops
                    
                    # 3. Vérifier le déploiement
                    echo "Déploiement terminé !"
                '''
            }
        }
        
        


        
        
    }
}


























































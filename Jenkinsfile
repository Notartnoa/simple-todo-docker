pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'simple-todo-app'
        CONTAINER_NAME = 'simple-todo-app'
    }
    
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', 
                    url: 'https://github.com/USERNAME/REPO-NAME.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    bat 'docker build -t %DOCKER_IMAGE% .'
                }
            }
        }
        
        stage('Stop Old Container') {
            steps {
                script {
                    bat '''
                        docker stop %CONTAINER_NAME% || echo "No container to stop"
                        docker rm %CONTAINER_NAME% || echo "No container to remove"
                    '''
                }
            }
        }
        
        stage('Run New Container') {
            steps {
                script {
                    bat 'docker run -d -p 8081:80 --name %CONTAINER_NAME% %DOCKER_IMAGE%'
                }
            }
        }
    }
    
    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
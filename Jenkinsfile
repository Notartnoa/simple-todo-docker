pipeline {
    agent any
    
    environment {
        DOCKERHUB_USERNAME = 'kharis pradana'
        IMAGE_NAME = 'simple-todo-app'
        IMAGE_TAG = 'latest'
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
    }
    
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t %DOCKERHUB_USERNAME%/%IMAGE_NAME%:%IMAGE_TAG% ."
                }
            }
        }
        
        stage('Login to Docker Hub') {
            steps {
                script {
                    bat "docker login -u %DOCKERHUB_USERNAME% -p %DOCKERHUB_CREDENTIALS_PSW%"
                }
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                script {
                    bat "docker push %DOCKERHUB_USERNAME%/%IMAGE_NAME%:%IMAGE_TAG%"
                }
            }
        }
        
        stage('Cleanup') {
            steps {
                script {
                    bat "docker logout"
                }
            }
        }
    }
    
    post {
        success {
            echo 'Image successfully pushed to Docker Hub!'
        }
        failure {
            echo 'Build or push failed!'
        }
    }
}
pipeline {
    agent any

    stages {
        stage('Clone Code') {
            steps {
                git branch: 'main', url: 'https://github.com/faizan2245/weatherapp-django.git'
            }
        }
        stage('Build Image') {
            steps {
                sh "docker build -t weather ." 
            }
        }
        stage('Deploy Code') {
            steps {
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}

pipeline {
    agent any
    stages {
        stage('Version') {  // Tools Version Check
            steps {  
              sh 'java --version'
              sh 'mvn --version'
              sh 'docker --version'
              sh 'ansible --version'
              sh 'terraform version'
            }
        }
        stage('Packaging') {   // Packaging the Project
            steps {  
              sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {   // Building Docker Image
            steps {  
              sh 'sudo docker build -t minimalkushal/medicure .'
            }
        }
    }
}

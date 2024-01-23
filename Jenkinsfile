pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                // Checkout the code from your version control system (e.g., Git)
                checkout scm
                
                // Build your Java program (replace 'mvn clean install' with your build command)
                sh 'mvn clean install'
            }
        }
        
        stage('Deploy to DEV') {
            when {
                branch 'dev'
            }
            steps {
                // Deploy to DEV environment
                sh './deploy_script.sh dev'
            }
        }
        
        stage('Deploy to UAT') {
            when {
                branch 'uat'
            }
            steps {
                // Deploy to UAT environment
                sh './deploy_script.sh uat'
            }
        }
        
        stage('Deploy to PROD') {
            when {
                branch 'master'
            }
            steps {
                // Deploy to PROD environment
                sh './deploy_script.sh prod'
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

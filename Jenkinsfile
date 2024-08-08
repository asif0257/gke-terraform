pipeline {
    agent any
 
    environment {
        GIT_TOKEN = credentials('git-token')
        TF_VAR_project = 'asif-praveen-gke'
        
    }
 
    stages {
        stage('Git Checkout') {
            steps {
               git credentialsId: 'git-token', url: 'https://github.com/asif0257/gke-terraform.git'
            }
        }
        
        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }
        
        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

     stage('Manual Approval') {
            steps {
                input "Approve?"
            }
        }
     
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply tfplan'
                }
            }
        }
    }
}
pipeline {
    agent any
 
    // environment {
    //     // GIT_TOKEN = credentials('git-token')
    //     TF_VAR_project = 'asif-praveen-gke'
        
    // }

    // parameters {
    //     string(name: 'GIT_BRANCH', defaultValue: 'main', description: 'Branch to build')
    // }
 
    stages {
        stage('Git Checkout') {
            steps {
               git branch: 'main' , credentialsId: 'git-token', url: 'https://github.com/asif0257/gke-terraform.git'
            }
        }
        
        stage('Terraform Init') {
            steps {
                script {
                    sh 'pwd'
                    sh 'ls -al'
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

    //  stage('Manual Approval') {
    //         steps {
    //             input "Approve?"
    //         }
    //     }
     
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }
}

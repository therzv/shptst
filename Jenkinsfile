pipeline {
    agent any
    environment {
        CI = 'true'
    }

  stages {

 
            stage('Unit Test') {
                  steps{
                     sh '''
                        echo "Running Unit Test"
                     '''
                   }
               }


            stage('Static Analysis') {
                  steps{
                     sh '''
                        echo "SonarQube Code Static Analysis"
                     '''
                   }
               }



            stage('Build and Deploy Branch Development') {

                       environment {
                               MESSAGE = "PLEASE DONT CHANGE ANYTHING IF YOU DONT UNDERSTAND"
                       }

                       steps {

                           sh '''#!/bin/bash

                           echo $GIT_BRANCH
                           if [ $GIT_BRANCH == "origin/development" ]; then

                           echo "this is branch develop"


                           fi 
                           '''
                           cleanWs ()

                         }

                    }


            stage('Build and Deploy Branch Staging') {

                       environment {
                               MESSAGE = "PLEASE DONT CHANGE ANYTHING IF YOU DONT UNDERSTAND"
                       }

                       steps {

                           sh '''#!/bin/bash

                           echo $GIT_BRANCH
                           if [ $GIT_BRANCH == "origin/staging" ]; then

                              HELM_CHART_DIR=/opt/helm-chart
                              HELM_BRANCH=dev
                              HELM_NAMESPACE=dev
                              CLUSTER_CONTEXT=kubernetes-admin@vaf-development-cluster.local

                              echo "this is branch staging"


                           fi 
                           '''
                           cleanWs ()

                         }

                    }



            stage('Build and Deploy Branch Main') {

                       environment {
                               MESSAGE = "PLEASE DONT CHANGE ANYTHING IF YOU DONT UNDERSTAND"
                       }

                       steps {

                           sh '''#!/bin/bash

                           echo $GIT_BRANCH
                           if [ $GIT_BRANCH == "origin/main" ]; then


                              echo "this is branch production, should be deployed on jenkins slave PROD label"


                           fi 
                           '''
                           cleanWs ()

                         }

                    }

            }


    post {

        success {
            slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }

        unstable {
            echo 'I am unstable :('
            
        }
  
        failure {
            slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
     
        }

    }

}

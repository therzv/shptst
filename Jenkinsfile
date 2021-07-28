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



            stage('Build and Deploy') {


                       steps {

                           sh '''#!/bin/bash
                           echo $GIT_BRANCH
                           if [ $GIT_BRANCH == "origin/main" ]; then

                           COMMITHASH=$(git rev-parse --short HEAD)
                           echo "main"
                           sed -i "s/GANTI_INI/$COMMITHASH/g" namafile.yaml


                           elif [ $GIT_BRANCH == "origin/staging" ]; then
                           echo "staging"


                           elif [ $GIT_BRANCH == "origin/master" ]; then
                           echo "master"
                              
                           fi
                           '''

                       }
                 }

            }
    post {
        always {
            sh 'echo "Post build stage"'  
        }
        success {
            echo 'I succeeded!'
        }
        unstable {
            echo 'I am unstable :('
        }
        failure {
            echo 'I failed :(('
        }
    }
}

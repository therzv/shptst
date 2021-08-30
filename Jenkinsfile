pipeline {
    agent any
    environment {
        CI = 'true'
    }

  stages {

           stage ('Start') {
                 steps {
                    slackSend (color: '#FFFF00', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL}) Comitted by: ${env.GIT_COMMITTER_NAME} Commit Hash : ${env.GIT_COMMIT}")

                  }
              } 

 
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


                       when {
                         expression {
                           return env.GIT_BRANCH == "origin/development"
                         }
                       } 

                       environment {
                               MESSAGE = "PLEASE DONT CHANGE ANYTHING IF YOU DONT UNDERSTAND"
                       }

                       steps {

                           sh '''
                           echo "this is branch develop"
                           '''
                           cleanWs ()

                         }

                    }


            stage('Build and Deploy Branch Staging') {

                       when {
                         expression {
                           return env.GIT_BRANCH == "origin/staging"
                         }
                       } 

                       environment {
                               MESSAGE = "PLEASE DONT CHANGE ANYTHING IF YOU DONT UNDERSTAND"
                       }

                       steps {

                           sh '''

                              echo "this is branch staging"
                           fi 
                           '''
                           cleanWs ()

                         }

                    }



            stage('Build and Deploy Branch Main') {


                      agent {
                          label "k8sprod"
                      }

                       when {
                         expression {
                           return env.GIT_BRANCH == "origin/main"
                         }
                       } 

                       environment {
                               MESSAGE = "PLEASE DONT CHANGE ANYTHING IF YOU DONT UNDERSTAND"
                       }

                       steps {

                           sh '''

                              echo "this is branch production, should be build on slave production"
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


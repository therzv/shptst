pipeline {
    agent any
    environment {
        CI = 'true'
        SVC = 'client-area-api'
    }

   stages {

            stage('Unit Test') {
                  steps{
                     sh '''
                        echo "Running Unit Test"
                        echo $GIT_BRANCH
                     '''
                   }
               }


            stage('Static Analysis') {
                  steps{
                     sh '''
                        echo "SonarQube Code Static Analysis"
                        echo $GIT_BRANCH
                     '''
                   }
               }



            
            stage('Build and Deploy Branch Develop') {
                    
                     when {
                           branch "origin/main"
                       }

                       steps {

                           
                           sh '''
                           echo "main"
                           sed -i "s/GANTI_INI/jelek/g" abc.txt 
                           '''

                       }
                 }
                
            stage('Build and Deploy Branch Staging') {
                    
                     when {
                           branch "origin/staging"
                       }

                       steps {

                           
                           sh '''
                           echo "staging"
                           
                           '''
                       }
                 } 
            
            stage('Build and Deploy Branch Master') {
                    
                     when {
                           branch "origin/develop"
                       }


                       steps {

                           
                           sh '''
                           echo "Docker Develop"
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

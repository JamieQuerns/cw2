pipeline {
   agent any

   stages {
      stage('Get files from Github') {
         steps {
            //Get code from the right branch of the repository
            git branch: 'myBranch', url: 'https://github.com/jamiequerns/cw2/'
             
         }
      }
          
     stage('SonarQube') 
     {
        environment {
            scannerHome = tool 'SonarQube'
        }
        steps 
        {
            
            withSonarQubeEnv('SonarQube') {
                sh "${scannerHome}/bin/sonar-scanner"
            }
        }
    }
   }
}

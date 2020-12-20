pipeline {
   agent any
 
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

   stage("Stage 5 Deploying new image to Kubernetes") 
        {
                steps
                {
                    sh 'ssh ubuntu@3.236.211.229 kubectl rollout restart deployment/dev-ops-node-js'
                }
        }
   
   


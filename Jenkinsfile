pipeline {
    agent any 
    stages {
       
        stage('Stage 1') {
            steps {
             sh 'ssh -o StrictHostKeyChecking=no ubuntu@ec2-3-236-211-229.compute-1.amazonaws.com kubectl rollout restart deployment/cw2'
            }
          }
            
    }
}
   
   


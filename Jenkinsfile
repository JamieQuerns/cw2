node {
    def app

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        app = docker.build("jamiequerns/node_app")
    }


    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
         app.push("${env.BUILD_NUMBER}") //incremental build number from Jenkins
         app.push("latest") //latest tag
        }
    }

}



pipeline {
    agent any 
    stages {
        stage('Deploy passed build to Kubernetes') {
            steps {
             sh 'ssh -o StrictHostKeyChecking=no ubuntu@ec2-3-236-211-229.compute-1.amazonaws.com kubectl rollout restart deployment/cw2'
            }
          }
            
    }
}
   
   



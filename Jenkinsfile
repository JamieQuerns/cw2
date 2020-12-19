node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our 
	workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("jamiequerns/cw2:${env.BUILD_ID}")
    }


    stage('Push image') {
        /* Finally, we'll push the image with two tags
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}") //incremental build number from Jenkins
            app.push("latest") //latest tag
        }
    }
}

stage("Deploy new image to Kubernetes") 
        {
                steps
                {
                    sh 'ssh ec2-3-236-211-229.compute-1.amazonaws.com kubectl rollout restart deployment/cw2'
                }
        }

pipeline 
{
    environment
	{
		registry = "jamiequerns/cw2"
	}
	agent any

	
    stages
	{
		stage('Stage 1 Checkout SCM')
		{
				
			steps
			{
				checkout([$class: 'GitSCM',
				branches: [[name: '*/main']],
				doGenerateSubmoduleConfigurations: false,
				extensions: [], 
				submoduleCfg: [], 
				userRemoteConfigs: [[url: 'https://github.com/adamdon/DevOpsNodeJs']]])            
			}
		}
		
		stage('Stage 2 Build Docker Image') 
		{
						
			steps
			{
				echo "Building Docker Image..."
				script 
				{
					app = docker.build("jamiequerns/node_app")
				}
			}
		       			
    		}
		
		
		
		stage('Stage 3 Push Docker Image')
		{
            		steps 
			{
				echo 'Pushing Image to Docker...'
				script 
				{
					docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials')
					{
						app.push("${env.BUILD_NUMBER}")
						app.push("latest")
					}
				}
			}
		}		
		
		
		stage("Stage 4 Deploying new image to Kubernetes") 
		{
				steps
				{
					sh 'ssh ubuntu@ec2-52-201-24-236.compute-1.amazonaws.com kubectl rollout restart deployment/nodeapp'
				}
		}
		
	
			
	}
}

   
   



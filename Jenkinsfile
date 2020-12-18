pipeline { agent any environment { registry = 
    "jamiequerns/coursework2" registryCredential = 
    'dockerhub'
  }
    stages {
	
	stage('Cloning Git') { steps { git 
    'https://github.com/JamieQuerns/cw2.git'
  }
}
        stage('Build') { steps { script { dockerImage = 
         docker.build registry + ":$BUILD_NUMBER"
        }
            }
        }
		
		stage('Deploy Image') { steps{ script { 
      docker.withRegistry( '', registryCredential ) {
        dockerImage.push()
      }
    }
  }
}
		
        stage('Sonarqube') { environment { scannerHome = 
        tool 'SonarQubeScanner'
    }
    steps { withSonarQubeEnv('sonarqube') { sh 
            "${scannerHome}/bin/sonar-scanner 
            -Dsonar.projectKey=sonar-js 
            -Dsonar.sources=."
        }
    }
}
	stage('update application'){
		
		steps{ sleep (10) sh 'ssh 
		azureuser@35.172.146.252 kubectl set 
		image deployments/cw2 
		cw2=jamiequerns/cw2:$BUILD_NUMBER'
		
		}
}
    }
}

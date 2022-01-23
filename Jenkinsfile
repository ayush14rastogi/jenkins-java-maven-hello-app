def gv
pipeline {
    agent any
    tools { 
	    maven 'Maven'
	}
    stages {
		// initializing the groovy script
		stage("init"){
				steps {
					script {
					gv = load "script.groovy"
						}
					// maven things
					echo "PATH = ${PATH}"
					echo "M2_HOME = ${M2_HOME}"
				   	}
				}
		// build stages
		stage('Build Jar') {
				steps {
					// calling the groovy buildApp function
					script {
						gv.buildApp()
						sh 'mvn package'
						}
					}
				}
	    	//Deploy stage
	    	stage('Deploy') {
 
				steps {
					// calling the groovy DeployApp function
					script {
						gv.deployApp()
						withCredentials([usernamePassword(credentialsId: 'docker-hub-repo', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) 
							{
								sh 'docker build -t ayush14rastogi/demo-app:jma-1.0 .'
								sh "echo $PASS |docker login -u $USER --password-stdin"
								sh "docker push ayush14rastogi/demo-app:jma-1.0"
							}
									
					}
				}
			}
	}
}
	
	

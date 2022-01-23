def gv
pipeline {
    agent any
    environment {
        NEW_VERSION = 'Ayush'
	SERVER_CREDENTIALS = credentials('ansbile-target-1')
    }
    parameters { 
	    	//string(name: 'DEPLOY_ENV', defaultValue: 'staging', description: '')
                 booleanParam(name: 'executeTests', defaultValue: true, description: '')
                 choice(name: 'VERSION', choices: ['one', 'two', 'three'], description: '')

          }

    stages {
		// initializing the groovy script
		stage("init"){
				steps {
					script {
					gv = load "script.groovy"
						}
				   	}
				}
		// build stages
		stage('Build') {
				steps {
					// calling the groovy buildApp function
					script {
						gv.buildApp()
						}
					}
				}

		// Test stage
	    	stage('Test') {
				when {
					expression {
						params.executeTests
						}
					}
				steps {
					// calling the groovy TestApp function
					script {
						gv.testApp()
						}            
									
					}
				}
	    	//Deploy stage
	    	stage('Deploy') {
				input {
					message "Select the enviorment to deploy to "
					ok "done"
					parameters {
						choice(name: 'ONE', choices: ['dev','stagging', 'Prod' ], description: '')
						//choice(name: 'TWO', choices: ['dev','stagging', 'Prod' ], description: '')
						}
					} 
				steps {
					// calling the groovy DeployApp function
					script {
						gv.deployApp()
						//echo "Deploying to ${ONE}"
						//echo "Deploying to ${TWO}"
						withCredentials([usernamePassword(credentialsId: 'ansbile-target-1', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) 
							{
							//	sh "echo ${PASSWORD}"
							  // also available as a Groovy variable
							  echo USERNAME
							  // or inside double quotes for string interpolation
							  echo "username is $USERNAME"
							}
									
					}
				}
			}
	}
}
	

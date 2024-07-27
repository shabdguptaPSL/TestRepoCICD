pipeline {
    agent any
    
    parameters {
        string(name: 'PROJECT_NAME', defaultValue: '', description: 'Name of the Project')
        string(name: 'ASSET_TYPE', defaultValue: '', description: 'Type of the Asset')
        string(name: 'ASSET_NAME', defaultValue: '', description: 'Name of the Asset')
		choice(name: 'Source Environment', choices: ['DEV', 'SIT', 'QA'], description: 'Choose the Source Environment')
    choice(name: 'Target Environment', choices: ['DEV', 'SIT', 'QA'], description: 'Choose the Target Environment')
    }



	 
	 stages {
		
		stage('Get Properties') {
			steps {
				script {			

				try{
                // Load properties from a properties file
                //def props = readProperties file: 'DevOps/Jenkins/properties/jenkins.properties'
                
                            
                //def getProductPropertiesScript = load 'DevOps/Jenkins/properties/getImageProperties'
                //def productProperties = getProductPropertiesScript.getProductProperties(env.PRODUCT, env.ENVIRONMENT)

                //OC_URL = "${props['OC_URL']}"
                //OC_TOKEN = productProperties.OC_TOKEN

                
                
                //println("Environment Namespace : ${ENVIRONMENT_NAMESPACE}")
                
                
				}
				catch (Exception e) {
						currentBuild.result = 'FAILURE'
						throw e
					}
				
				}
			}
		}
		
		stage('Checkout') {
            steps {
                script {
                    def gitUrl = scm.getUserRemoteConfigs()[0].getUrl()
                    def gitBranch = scm.getBranches()[0].getName()
                    echo "Checking out ${gitUrl} at branch ${gitBranch}"
                    checkout([$class: 'GitSCM', branches: [[name: gitBranch]], userRemoteConfigs: [[url: gitUrl]]])
                }
            }
		}

        stage('Run Script') {
            steps {
                script {
                    //def scriptFolder = "${params.PROJECT_NAME}/${params.ASSET_TYPE}/${params.ASSET_NAME}"
					def scriptFolder = "DevOps/Jenkins/scripts"
                    echo "Running script in folder: ${scriptFolder}"
                    dir(scriptFolder) {
						sh 'chmod +x initializeExport.sh'
						sh 'initializeExport.sh ${gitBranch} ${params.PROJECT_NAME} ${params.ASSET_TYPE} ${params.ASSET_NAME}'
                        //sh 'chmod +x script.sh' // Make the script executable
                        //sh './script.sh' // Run the script
                    }
                }
            }
        }
		 
					
		
	 }

post {
        always {
            echo 'Pipeline execution complete.'
        }
    }

}

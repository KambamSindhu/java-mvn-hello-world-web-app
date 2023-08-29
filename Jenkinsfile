pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "Maven3"
    }
stages {
        stage('Git Checkout') {
            steps {
                git 'https://github.com/KambamSindhu/java-mvn-hello-world-web-app.git'
            }
        }

        
        stage('Build') {
            steps {
                sh "mvn  clean install test "
            }
            

            post {
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                }
            }
        }
     stage ('Build docker image') {
            steps {
                script {
                    sh"docker build -t hello-world-web-app ."
                    
                }
            }
        }
  stage('Stop and Remove Container') {
            steps {
                script {
                    def containerName = 'hellodev'
                    def runningContainer = sh(script: "docker ps -q -f name=${containerName}", returnStatus: true)

                    if (runningContainer == 0) {
                        echo "Container is not running."
                    } else {
                        echo "Stopping and removing the container..."
                        sh "docker stop ${containerName}"
                        sh "docker rm ${containerName}"
                        echo "Container stopped and removed."
                    }
                }
            }
        }
    
        
    }
}

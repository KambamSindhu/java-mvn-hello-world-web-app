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
     stage('Stop and remove container') {
            steps {
               script {
                  
                        sh "docker stop hello-world-web-app"
                        sh "docker rm  hello-world-web-app"
                    
                }
            }
        }

        
    }
}

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
        
    }
}

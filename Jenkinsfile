pipeline {
    agent { node { label 'AGENT-1' } }
    environment{
        // here if you create any variable you will have global access, since it is env so no neeed of def
        packageVersion = ''
    }
    stages {
        stage('Deploy') {
            steps {
                echo "Deploying ..."
            }
        }
    }

    post{
        always{
            echo 'cleaning up workspace'
            deleteDir()
        }
    }
}
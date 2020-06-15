#!groovy

currentBuild.displayName = "Packer-Build # "+currentBuild.number

   def getDockerTag(){
        def tag = sh script: 'git rev-parse HEAD', returnStdout: true
        return tag
        }

pipeline {
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
    disableConcurrentBuilds()
    ansiColor('xterm')
    timestamps()
    timeout(time: 10) 
  }
  agent any
    parameters {
        string(defaultValue: "Custom-slave-AMI", description: 'What AMI name you wish to keep?', name: 'AMI_NAME')
        choice(choices: ['ap-southeast-1', 'us-west-2'], description: 'What AWS region?', name: 'REGION')
        string(defaultValue: "Custom AMI for jenkins slave", description: 'Please put some description about this AMI?', name: 'DESCRIPTION')
    }
  stages {
    stage('Building Custom AMI') {
      steps {
        script {
          sh '''
            SBI/build.sh
          '''
        }
      }
    }
   }
  post
    {
        always {
        script {
        currentBuild.result = currentBuild.currentResult
      }
        }
        success {
            deleteDir()
            mail to: 'subham.rhce@gmail.com',
                subject: "Success: ${currentBuild.fullDisplayName}",
                body: "Successfully built ${env.BUILD_URL}"
        }
        failure {
            mail to: 'subham.rhce@gmail.com',
                subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
                body: "Something is wrong with ${env.BUILD_URL}; Please check the logs"
        }
        unstable {
            mail to: 'subham.rhce@gmail.com.com',
                subject: "Unstable Pipeline: ${currentBuild.fullDisplayName}",
                body: "Build is not stable; Please check the logs ${env.BUILD_URL}"
        }
    }
}
 }

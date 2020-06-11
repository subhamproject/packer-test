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
 }

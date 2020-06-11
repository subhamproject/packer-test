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
    timeout(time: 10) // would lead to a timeout of 10 minutes (MINUTES is default value)
  }
  agent any
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

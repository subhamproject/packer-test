#!groovy

pipeline {
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
    disableConcurrentBuilds()
    ansiColor('xterm')
    timestamps()
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

#!groovy

pipeline {
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
    disableConcurrentBuilds()
   ansiColor('xterm')
  }
  agent any
  stages {
    stage('Building Custom AMI) {
      steps {
        script {
          sh '''
            build.sh
          '''
        }
      }
    }

pipeline {
  agent {
    docker {
      image 'node:lts-alpine3.13'
      args '-p 3000:3000'
    }
  }
  environment {
    CI = 'true'
  }
  stages {
    stage('Build') {
      steps {
        sh 'npm install'
      }
    }
    stage('Test') {
      steps {
        sh 'npm run test:cov'
      }
    }
  }
}
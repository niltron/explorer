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
    stage('Install') {
      steps {
        sh 'npm install'
      }
    }
    stage('Build') {
      steps {
        sh 'npm run build'
      }
    }
    stage('Test') {
      steps {
        sh 'npm run test:cov'
      }
    }
  }
  post {
    always {
      archiveArtifacts artifacts: 'build/*', fingerprint: true
      junit 'coverage/clover.xml'
    }
  }
}
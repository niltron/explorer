pipeline {
  agent {
    docker {
      image 'node:lts-alpine3.13'
      args '-p 3001:3001'
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
      post {
        always {
          archiveArtifacts artifacts: 'build/*', fingerprint: true
        }
      }
    }
    stage('Test') {
      steps {
        sh 'npm run test:cov'
      }
      post {
        always {
          publishHTML target: [
            allowMissing         : false,
            alwaysLinkToLastBuild: false,
            keepAll              : true,
            reportDir            : 'coverage',
            reportFiles          : 'index.html',
            reportName           : 'Coverage Report'
          ]
        }
      }
    }
  }
}
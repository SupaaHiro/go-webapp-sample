pipeline {
  agent any

  tools {
    go 'go-1.22'
  }

  environment {
    GO111MODULE='on'
  }

  stages {
    stage('Test') {
      steps {
        git 'https://github.com/SupaaHiro/go-webapp-sample.git'
        sh 'go test ./...'
      }
    }
  }
}
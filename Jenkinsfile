pipeline {
  agent any

  tools {
    go 'go-1.22.2'
  }

  environment {
    GO111MODULE='on'
  }

  stages {
    stage('Development') {
      steps {
        git 'https://github.com/SupaaHiro/go-webapp-sample.git'
        sh 'go test ./...'
      }
    }
  }
}
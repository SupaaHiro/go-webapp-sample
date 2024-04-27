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
        git branch: 'main', url: 'https://github.com/SupaaHiro/go-webapp-sample.git'
        sh 'go test ./...'
      }
    }
  }
}
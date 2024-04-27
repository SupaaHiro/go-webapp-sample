pipeline {
  agent any

  tools {
    go 'go-1.22.2'
  }

  environment {
    GO111MODULE='on'
    GH_PAT = credentials('ci-bot')
  }

  stages {
    stage('Development') {
      steps {
        git branch: 'main', url: 'https://github.com/SupaaHiro/go-webapp-sample.git', credentialsId: 'GH_PAT'
        sh 'go test ./...'
        echo sh(returnStdout: true, script: 'env')
      }
    }
  }
}
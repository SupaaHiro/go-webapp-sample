pipeline {
  agent any

  tools {
    go 'go-1.22.2'
  }

  environment {
    GO111MODULE='on'
    TEST_A_SECRET = credentials('test')
  }

  stages {
    stage('Development') {
      steps {
        git branch: 'main', url: 'https://github.com/SupaaHiro/go-webapp-sample.git', credentialsId: 'ci-bot'
        sh 'go test ./...'
        echo sh(returnStdout: true, script: 'env')
      }
    }
  }
}
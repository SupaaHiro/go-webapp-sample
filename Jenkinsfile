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
        git branch: 'main', credentialsId: 'ci-bot', url: 'https://github.com/SupaaHiro/go-webapp-sample.git'
        sh 'go test ./...'
        echo sh(returnStdout: true, script: 'env')
      }
    }

    stage('Build image') {
      steps {
        script {
          app = docker.build('supaahiro/go-webapp-sample')
        }        
      }
    }
  }
}
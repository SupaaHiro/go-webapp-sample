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
    stage('Run tests') {
      steps {
        git branch: 'main', credentialsId: 'ci-bot', url: 'https://github.com/SupaaHiro/go-webapp-sample.git'
        sh 'go test ./...'
      }
    }

    stage('Build image') {
      app = docker.build('supaahiro/go-webapp-sample')
    }
    
    stage('Push image') {
      docker.withRegistry('https://docker.io', 'docker-pat') {
       app.push('${env.BUILD_NUMBER}')
       app.push('latest')       
      }
    }
  }
}
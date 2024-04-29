pipeline {
  /* agent any */
  agent { label 'docker' }
  
  tools {
    go 'go-1.22.2'
  }
  
  environment {
    GO111MODULE='on'
    GH_PAT = credentials('ci-bot')
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', credentialsId: 'ci-bot', url: 'https://github.com/SupaaHiro/go-webapp-sample.git'
      }
    }

    stage('Run tests') {
      steps {
        sh 'go test ./...'
      }
    }

    stage('Build image') {
      steps {
        script {
          dockerImage = docker.build('supaahiro/go-webapp-sample')
        }
      }
    }
    
    stage('Push image') {
      environment {
        registryUrl = 'https://registry.hub.docker.com'
        registryCredential = 'docker-pat'
      }
      steps {
        script {
          docker.withRegistry(registryUrl, registryCredential) {
            dockerImage.push('latest')       
          }
        }
      }
    }
  }
}
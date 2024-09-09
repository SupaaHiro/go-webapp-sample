pipeline {
  /* agent any */
  agent { label 'docker' }
  
  tools {
    go 'go-1.23.0'
  }
  
  environment {
    GO111MODULE='on'
    GH_PAT = credentials('ci-bot')
  }

  stages {
    stage('Checkout') {
      steps {
        echo "Running ${env.BUILD_ID} on ${env.NODE_NAME}"
        git branch: 'main', credentialsId: 'ci-bot', url: 'https://github.com/SupaaHiro/go-webapp-sample.git'        
        sh 'go mod tidy'
      }
    }

    stage('Test') {
      steps {
        sh 'go test ./...'
      }
    }

    stage('Build') {
      steps {
        sh 'go build .'
      }
    }

    stage('Run') {
      steps {
        sh "cd /var/lib/jenkins/workspace/${env.JOB_BASE_NAME} && go-webapp-sample &"
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
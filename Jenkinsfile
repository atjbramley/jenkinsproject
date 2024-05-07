pipeline {
  agent any

  environment {
    DOCKER_CREDS = credentials('credentials-id')
    DOCKER_PAT = credentials('docker-pat')
  }

  stages {
    stage('Docker build') {
      steps {
        sh 'docker build -t atjb/jenkinsproject .'
      }
    }

    stage('Docker login') {
      steps {
        sh 'echo $DOCKER_PAT | docker login --username=atjb --password-stdin'
      }
    }

    stage('Docker push') {
      steps {
        sh 'docker push atjb/jenkinsproject'
      }
    }
  }
  post {
    always {
      mail to: 'atjbramley@hotmail.com',
      subject: 'Completed Pipeline: jenkinsproject',
      body: 'Your build has run!  Please check Jenkins'
    }
  }
}

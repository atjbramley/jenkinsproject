pipeline {
  agent any
  stages {
    stage('Docker build') {
      steps {
        sh 'docker build -t atjb/jenkinsproject .'
      }
    }

    stage('Docker login') {
      steps {
        withCredentials([string(credentialsId: 'docker-access-token', variable: 'DOCKER_ACCESS_TOKEN')]) {
          withEnv(["DOCKER_PASSWORD=${DOCKER_ACCESS_TOKEN}"]) {
            sh 'docker login --username=atjb --password-stdin <<< "$DOCKER_PASSWORD"'
          }
        }
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

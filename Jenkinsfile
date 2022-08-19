pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh "chmod +x scripts/build.sh"
      }
    }

    stage('Unit tests') {
      steps {
        sh "chmod +x scripts/unit_tests.sh"
      }
    }

    stage('Deloy') {
      steps {
        sh "chmod +x scripts/deploy_website.sh"
      }
    }
  }
}

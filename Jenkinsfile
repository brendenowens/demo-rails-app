pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh "$(aws ecr get-login --no-include-email --region us-east-1)"
                sh "docker build --force-rm -t codebuild-rails-app:${env.GIT_COMMIT} ."
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh "docker run --rm codebuild-rails-app:${env.GIT_COMMIT} bundle exec rspec"
            }
        }
        stage('ECR Deploy') {
            steps {
                echo 'ECR Image Deploying....'
                sh "docker tag codebuild-rails-app:${env.GIT_COMMIT} 209773529123.dkr.ecr.us-east-1.amazonaws.com/codebuild-rails-app:${env.GIT_COMMIT}"
                sh "docker tag codebuild-rails-app:${env.GIT_COMMIT} 209773529123.dkr.ecr.us-east-1.amazonaws.com/codebuild-rails-app:latest"
                sh "docker push 209773529123.dkr.ecr.us-east-1.amazonaws.com/codebuild-rails-app:latest && docker push 209773529123.dkr.ecr.us-east-1.amazonaws.com/codebuild-rails-app:${env.GIT_COMMIT}"
                sh "docker rmi codebuild-rails-app:${env.GIT_COMMIT}"
            }
        }
        stage('ECS Deployment') {
            steps {
                echo 'ECS Deployment....'
                build job: 'ECS Task Creation', parameters: [[$class: 'StringParameterValue', name: 'BUILD_NUMBER', value: "${env.GIT_COMMIT}"],[$class: 'StringParameterValue', name: 'FAMILY', value: 'bowens3-codebuild-rails-app'],[$class: 'StringParameterValue', name: 'CONTAINER_NAME', value: 'batman-villains'],[$class: 'StringParameterValue', name: 'HOST_PORT', value: '3000'],[$class: 'StringParameterValue', name: 'CONTAINER_PORT', value: '3000'],[$class: 'StringParameterValue', name: 'ENVIRONMENT', value: 'dev'],[$class: 'StringParameterValue', name: 'SERVICE_NAME', value: 'bowens3-rails-service'],[$class: 'StringParameterValue', name: 'CLUSTER', value: 'bowens3-demo']  ]
            }
        }
    }
}
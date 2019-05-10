pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh "aws ecr get-login --no-include-email --region us-east-1"
                sh "docker build --force-rm -t codebuild-rails-app:${env.GIT_COMMIT} ."
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh "docker run --rm codebuild-rails-app:${env.GIT_COMMIT} bundle exec rspec"
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh "docker tag codebuild-rails-app:${env.GIT_COMMIT} 209773529123.dkr.ecr.us-east-1.amazonaws.com/codebuild-rails-app:${env.GIT_COMMIT}"
                sh "docker tag codebuild-rails-app:${env.GIT_COMMIT} 209773529123.dkr.ecr.us-east-1.amazonaws.com/codebuild-rails-app:latest"
                sh "docker push 209773529123.dkr.ecr.us-east-1.amazonaws.com/codebuild-rails-app:latest && docker push 209773529123.dkr.ecr.us-east-1.amazonaws.com/codebuild-rails-app:${env.GIT_COMMIT}"
                sh "docker rmi codebuild-rails-app:${env.GIT_COMMIT}"
            }
        }
    }
}
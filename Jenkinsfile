pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials-id') // Replace with your DockerHub credentials ID
        GITHUB_REPO = 'https://github.com/yourusername/your-repo.git' // Replace with your GitHub repo
        APP_WORKDIR = '/app'
        DOCKER_IMAGE = 'yourusername/python-web-app' // Replace with your DockerHub repository name
        KUBE_CONFIG = credentials('kubeconfig-credentials-id') // Replace with your Kubernetes config credentials ID
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: "${env.GITHUB_REPO}"
            }
        }

        stage('Download Application Code') {
            steps {
                sh '''
                curl -O https://group5-braincells.s3.amazonaws.com/python-web-app.zip
                unzip python-web-app.zip -d ${APP_WORKDIR}
                '''
            }
        }

        stage('Create Dockerfile') {
            steps {
                writeFile file: "${APP_WORKDIR}/Dockerfile", text: '''
                FROM ubuntu:latest
                WORKDIR /app
                RUN apt-get update && apt-get install -y python3 python3-pip
                COPY . /app
                ENTRYPOINT ["python3"]
                CMD ["manage.py", "runserver", "0.0.0.0:8000"]
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${env.DOCKER_IMAGE}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKERHUB_CREDENTIALS}") {
                        dockerImage.push("${env.BUILD_NUMBER}")
                        dockerImage.push('latest')
                    }
                }
            }
        }

        sta


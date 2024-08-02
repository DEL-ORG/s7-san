pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials-id') // Replace with your DockerHub credentials ID
        GITHUB_REPO = 'git@github.com:yourusername/your-repo.git' // Replace with your GitHub repo
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

        stage('Deploy Application Using Kubernetes') {
            steps {
                writeFile file: 'kubernetes-deployment.yaml', text: '''
                apiVersion: apps/v1
                kind: Deployment
                metadata:
                  name: python-web-app
                spec:
                  replicas: 4
                  selector:
                    matchLabels:
                      app: python-web-app
                  template:
                    metadata:
                      labels:
                        app: python-web-app
                    spec:
                      containers:
                      - name: python-web-app
                        image: ${env.DOCKER_IMAGE}:latest
                        ports:
                        - containerPort: 8000
                ---
                apiVersion: v1
                kind: Service
                metadata:
                  name: python-web-app-service
                spec:
                  type: LoadBalancer
                  ports:
                  - port: 8000
                    targetPort: 8000
                  selector:
                    app: python-web-app
                '''
                withCredentials([file(credentialsId: "${KUBE_CONFIG}", variable: 'KUBECONFIG')]) {
                    sh 'kubectl apply -f kubernetes-deployment.yaml --kubeconfig=$KUBECONFIG'
                }
            }
        }

        /* stage('Implement GitOps') {
            steps {
                // Add GitOps setup and configuration steps here using Argo CD or Flux
            }
        } */

        stage('Monitor and Display Cluster Activities') {
            steps {
                // Add monitoring setup steps here using Prometheus and Grafana
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}


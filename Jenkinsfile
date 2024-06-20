pipeline{
    agent any
    stages{
        stage('Hallo Welt') {
            steps {
                echo 'Hier ist DevOps ganz verfügbar'
                sh '''
                ls
                pwd
                env
                ls -1
                '''
            }
        }

        stage('DevOps Umgebung') {
            steps {
                echo 'was Devops die Welt bringt'
                sh '''
                touch köln01
                mkdir aktionen01
                '''
            }

        }

        stage('build') {
            steps {
                echo 'was Devops die Welt bringt'
                sh '''
                touch köln02
                mkdir aktionen02
                '''
            }

        }

        stage('scan') {
            steps {
                echo 'was Devops die Welt bringt'
                sh '''
                touch köln03
                mkdir aktionen03
                '''
            }

        }

        stage('test') {
            steps {
                echo 'was Devops die Welt bringt'
                sh '''
                touch köln04
                mkdir aktionen04
                '''
            }

        }

        stage('sicherheit') {
            steps {
                echo 'was Devops die Welt bringt'
                sh '''
                touch köln05
                mkdir aktionen05
                '''
            }

        }

        stage('deployment') {
            steps {
                echo 'was Devops die Welt bringt'
                sh '''
                touch köln06
                mkdir aktionen06
                '''
            }

        }
    }
}

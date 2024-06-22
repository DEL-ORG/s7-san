pipeline{
    agent any
    stages{
        stage('Hallo Welt') {
            steps {
                echo 'Hier ist DevOps ganz verfügbar'
                sh '''
                ls -lh
                pwd
                env
                ls -1
                sleep 2
                '''
            }
        }

        stage('DevOps Umgebung') {
            steps {
                echo 'was Devops die Welt bringt'
                sh '''
                touch ganz
                mkdir alles
                sleep 5
                '''
            }

        }

        stage('build') {
            steps {
                echo 'was Devops die Welt bringt'
                sh '''
                which
                wc
               sleep 5
                '''
            }

        }

        stage('scan') {
            steps {
                echo 'was Devops die Welt bringt'
                sh '''
                sleep 5
                '''
            }

        }

        stage('test') {
            steps {
                echo 'was Devops die Welt bringt'
                sh '''
                sleep 5
                pwd
                '''
            }

        }

        stage('sicherheit') {
            steps {
                echo 'was Devops die Welt bringt'
                sh '''
               sleep 5
                '''
            }

        }

        stage('deployment') {
            steps {
                echo 'was Devops die Welt bringt'
                sh '''
               sleep 5
                '''
            }

        }
    }
}

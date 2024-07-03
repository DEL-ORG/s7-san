pipeline{
    agent any
    stages{
        stage('Hallo Welt') {
            steps {
                echo 'Hier ist DevOps ganz verfügbar'
                sh '''
                ls -a
                pwd
                env
                ls -1
                sleep 10
                '''
            }
        }

        stage('DevOps Umgebung') {
            steps {
                echo 'was Devops die Welt bringt'
                sh '''
                sleep 3
                '''
            }

        }

        stage('build') {
            steps {
                echo 'was Devops die Welt bringt'
                sh '''
               sleep 5
                '''
            }

        }

        stage('scan') {
            steps {
                echo 'was Devops die Welt bringt'
                sh '''
                cat /etc/os-release

                sleep 3
                
                '''
            }

        }

        stage('test') {
            steps {
                echo 'was Devops die Welt bringt'
                sh '''
                pwd
                uname -a
                 sleep 10
                '''
            }

        }

        stage('sicherheit') {
            steps {
                echo 'was Devops die Welt bringt'
                sh '''
                lscpu
               sleep 3
                '''
            }

        }

        stage('deployment') {
            steps {
                echo 'was Devops die Welt bringt'
                sh '''
               sleep 3
                '''
            }

        }
    }
}

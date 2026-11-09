
pipeline {

    agent any

    environment {
        IMAGE_NAME = "regapp"
        CONTAINER_NAME = "regapp-container"
        DOCKERHUB_REPO = "regapp"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Docker Build') {
            steps {
                sh '''
                    docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} .
                    docker tag ${IMAGE_NAME}:${BUILD_NUMBER} ${IMAGE_NAME}:latest
                '''
            }
        }


        stage('Trivy Security Scan') {
    steps {
        sh '''
            set -e

            trivy image \
                --exit-code 1 \
                --severity HIGH,CRITICAL \
                --ignore-unfixed \
                regapp:${BUILD_NUMBER}
        '''
    }
}
        
        stage('Docker Hub Push') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-credentials',
                        usernameVariable: 'DOCKERHUB_USERNAME',
                        passwordVariable: 'DOCKERHUB_TOKEN'
                    )
                ]) {
                    sh '''
                        set +x
                        trap 'docker logout || true' EXIT

                        echo "$DOCKERHUB_TOKEN" | docker login \
                            -u "$DOCKERHUB_USERNAME" \
                            --password-stdin

                        docker tag ${IMAGE_NAME}:${BUILD_NUMBER} \
                            ${DOCKERHUB_USERNAME}/${DOCKERHUB_REPO}:${BUILD_NUMBER}

                        docker tag ${IMAGE_NAME}:latest \
                            ${DOCKERHUB_USERNAME}/${DOCKERHUB_REPO}:latest

                        docker push ${DOCKERHUB_USERNAME}/${DOCKERHUB_REPO}:${BUILD_NUMBER}

                        docker push ${DOCKERHUB_USERNAME}/${DOCKERHUB_REPO}:latest
                    '''
                }
            }
        }

        stage('AWS ECR Push') {
    steps {
        script {
            def awsRegion = 'ap-southeast-2'
            def awsAccountId = '556071985943'
            def ecrRepo = 'regapp'

            def ecrRegistry = "${awsAccountId}.dkr.ecr.${awsRegion}.amazonaws.com"
            def ecrImage = "${ecrRegistry}/${ecrRepo}"

            sh """
                set -e

                aws ecr get-login-password --region ${awsRegion} |
                docker login --username AWS --password-stdin ${ecrRegistry}

                docker tag ${IMAGE_NAME}:${BUILD_NUMBER} ${ecrImage}:${BUILD_NUMBER}
                docker tag ${IMAGE_NAME}:latest ${ecrImage}:latest

                docker push ${ecrImage}:${BUILD_NUMBER}
                docker push ${ecrImage}:latest

                docker logout ${ecrRegistry}
            """
        }
    }
}

        stage('Deploy') {
            steps {
                sh '''
                    docker stop ${CONTAINER_NAME} || true
                    docker rm ${CONTAINER_NAME} || true

                    docker run -d \
                        --name ${CONTAINER_NAME} \
                        -p 8081:8080 \
                        ${IMAGE_NAME}:${BUILD_NUMBER}
                '''
            }
        }

        stage('Verify') {
            steps {
                sh '''
                    sleep 10
                    docker ps
                    docker logs --tail 50 ${CONTAINER_NAME}
                '''
            }
        }
    }

    post {
        success {
            echo 'CI/CD Pipeline completed successfully!'
        }

        failure {
            echo 'CI/CD Pipeline failed!'
        }
    }
}

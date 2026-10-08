# 🚀 Maven Java Web Application — CI/CD with Jenkins, Docker, Tomcat & AWS EC2

<img width="2720" height="1864" alt="cicd_pipeline_flow" src="https://github.com/user-attachments/assets/639db51e-34f2-4186-bc5d-d347dc66bee5" />


A complete DevOps CI/CD project for deploying a Maven-based Java web application using **GitHub, Jenkins, Maven, Docker, Apache Tomcat, and AWS EC2**.

The main goal of this project is to automate the complete application delivery process — from pushing source code to GitHub to building, testing, containerizing, and deploying the application automatically.

---

## 📌 Project Overview

This project demonstrates a practical CI/CD pipeline for a Java web application.

Whenever a developer pushes code to the GitHub repository:

```text
Developer
    ↓
Git Push
    ↓
GitHub
    ↓
Webhook
    ↓
Jenkins
    ↓
Checkout Source Code
    ↓
Maven Build
    ↓
Maven Test
    ↓
Docker Image Build
    ↓
Deploy Docker Container
    ↓
Apache Tomcat
    ↓
Java Web Application
```

The entire pipeline runs on an **AWS EC2 Ubuntu server**.

---

# 🏗️ Architecture

```text
                        ┌──────────────────┐
                        │     Developer    │
                        └────────┬─────────┘
                                 │
                              git push
                                 │
                                 ▼
                        ┌──────────────────┐
                        │      GitHub      │
                        └────────┬─────────┘
                                 │
                              Webhook
                                 │
                                 ▼
                        ┌──────────────────┐
                        │     Jenkins     │
                        │                  │
                        │  1. Checkout     │
                        │  2. Maven Build  │
                        │  3. Test         │
                        │  4. Docker Build │
                        │  5. Deploy       │
                        └────────┬─────────┘
                                 │
                                 ▼
                        ┌──────────────────┐
                        │      Docker      │
                        │                  │
                        │  Tomcat Container│
                        └────────┬─────────┘
                                 │
                                 ▼
                        ┌──────────────────┐
                        │ Apache Tomcat    │
                        │                  │
                        │ Java WAR App     │
                        └────────┬─────────┘
                                 │
                                 ▼
                              Users
```

---

# 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Java | Application development |
| Maven | Build and dependency management |
| JSP / HTML / CSS / JavaScript | Web application UI |
| Git | Version control |
| GitHub | Source code repository |
| Jenkins | CI/CD automation |
| Docker | Application containerization |
| Apache Tomcat | Java web application server |
| AWS EC2 | Cloud server |
| Linux / Ubuntu | Server operating system |

---

# 📂 Project Structure

```text
Maven-with-Jenkins-main/
│
├── Dockerfile
├── pom.xml
├── README.md
├── Jenkinsfile
│
├── server/
│   ├── pom.xml
│   ├── src/
│   │   ├── main/
│   │   └── test/
│   └── target/
│
├── webapp/
│   ├── pom.xml
│   ├── src/
│   │   └── main/
│   │       └── webapp/
│   │           └── index.jsp
│   └── target/
│
├── regapp-deploy.yml
└── regapp-service.yml
```

> `target/` directories are generated automatically by Maven and normally should not be committed to Git.

---

# ☁️ AWS EC2 Setup

<img width="1883" height="837" alt="Screenshot 2026-10-08 185828" src="https://github.com/user-attachments/assets/629a5e14-04dc-4f6d-881f-0e44d6fa1e4b" />

The application and CI/CD tools are hosted on an Ubuntu-based AWS EC2 instance.

The EC2 server contains:

```text
AWS EC2
│
├── Java
├── Maven
├── Git
├── Jenkins
└── Docker
```

---

# 🔧 Prerequisites

Before running this project, install the following:

- Java JDK
- Maven
- Git
- Docker
- Jenkins
- AWS EC2 Ubuntu instance
- GitHub account

Verify the installations:

```bash
java -version
```

```bash
mvn -version
```

```bash
git --version
```

```bash
docker --version
```

```bash
jenkins --version
```

---

<img width="826" height="740" alt="Screenshot 2026-10-08 191252" src="https://github.com/user-attachments/assets/71459d6a-fc2f-4852-a5c8-2f072d261eb4" />

# 📥 Clone the Repository

Clone the project:

```bash
git clone https://github.com/tamilselvamV/Maven-with-Jenkins-main.git
```

Move into the project:

```bash
cd Maven-with-Jenkins-main
```

Check the files:

```bash
ls
```

---

# 🏗️ Build the Application with Maven

Run:

```bash
mvn clean package
```

Maven performs the build process and generates the WAR file.

Check the generated WAR:

```bash
find . -name "*.war"
```

You should get a result similar to:

```text
webapp/target/webapp.war
```

---

# 🧪 Run Tests

Run Maven tests:

```bash
mvn test
```

If the tests pass, Maven will display:

```text
BUILD SUCCESS
```

---

# 🐳 Docker Configuration

The application is packaged as a WAR file and deployed inside an Apache Tomcat Docker container.

Example Dockerfile:

```dockerfile
FROM tomcat:10.1-jdk21-temurin

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
```

---

# 🐳 Build Docker Image

After successfully building the Maven project:

```bash
docker build -t regapp .
```

Check the image:

```bash
docker images
```

You should see:

```text
regapp
```

---

# ▶️ Run Docker Container

Run the application:

```bash
docker run -d \
  --name regapp-container \
  -p 8081:8080 \
  regapp
```

Check the running container:

```bash
docker ps
```

You should see:

```text
0.0.0.0:8081->8080/tcp
```
<img width="802" height="120" alt="Screenshot 2026-10-08 195133" src="https://github.com/user-attachments/assets/f0ef41fb-5241-4b6f-a331-634449fa34ed" />

---

# 🌐 Access the Application

Find your AWS EC2 public IP address.

Then open:

```text
http://3.27.88.194:8081
```

The application should now be available in your browser.

---

# 🔍 Check Docker Logs

To check application logs:

```bash
docker logs regapp-container
```

To view the latest logs:

```bash
docker logs --tail 50 regapp-container
```

---

# 🛑 Stop the Container

```bash
docker stop regapp-container
```

Remove the container:

```bash
docker rm regapp-container
```

---

# 🔄 CI/CD Pipeline

The Jenkins pipeline automates the following stages:

```text
1. Checkout
       ↓
2. Maven Build
       ↓
3. Test
       ↓
4. Docker Build
       ↓
5. Deploy
       ↓
6. Verify
```

---

# ⚙️ Jenkins Configuration

Create a new Jenkins job.

Select:

```text
Pipeline
```

Do not select Freestyle Project.

---

## Pipeline Configuration

Under **Pipeline**:

```text
Definition:
Pipeline script from SCM
```

Select:

```text
SCM:
Git
```

Enter your GitHub repository:

```text
https://github.com/tamilselvamV/Maven-with-Jenkins-main.git
```

For a public repository:

```text
Credentials:
- none -
```

Branch:

```text
*/main
```

Jenkinsfile:

```text
Jenkinsfile
```

---

# 🔗 GitHub Webhook

Configure a webhook in your GitHub repository.

<img width="1898" height="463" alt="Screenshot 2026-10-08 221139" src="https://github.com/user-attachments/assets/ca703b30-d2c0-4773-916b-94bc8c65113a" />


Go to:

```text
GitHub
→ Repository
→ Settings
→ Webhooks
→ Add webhook
```

Set the Payload URL to:

```text
http://YOUR-EC2-PUBLIC-IP:8080/github-webhook/
```

Set:

```text
Content type:
application/json
```

Select:

```text
Just the push event
```

Enable the webhook.

---

# 🔐 Jenkins Docker Permission

Jenkins needs permission to execute Docker commands.

Add Jenkins to the Docker group:

```bash
sudo usermod -aG docker jenkins
```

Restart Jenkins:

```bash
sudo systemctl restart jenkins
```

Verify Docker access for Jenkins:

```bash
sudo -u jenkins docker ps
```

If Jenkins can access Docker, the Docker stages of the pipeline can run successfully.

---

# 📄 Jenkinsfile

The Jenkinsfile defines the CI/CD pipeline.

Example:

```groovy
pipeline {

    agent any

    environment {
        IMAGE_NAME = "regapp"
        CONTAINER_NAME = "regapp-container"
        APP_PORT = "8081"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} .'
                sh 'docker tag ${IMAGE_NAME}:${BUILD_NUMBER} ${IMAGE_NAME}:latest'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    docker stop ${CONTAINER_NAME} || true
                    docker rm ${CONTAINER_NAME} || true

                    docker run -d \
                        --name ${CONTAINER_NAME} \
                        -p ${APP_PORT}:8080 \
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
```

---

# 🚀 How the Pipeline Works

### Step 1 — Developer Changes Code

A developer modifies the application.

For example:

```text
index.jsp
```

Then commits the changes:

```bash
git add .
git commit -m "Improve application UI"
```

---

### Step 2 — Push to GitHub

```bash
git push origin main
```

---

### Step 3 — GitHub Webhook

GitHub detects the push and sends a webhook request to Jenkins.

```text
GitHub
   ↓
Webhook
   ↓
Jenkins
```

---

### Step 4 — Jenkins Checkout

Jenkins downloads the latest source code from GitHub.

```text
GitHub Repository
       ↓
    Jenkins
       ↓
Workspace
```

---

### Step 5 — Maven Build

Jenkins executes:

```bash
mvn clean package
```

Maven compiles the Java code and packages the application.

---

### Step 6 — Testing

Jenkins executes:

```bash
mvn test
```

Tests are executed automatically.

If tests fail, the pipeline stops.

---

### Step 7 — Docker Image

If the build and tests succeed, Jenkins creates the Docker image:

```bash
docker build -t regapp .
```

The image contains the application and Tomcat environment.

---

### Step 8 — Deployment

Jenkins stops the old container:

```bash
docker stop regapp-container
```

Removes it:

```bash
docker rm regapp-container
```

Then starts the new container:

```bash
docker run -d \
  --name regapp-container \
  -p 8081:8080 \
  regapp
```

---
<img width="1917" height="1018" alt="Screenshot 2026-10-08 211914" src="https://github.com/user-attachments/assets/6bb3f09b-d2f2-4245-81f8-85aa68691a50" />

### Step 9 — Application Available

The application becomes available through:

```text
http://YOUR-EC2-PUBLIC-IP:8081
```

---

# 🔥 Complete CI/CD Flow

```text
Developer
    │
    │ git push
    ▼
 GitHub
    │
    │ Webhook
    ▼
 Jenkins
    │
    ├── Checkout
    │
    ├── Maven Build
    │
    ├── Maven Test
    │
    ├── Docker Build
    │
    ├── Stop Old Container
    │
    ├── Start New Container
    │
    └── Verify
           │
           ▼
       Docker
           │
           ▼
     Apache Tomcat
           │
           ▼
     Java Web App
           │
           ▼
        Browser
```

---


<img width="1916" height="641" alt="Screenshot 2026-10-08 211839" src="https://github.com/user-attachments/assets/ada480d5-ac5e-4360-a6df-d9bfd820fb21" />
<img width="1917" height="1015" alt="Screenshot 2026-10-08 215749" src="https://github.com/user-attachments/assets/20caa49c-2c7d-47e3-b924-dd3ed044d27b" />

# 🧹 Useful Docker Commands

List running containers:

```bash
docker ps
```

List all containers:

```bash
docker ps -a
```

List images:

```bash
docker images
```

View logs:

```bash
docker logs regapp-container
```

Stop container:

```bash
docker stop regapp-container
```

Remove container:

```bash
docker rm regapp-container
```

Remove image:

```bash
docker rmi regapp
```

---

# 🧹 Useful Maven Commands

Clean previous builds:

```bash
mvn clean
```

Compile:

```bash
mvn compile
```

Run tests:

```bash
mvn test
```

Package application:

```bash
mvn package
```

Clean and package:

```bash
mvn clean package
```

---

# 🌿 Useful Git Commands

Check repository status:

```bash
git status
```

Create a branch:

```bash
git checkout -b feature/ui-improvement
```

Add changes:

```bash
git add .
```

Commit changes:

```bash
git commit -m "Improve application UI"
```

Push changes:

```bash
git push origin main
```

Pull latest changes:

```bash
git pull origin main
```

View branches:

```bash
git branch
```

View commit history:

```bash
git log --oneline
```

---

# 🛡️ Recommended `.gitignore`

Generated Maven files should generally not be pushed to GitHub.

Create:

```text
.gitignore
```

with:

```gitignore
# Maven
target/

# Java
*.class

# IDE
.idea/
*.iml
.vscode/

# Eclipse
.classpath
.project
.settings/

# Temporary files
*.swp
*.swo

# OS files
.DS_Store
Thumbs.db
```

After creating `.gitignore`, remove already tracked build files from Git:

```bash
git rm -r --cached server/target
git rm -r --cached webapp/target
```

Then:

```bash
git add .
git commit -m "Add gitignore and remove build artifacts"
git push origin main
```

---

# 🔐 AWS Security Group

For testing, the EC2 Security Group should allow the required ports.

Typical configuration:

| Port | Purpose |
|---|---|
| 22 | SSH |
| 8080 | Jenkins |
| 8081 | Application |

For production environments, avoid exposing unnecessary ports publicly and restrict access to trusted IP addresses where possible.

---

# 🐛 Troubleshooting

## Jenkins Cannot Execute Docker

Check:

```bash
sudo -u jenkins docker ps
```

If permission is denied:

```bash
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
```

---

## Maven Build Fails

Run manually:

```bash
mvn clean package
```

Check the error shown in the Maven output.

---

## Docker Build Fails

Check whether the WAR exists:

```bash
find . -name "*.war"
```

Then verify the Dockerfile path and `COPY` command.

---

## Container Starts but Application Does Not Load

Check:

```bash
docker ps
```

Then:

```bash
docker logs regapp-container
```

Also verify that the EC2 Security Group allows port `8081`.

---

## Jenkins Pipeline Does Not Start After Git Push

Check:

1. Jenkins job is a **Pipeline** job.
2. Pipeline uses **Pipeline script from SCM**.
3. Repository URL is correct.
4. Branch is `*/main`.
5. Script Path is `Jenkinsfile`.
6. GitHub webhook URL is correct.
7. Jenkins has network access.
8. **GitHub hook trigger for GITScm polling** is enabled.

---

# 📈 Future Improvements

This project can be extended into a more advanced DevOps architecture.

Possible improvements:

```text
GitHub
   ↓
Jenkins
   ↓
Maven
   ↓
SonarQube
   ↓
Docker
   ↓
Docker Hub / AWS ECR
   ↓
Kubernetes
   ↓
AWS EKS
```

Additional improvements can include:

- SonarQube code-quality analysis
- Docker Hub or Amazon ECR
- Kubernetes deployment
- AWS EKS
- Helm
- Terraform
- Prometheus
- Grafana
- Jenkins notifications
- Slack/Email notifications
- HTTPS with a domain
- Load balancing
- Blue/Green deployment
- Rolling deployment

---

# 🎯 Project Objectives

The main objectives of this project are:

- Understand Git and GitHub
- Understand Maven build automation
- Learn Jenkins CI/CD
- Automate application builds
- Automate testing
- Understand Docker containerization
- Deploy Java applications using Tomcat
- Deploy applications on AWS EC2
- Understand GitHub webhooks
- Implement an end-to-end CI/CD workflow

---

# 💡 Key DevOps Concepts Demonstrated

This project demonstrates:

**Continuous Integration**

Code is automatically checked out, built, and tested whenever changes are pushed.

**Continuous Delivery / Deployment**

After successful validation, a new Docker container is deployed automatically.

**Version Control**

Git and GitHub are used to manage source code and application changes.

**Automation**

Jenkins automates the complete build and deployment process.

**Containerization**

Docker packages the application together with its runtime environment.

**Cloud Deployment**

AWS EC2 provides the infrastructure where Jenkins, Docker, and the application run.

---

# 👨‍💻 Author

**Thamil Selvam**

DevOps & AWS Learner

Technologies practiced in this project:

```text
AWS
Linux
Git
GitHub
Jenkins
Maven
Docker
Tomcat
Java
CI/CD
```

---

# ⭐ Conclusion

This project demonstrates a complete practical CI/CD workflow for a Maven-based Java web application.

Instead of manually building and deploying the application every time, Jenkins automatically handles the process:

```text
Code Change
     ↓
Git Push
     ↓
GitHub
     ↓
Jenkins
     ↓
Maven Build
     ↓
Testing
     ↓
Docker Image
     ↓
Tomcat Container
     ↓
AWS EC2
     ↓
Live Application
```

This provides a strong foundation for building more advanced DevOps pipelines using Kubernetes, AWS EKS, Terraform, SonarQube, monitoring, and cloud-native deployment technologies.

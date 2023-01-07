pipeline {
    agent{label'all'}
    stages{
        stage('vcs') {
            steps {
                // mail subject: 'Build Started',
                //      body: 'Build Started',
                //      to: 'boggarapusaigowtham@gmail.com'
                git url:'https://github.com/GOWTHI143/spring-petclinic.git' ,
                    branch:'task'
            }
        }
        stage('Jfrog package build') {
            steps {
                rtMavenDeployer (
                    id: "MAVEN_DEPLOYER",
                    serverId: "JFROG2023",
                    releaseRepo: "gowtham-libs-release-local",
                    snapshotRepo: "gowtham-libs-snapshot-local"
                )
            }
        }
        stage ('Exec Maven') {
            steps {
                rtMavenRun (
                    tool: "MAVEN_TOOL", // Tool name from Jenkins configuration
                    pom: 'pom.xml',
                    goals: 'clean install ',
                    deployerId: "MAVEN_DEPLOYER"
                )
            }
        }
        stage ('Publish build info') {
            steps {
                rtPublishBuildInfo (
                    serverId: "JFROG2023"
                )
            }
        }
        stage('sonar scan'){
            steps{
                withSonarQubeEnv('SONAR') {
                    sh " mvn package sonar:sonar"
                }
            }
        }
        stage ('Docker image build & Push') {
            steps {
                mail subject: 'Docker stage',
                     body: 'docker image build started',
                     to: 'boggarapusaigowtham@gmail.com'
                sh """docker image build -t gowtham143.jfrog.io/gowtham-docker/spc:${env.BUILD_NUMBER} .
                      docker push gowtham143.jfrog.io/gowtham-docker/spc:${env.BUILD_NUMBER}"""
            // script {
            //     docker.build('gowtham-docker-local/spc:1.0', "-f Dockerfile .")
            // }
            }
        }
        stage ('Deleting image') {
            steps {
                sh "docker image rmi -f gowtham143.jfrog.io/gowtham-docker/spc:${env.BUILD_NUMBER} "
            }
        }
    }
    // post {
    //      success{
    //             mail subject: 'Build success',
    //                  body: 'Build success',
    //                  to: 'boggarapusaigowtham@gmail.com'
    //      }
    //         failure {
    //         mail subject: 'Build Failed',
    //               body: 'Build Failed',
    //               to: 'boggarapusaigowtham@gmail.com'
    //         }
    // }
}
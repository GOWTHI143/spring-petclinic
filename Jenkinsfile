pipeline {
    agent {label 'task'}
    triggers { pollSCM('* * * * *')}
    tools {maven 'MAVEN-3.8.7'}
    stages{
        stage('vcs') {
            steps {
                git branch: "task",
                    url:'https://github.com/GOWTHI143/spring-petclinic.git'
            }
        }
        stage('build') {
            steps{
                rtMavenDeployer (
                    id: "MAVEN_DEPLOYER",
                    serverId: "JFROG",
                    releaseRepo: "gowtham-libs-release-local",
                    snapshotRepo: "gowtham-libs-snapshot-local"
                )          
            }
        }
        stage ('Exec Maven') {
            steps {
                rtMavenRun (
                    tool: MAVEN, // Tool name from Jenkins configuration
                    pom: 'pom.xml',
                    goals: "mvn package",
                    deployerId: "MAVEN_DEPLOYER" )
            }
        }
         stage('publish') {
            steps {
                rtPublishBuildInfo (
                    serverId: "JFROG"
                )
            }
         }
    }
}
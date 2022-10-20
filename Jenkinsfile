pipeline {
    agent any
    triggers { pollSCM('* * * * *')}
    parameters {
        choice(name: 'BRANCH', choices: ['master', 'task'], description: 'build choice')
    }
    stages{
        stage('vcs'){
            steps {
                git branch: "${params.BRANCH}",
                    url:'https://github.com/GOWTHI143/spring-petclinic.git'
            }
        }
        stage('build') {
            steps{
                sh 'mvn clean install'
                }
        }
    }
}
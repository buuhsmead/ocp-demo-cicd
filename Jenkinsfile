#!/usr/bin/env groovy

node {
    stage('git checkout app') {
        echo "checking out all of the app"
        checkout scm
        sh "ls -lar"
    }
    stage('git checkout explotatie') {
        dir('explotatie') {
            echo "dummy demo checkout of explotatie specifics"
          // this git repo should only contain one directory 'explotatie'
          //  git credentialsId: 'git-explotatie-cred', url: 'https://github.com/buuhsmead/ocp-demo-cicd.git'
        }
    }
    stage('build the dc,svc,route') {
        // either rebuild to get to the yamls
        // or choose to have something ready in 'explotatie'

        // first the app dev stuff
        sh "cat staging/app-dev.env > app.env"
        // then the stage app stuff
        // stage is hard coded, not best practice
        sh "cat explotatie/app-pp.env >> app.env"

        // now we have the env vars adjusted for current stage
        // we could create the DC with template now
        sh "cat app.env | oc process -f staging/app.yaml --param-file=- > app.yaml"
    }
}

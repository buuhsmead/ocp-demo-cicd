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
        sh "oc process -f staging/app.yaml --param-file=app.env > app.yaml"
    }
    stage('create in a project the app') {
        // get and push the image to the right namespace
        openshift.newProject("d2", "--display-name", "d2")
        openshift.withProject() {
            sh "oc create -f app.yaml"
        }

    }

}

//+ oc create -f app.yaml -n d2 --namespace=d2
//Error from server (Forbidden): deploymentconfigs.apps.openshift.io is forbidden: User "system:serviceaccount:demo-jenkins:jenkins" cannot create deploymentconfigs.apps.openshift.io in the namespace "d2": no RBAC policy matched
//Error from server (Forbidden): services is forbidden: User "system:serviceaccount:demo-jenkins:jenkins" cannot create services in the namespace "d2": no RBAC policy matched
//Error from server (Forbidden): routes.route.openshift.io is forbidden: User "system:serviceaccount:demo-jenkins:jenkins" cannot create routes.route.openshift.io in the namespace "d2": no RBAC policy matched

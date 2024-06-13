pipeline {

agent any
 environment {
     PROJECT_ID = 'jenkins'
     dockerimagename = 'suranagivinod/openjdk8'
 }
 stages {
     stage("Checkout code") {
         steps {
             checkout scm
         }
     }
     stage("Build image") {
         steps {
             script {
                 dockerImage = docker.build dockerimagename
             }
         }
     }
 stage("Deploy Kubernetes") {
     steps {
        script {
     withKubeConfig([credentialsId: 'kubeconfig']) 
         {
       sh "kubectl create -f deployment.yml"
       sh "kubectl create -f service.yml"
       }                
     }
       //kubernetesDeploy(configs: "deployment.yml", "service.yml")
       }                
     }

   }
 }


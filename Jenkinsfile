pipeline {
  agent any

  environment {
    LOGIN_URL = 'https://api.g66666.hk.my-demo.tech:6443'
    PROJECT = 'jenjins-demo'
  }  
  
  stages {
    stage('Login OKD') {
      steps {
        withCredentials(bindings: [usernamePassword(
          		  credentialsId: 'openshift-login-api-token', 
          		  usernameVariable: 'USERNAME',
          		  passwordVariable: 'PASSWORD',
          		)]) {
          sh "oc login --server=${env.LOGIN_URL}  --insecure-skip-tls-verify=true --token=${PASSWORD}"
          sh "oc project $PROJECT"
        }

      }
    }


    stage ('Build') {
      steps {
        sh '''
          echo "add your build command here"
        ''' 
      }
    }
    


    stage ('Unit Test') {
      steps {
        sh '''
          echo "add your test command here"
        ''' 
      }
    }
  
    stage ('Delete Old Project') {
      steps {
        sh '''
          echo "Delete Old Project"
        ''' 
        sh "oc delete svc,bc,deployment,build,route --all -n $PROJECT || true"
        sh "oc delete project $PROJECT || true"
        sh "sleep 20"
      }
    } 
   
    stage ('Create Project') {
      steps {
        sh '''
          echo "Create Project"
        ''' 
        
        sh "oc new-project $PROJECT || true"
      }
    }
    
    stage('Deploy App') {
      steps {
        echo 'Deploy application'
        script {
          sh "oc project $PROJECT"
          sh 'oc new-app --name openshift-demo \'quay.io/centos7/httpd-24-centos7:latest~https://github.com/wayne-cec/openshift-demo\' --strategy=source --allow-missing-images '
        }

      }
    }
    stage('Expose Service') {
      steps {
        echo 'Expose Route'
        script {
          sh 'oc expose svc/openshift-demo'
        }

      }
    }
 } 
}

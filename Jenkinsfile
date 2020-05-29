pipeline {

  agent {
    node {
      label "docker"
    }
  }

  stages {
    stage("build image") {
      steps {

        sh "docker build -t docker-registry.asf.alaska.edu:5000/cicd-demo ."

      }
    }
    stage("push image") {
      steps {
        sh "docker push docker-registry.asf.alaska.edu:5000/cicd-demo"
      }
    }

    stage("deploy") {
      steps {
        withKubeConfig([credentialsId: "eac32eed-2997-4fa3-b1e4-27a11f42f567"]) {
          sh "kubectl apply -f k8s.yaml"
          sh "kubectl rollout restart deployment demo --namespace cicd-demo"
          sh "kubectl rollout status deployment demo --namespace cicd-demo"
        }
      }
    }
  }
}

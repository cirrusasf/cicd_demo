pipeline {

  agent {
    node {
      label "docker"
    }
  }

  stages {
    stage("build image") {
      steps {

        sh "docker build -t docker-registry.asf.alaska.edu:5000/cicdjz ."

      }
    }
    stage("push image") {
      steps {
        sh "docker push docker-registry.asf.alaska.edu:5000/cicdjz"
      }
    }

    stage("deploy") {
      steps {
        withKubeConfig([credentialsId: "rancher-dev-kubeconfig"]) {
          sh "kubectl apply -f k8s.yaml --namespace cicdjz"
          sh "kubectl rollout restart deployment cicdjz --namespace cicdjz"
          sh "kubectl rollout status deployment cicdjz --namespace cicdjz"
        }
      }
    }
  }
}

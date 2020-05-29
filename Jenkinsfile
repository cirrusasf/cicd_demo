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
        withKubeConfig([credentialsId: "fdc7a89b-13b0-4a73-9c40-76faf87eb607"]) {
          sh "kubectl apply -f k8s.yaml"
          sh "kubectl rollout restart deployment demo --namespace cicd-demo"
          sh "kubectl rollout status deployment demo --namespace cicd-demo"
        }
      }
    }
  }
}

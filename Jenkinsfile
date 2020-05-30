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
        withKubeConfig([credentialsId: "5d1c490e-e980-407c-9744-5873c464e6ec"]) {
          sh "kubectl apply -f k8s.yaml --namespace cicdjz"
          sh "kubectl rollout restart deployment cicdjz --namespace cicdjz"
          sh "kubectl rollout status deployment cicdjz --namespace cicdjz"
        }
      }
    }
  }
}

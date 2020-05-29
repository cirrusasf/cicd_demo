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
        withKubeConfig([credentialsId: "5d1c490e-e980-407c-9744-5873c464e6ec"]) {
          sh "kubectl --namespce cicd-demo apply -f k8s.yaml"
          sh "kubectl rollout restart deployment demo --namespace cicd-demo"
          sh "kubectl rollout status deployment demo --namespace cicd-demo"
        }
      }
    }
  }
}

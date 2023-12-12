# k8s-terraform.tf

provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Kubernetes Deployment
resource "kubernetes_deployment" "my_java_app" {
  metadata {
    name = "my-java-app"
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "my-java-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "my-java-app"
        }
      }

      spec {
        container {
          name  = "my-java-app"
          image = "your-docker-image:tag" # Replace with your actual Docker image and tag
          
        }
      }
    }
  }
}

# Kubernetes Service
resource "kubernetes_service" "my_java_app_service" {
  metadata {
    name = "my-java-app-service"
  }

  spec {
    selector = {
      app = "my-java-app"
    }

    port {
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "nginx-example"
    labels = {
      App = "ScaleableNginx"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        App = "ScaleableNginx"
      }
    }

    template {
      metadata {
        labels = {
          App = "ScaleableNginx"
        }
      }

      spec {
        container {
          image = "nginx:latest"
          name  = "container-example"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.2"
              memory = "256Mi"
            }

            requests = {
              cpu    = "100m"
              memory = "25Mi"
            }
          }
        }
      }
    }
  }
}

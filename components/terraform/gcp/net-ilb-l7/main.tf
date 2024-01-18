module "lb-http" {
  count                           = local.enabled ? 1 : 0
  source                          = "GoogleCloudPlatform/lb-http/google"
  version                         = "10.1.0"
  project                         = var.project_id
  name                            = module.this.id
  backends                        = var.backends
  create_address                  = var.create_ipv4_address
  address                         = var.existing_ipv4_address
  enable_ipv6                     = var.enable_ipv6
  create_ipv6_address             = var.create_ipv6_address
  ipv6_address                    = var.existing_ipv6_address
  ssl                             = var.enable_ssl
  use_ssl_certificates            = var.use_ssl_certificates
  managed_ssl_certificate_domains = var.managed_ssl_certificate_domains
  random_certificate_suffix       = var.random_certificate_suffix
  ssl_certificates                = var.ssl_certificates
  certificate                     = var.certificate
  private_key                     = var.private_key
  ssl_policy                      = var.ssl_policy
  certificate_map                 = var.certificate_map
  create_url_map                  = var.create_url_map
  url_map                         = var.url_map
  edge_security_policy            = var.edge_security_policy
  firewall_projects               = var.firewall_projects
  firewall_networks               = var.firewall_networks
  http_forward                    = var.http_forward
  https_redirect                  = var.https_redirect
  target_tags                     = var.target_tags
  target_service_accounts         = var.target_service_accounts
  quic                            = var.quic
  load_balancing_scheme           = var.load_balancing_scheme
  network                         = var.internal_lb_network
  security_policy                 = var.security_policy
  labels                          = module.this.tags
}

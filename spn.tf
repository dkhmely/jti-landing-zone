resource "azuread_application_registration" "lz_app_registration" {
  display_name     = "${var.application}-${var.env}-sp"
  description      = "Landing Zone App registration"
}

resource "azuread_service_principal" "lz_app_sp" {
  client_id = azuread_application_registration.lz_app_registration.client_id
}

resource "azuread_application_password" "lz_app_password" {
  application_id = azuread_application_registration.lz_app_registration.id
}

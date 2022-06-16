resource "genesyscloud_integration_action" "action" {
    name           = var.action_name
    category       = var.action_category
    integration_id = var.integration_id
    secure         = var.secure_data_action
    
    contract_input  = jsonencode({
        "additionalProperties" = true,
        "properties" = {
            "contactAddress1" = {
                "type" = "string"
            },
            "contactCellPhone" = {
                "type" = "string"
            },
            "contactCity" = {
                "type" = "string"
            },
            "contactCountryCode" = {
                "type" = "string"
            },
            "contactFirstName" = {
                "type" = "string"
            },
            "contactHomePhone" = {
                "type" = "string"
            },
            "contactId" = {
                "type" = "string"
            },
            "contactLastName" = {
                "type" = "string"
            },
            "contactOrgName" = {
                "type" = "string"
            },
            "contactOrgType" = {
                "type" = "string"
            },
            "contactOtherEmail" = {
                "type" = "string"
            },
            "contactPersonalEmail" = {
                "default" = " ",
                "type" = "string"
            },
            "contactPostalCode" = {
                "type" = "string"
            },
            "contactState" = {
                "type" = "string"
            },
            "contactTitle" = {
                "type" = "string"
            },
            "contactWorkEmail" = {
                "type" = "string"
            },
            "contactWorkPhone" = {
                "type" = "string"
            },
            "surveyOptOut" = {
                "type" = "boolean"
            }
        },
        "required" = [
            "contactId",
            "contactFirstName"
        ],
        "type" = "object"
    })
    contract_output = jsonencode({
        "additionalProperties" = true,
        "properties" = {},
        "type" = "object"
    })
    
    config_request {
        request_template     = "{\n   \"firstName\": \"$!{input.contactFirstName}\",\n   \"lastName\": \"$!{input.contactLastName}\",\n\n   \"title\": \"$!{input.contactTitle}\",\n   \"workPhone\": {\n      \"display\": \"$!{input.contactWorkPhone}\",\n    \n      \"e164\": \"$!{input.contactWorkPhone}\"\n     \n   },\n   \"cellPhone\": {\n      \"display\": \"$!{input.contactCellPhone}\",\n    \n      \"e164\": \"$!{input.contactCellPhone}\"\n   },\n   \"homePhone\": {\n      \"display\": \"$!{input.contactHomePhone}\",\n\n      \"e164\": \"$!{input.contactHomePhone}\"\n   },\n   \n   \"workEmail\": \"$!{input.contactWorkEmail}\",\n   \"personalEmail\": \"$!{input.contactPersonalEmail}\",\n   \n   \"address\": {\n      \"address1\": \"$!{input.contactAddress1}\",\n      \"city\": \"$!{input.contactCity}\",\n      \"state\": \"$!{input.contactState}\",\n      \"postalCode\": \"$!{input.contactPostalCode}\",\n      \"countryCode\": \"$!{input.contactCountryCode}\"\n   },\n\n\n \"surveyOptOut\": $${input.surveyOptOut}\n}"
        request_type         = "PUT"
        request_url_template = "/api/v2/externalcontacts/contacts/$${input.contactId}"
    }

    config_response {
        success_template = "$${rawResult}"
    }
}
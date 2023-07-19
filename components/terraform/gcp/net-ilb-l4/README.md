<!-- BEGIN-TERRAFORM-DOCS -->
## Description

Regional TCP Load Balancer Terraform Module

* Modular Regional TCP Load Balancer for GCE using target pool and forwarding rule.

## Reference to pass variable values from atmos stack

<p>components: <br>&emsp;terraform:<br>&emsp;&emsp;nwetwork-lb:<br>&emsp;&emsp;&emsp;metadata:<br>&emsp;&emsp;&emsp;&emsp;component: gcp/net-ilb-l4 <br>&emsp;&emsp;&emsp;vars:<br>&emsp;&emsp;&emsp;&emsp;enabled: true <br>&emsp;&emsp;&emsp;&emsp;namespace: "test" <br>&emsp;&emsp;&emsp;&emsp;environment: "network-lb" <br>&emsp;&emsp;&emsp;&emsp;stage: "uw2" <br>&emsp;&emsp;&emsp;&emsp;label_key_case: "lower" <br>&emsp;&emsp;&emsp;&emsp;project_id: "gcp-project-id" <br>&emsp;&emsp;&emsp;&emsp;attributes: [] <br>&emsp;&emsp;&emsp;&emsp;tags: {} <br>&emsp;&emsp;&emsp;&emsp;region: "us-west2" <br>&emsp;&emsp;&emsp;&emsp;service_port: 80 <br></p>

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.72 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 4.72 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_network_lb"></a> [network\_lb](#module\_network\_lb) | terraform-google-modules/lb/google | 4.0.1 |
| <a name="module_this"></a> [this](#module\_this) | cloudposse/label/null | 0.25.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional key-value pairs to add to each map in `tags_as_list_of_maps`. Not added to `tags` or `id`.<br>This is for some rare cases where resources want additional configuration of tags<br>and therefore take a list of maps with tag key, value, and additional configuration. | `map(string)` | `{}` | no |
| <a name="input_allowed_ips"></a> [allowed\_ips](#input\_allowed\_ips) | The IP address ranges which can access the load balancer. | `list(string)` | <pre>[<br>  "0.0.0.0"<br>]</pre> | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | ID element. Additional attributes (e.g. `workers` or `cluster`) to add to `id`,<br>in the order they appear in the list. New attributes are appended to the<br>end of the list. The elements of the list are joined by the `delimiter`<br>and treated as a single ID element. | `list(string)` | `[]` | no |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "descriptor_formats": {},<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "labels_as_tags": [<br>    "unset"<br>  ],<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {},<br>  "tenant": null<br>}</pre> | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between ID elements.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_descriptor_formats"></a> [descriptor\_formats](#input\_descriptor\_formats) | Describe additional descriptors to be output in the `descriptors` output map.<br>Map of maps. Keys are names of descriptors. Values are maps of the form<br>`{<br>   format = string<br>   labels = list(string)<br>}`<br>(Type is `any` so the map values can later be enhanced to provide additional options.)<br>`format` is a Terraform format string to be passed to the `format()` function.<br>`labels` is a list of labels, in order, to pass to `format()` function.<br>Label values will be normalized before being passed to `format()` so they will be<br>identical to how they appear in `id`.<br>Default is `{}` (`descriptors` output will be empty). | `any` | `{}` | no |
| <a name="input_disable_health_check"></a> [disable\_health\_check](#input\_disable\_health\_check) | Disables the health check on the target pool. | `bool` | `false` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_firewall_project"></a> [firewall\_project](#input\_firewall\_project) | Name of the project to create the firewall rule in. Useful for shared VPC. Default is var.project\_id. | `string` | `null` | no |
| <a name="input_health_check"></a> [health\_check](#input\_health\_check) | Health check to determine whether instances are responsive and able to do work | <pre>object({<br>    check_interval_sec  = optional(number, 5),<br>    healthy_threshold   = optional(number, 2),<br>    timeout_sec         = optional(number, 5),<br>    unhealthy_threshold = optional(number, 2),<br>    port                = optional(number, 80),<br>    request_path        = optional(string, "/"),<br>    host                = optional(string, null)<br>  })</pre> | `{}` | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for keep the existing setting, which defaults to `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | IP address of the external load balancer, if empty one will be assigned. | `string` | `null` | no |
| <a name="input_ip_protocol"></a> [ip\_protocol](#input\_ip\_protocol) | The IP protocol for the frontend forwarding rule and firewall rule. TCP, UDP, ESP, AH, SCTP or ICMP. | `string` | `"TCP"` | no |
| <a name="input_label_key_case"></a> [label\_key\_case](#input\_label\_key\_case) | Controls the letter case of the `tags` keys (label names) for tags generated by this module.<br>Does not affect keys of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The order in which the labels (ID elements) appear in the `id`.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 6 labels ("tenant" is the 6th), but at least one must be present. | `list(string)` | `null` | no |
| <a name="input_label_value_case"></a> [label\_value\_case](#input\_label\_value\_case) | Controls the letter case of ID elements (labels) as included in `id`,<br>set as tag values, and output by this module individually.<br>Does not affect values of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Set this to `title` and set `delimiter` to `""` to yield Pascal Case IDs.<br>Default value: `lower`. | `string` | `null` | no |
| <a name="input_labels_as_tags"></a> [labels\_as\_tags](#input\_labels\_as\_tags) | Set of labels (ID elements) to include as tags in the `tags` output.<br>Default is to include all labels.<br>Tags with empty values will not be included in the `tags` output.<br>Set to `[]` to suppress all generated tags.<br>**Notes:**<br>  The value of the `name` tag, if included, will be the `id`, not the `name`.<br>  Unlike other `null-label` inputs, the initial setting of `labels_as_tags` cannot be<br>  changed in later chained modules. Attempts to change it will be silently ignored. | `set(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | ID element. Usually the component or solution name, e.g. 'app' or 'jenkins'.<br>This is the only ID element not also included as a `tag`.<br>The "name" tag is set to the full `id` string. There is no tag with the value of the `name` input. | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | ID element. Usually an abbreviation of your organization name, e.g. 'eg' or 'cp', to help ensure generated IDs are globally unique | `string` | `null` | no |
| <a name="input_network"></a> [network](#input\_network) | Name of the network to create resources in. | `string` | `"default"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the existing GCP project | `string` | n/a | yes |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Terraform regular expression (regex) string.<br>Characters matching the regex will be removed from the ID elements.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | Region used for GCP resources. | `string` | n/a | yes |
| <a name="input_service_port"></a> [service\_port](#input\_service\_port) | TCP port your service is listening on. | `number` | n/a | yes |
| <a name="input_session_affinity"></a> [session\_affinity](#input\_session\_affinity) | How to distribute load. Options are NONE, CLIENT\_IP and CLIENT\_IP\_PROTO | `string` | `"NONE"` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | ID element. Usually used to indicate role, e.g. 'prod', 'staging', 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).<br>Neither the tag keys nor the tag values will be modified by this module. | `map(string)` | `{}` | no |
| <a name="input_target_service_accounts"></a> [target\_service\_accounts](#input\_target\_service\_accounts) | List of target service accounts to allow traffic using firewall rule. | `list(string)` | `null` | no |
| <a name="input_target_tags"></a> [target\_tags](#input\_target\_tags) | List of target tags to allow traffic using firewall rule. | `list(string)` | `null` | no |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | ID element \_(Rarely used, not included by default)\_. A customer identifier, indicating who this instance of a resource is for | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip"></a> [external\_ip](#output\_external\_ip) | The external ip address of the forwarding rule |
| <a name="output_target_pool"></a> [target\_pool](#output\_target\_pool) | The self\_link to the target pool resource created. |
<!-- END-TERRAFORM-DOCS -->
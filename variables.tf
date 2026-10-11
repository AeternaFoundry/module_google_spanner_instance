variable "spanner_instances" {
  description = <<EOT
Map of spanner_instances, attributes below
Required:
    - config
    - display_name
Optional:
    - default_backup_schedule_type
    - deletion_policy
    - edition
    - force_destroy
    - instance_type
    - labels
    - name
    - num_nodes
    - processing_units
    - project
    - autoscaling_config (block):
        - asymmetric_autoscaling_options (optional, block):
            - overrides (required, block):
                - autoscaling_limits (optional, block):
                    - max_nodes (optional)
                    - max_processing_units (optional)
                    - min_nodes (optional)
                    - min_processing_units (optional)
                - autoscaling_target_high_priority_cpu_utilization_percent (optional)
                - autoscaling_target_total_cpu_utilization_percent (optional)
                - disable_high_priority_cpu_autoscaling (optional)
                - disable_total_cpu_autoscaling (optional)
            - replica_selection (required, block):
                - location (required)
        - autoscaling_limits (optional, block):
            - max_nodes (optional)
            - max_processing_units (optional)
            - min_nodes (optional)
            - min_processing_units (optional)
        - autoscaling_targets (optional, block):
            - high_priority_cpu_utilization_percent (optional)
            - storage_utilization_percent (optional)
            - total_cpu_utilization_percent (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    config                       = string
    display_name                 = string
    default_backup_schedule_type = optional(string)
    deletion_policy              = optional(string)
    edition                      = optional(string)
    force_destroy                = optional(bool)
    instance_type                = optional(string)
    labels                       = optional(map(string))
    name                         = optional(string)
    num_nodes                    = optional(number)
    processing_units             = optional(number)
    project                      = optional(string)
    autoscaling_config = optional(object({
      asymmetric_autoscaling_options = optional(list(object({
        overrides = object({
          autoscaling_limits = optional(object({
            max_nodes            = optional(number)
            max_processing_units = optional(number)
            min_nodes            = optional(number)
            min_processing_units = optional(number)
          }))
          autoscaling_target_high_priority_cpu_utilization_percent = optional(number)
          autoscaling_target_total_cpu_utilization_percent         = optional(number)
          disable_high_priority_cpu_autoscaling                    = optional(bool)
          disable_total_cpu_autoscaling                            = optional(bool)
        })
        replica_selection = object({
          location = string
        })
      })))
      autoscaling_limits = optional(object({
        max_nodes            = optional(number)
        max_processing_units = optional(number)
        min_nodes            = optional(number)
        min_processing_units = optional(number)
      }))
      autoscaling_targets = optional(object({
        high_priority_cpu_utilization_percent = optional(number)
        storage_utilization_percent           = optional(number)
        total_cpu_utilization_percent         = optional(number)
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}


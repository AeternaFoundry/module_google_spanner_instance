resource "google_spanner_instance" "spanner_instances" {
  for_each = var.spanner_instances

  config                       = each.value.config
  display_name                 = each.value.display_name
  default_backup_schedule_type = each.value.default_backup_schedule_type
  deletion_policy              = each.value.deletion_policy
  edition                      = each.value.edition
  force_destroy                = each.value.force_destroy
  instance_type                = each.value.instance_type
  labels                       = each.value.labels
  name                         = each.value.name
  num_nodes                    = each.value.num_nodes
  processing_units             = each.value.processing_units
  project                      = each.value.project

  dynamic "autoscaling_config" {
    for_each = each.value.autoscaling_config != null ? [each.value.autoscaling_config] : []
    content {
      dynamic "asymmetric_autoscaling_options" {
        for_each = autoscaling_config.value.asymmetric_autoscaling_options != null ? autoscaling_config.value.asymmetric_autoscaling_options : []
        content {
          overrides {
            dynamic "autoscaling_limits" {
              for_each = asymmetric_autoscaling_options.value.overrides.autoscaling_limits != null ? [asymmetric_autoscaling_options.value.overrides.autoscaling_limits] : []
              content {
                max_nodes            = autoscaling_limits.value.max_nodes
                max_processing_units = autoscaling_limits.value.max_processing_units
                min_nodes            = autoscaling_limits.value.min_nodes
                min_processing_units = autoscaling_limits.value.min_processing_units
              }
            }
            autoscaling_target_high_priority_cpu_utilization_percent = asymmetric_autoscaling_options.value.overrides.autoscaling_target_high_priority_cpu_utilization_percent
            autoscaling_target_total_cpu_utilization_percent         = asymmetric_autoscaling_options.value.overrides.autoscaling_target_total_cpu_utilization_percent
            disable_high_priority_cpu_autoscaling                    = asymmetric_autoscaling_options.value.overrides.disable_high_priority_cpu_autoscaling
            disable_total_cpu_autoscaling                            = asymmetric_autoscaling_options.value.overrides.disable_total_cpu_autoscaling
          }
          replica_selection {
            location = asymmetric_autoscaling_options.value.replica_selection.location
          }
        }
      }
      dynamic "autoscaling_limits" {
        for_each = autoscaling_config.value.autoscaling_limits != null ? [autoscaling_config.value.autoscaling_limits] : []
        content {
          max_nodes            = autoscaling_limits.value.max_nodes
          max_processing_units = autoscaling_limits.value.max_processing_units
          min_nodes            = autoscaling_limits.value.min_nodes
          min_processing_units = autoscaling_limits.value.min_processing_units
        }
      }
      dynamic "autoscaling_targets" {
        for_each = autoscaling_config.value.autoscaling_targets != null ? [autoscaling_config.value.autoscaling_targets] : []
        content {
          high_priority_cpu_utilization_percent = autoscaling_targets.value.high_priority_cpu_utilization_percent
          storage_utilization_percent           = autoscaling_targets.value.storage_utilization_percent
          total_cpu_utilization_percent         = autoscaling_targets.value.total_cpu_utilization_percent
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}


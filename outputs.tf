output "spanner_instances_id" {
  description = "Map of id values across all spanner_instances, keyed the same as var.spanner_instances except keys with no id are omitted"
  value       = { for k, v in google_spanner_instance.spanner_instances : k => v.id if v.id != null && length(v.id) > 0 }
}
output "spanner_instances_autoscaling_config" {
  description = "Map of autoscaling_config values across all spanner_instances, keyed the same as var.spanner_instances except keys with no autoscaling_config are omitted"
  value       = { for k, v in google_spanner_instance.spanner_instances : k => one(v.autoscaling_config) if v.autoscaling_config != null && length(v.autoscaling_config) > 0 }
}
output "spanner_instances_config" {
  description = "Map of config values across all spanner_instances, keyed the same as var.spanner_instances except keys with no config are omitted"
  value       = { for k, v in google_spanner_instance.spanner_instances : k => v.config if v.config != null && length(v.config) > 0 }
}
output "spanner_instances_default_backup_schedule_type" {
  description = "Map of default_backup_schedule_type values across all spanner_instances, keyed the same as var.spanner_instances except keys with no default_backup_schedule_type are omitted"
  value       = { for k, v in google_spanner_instance.spanner_instances : k => v.default_backup_schedule_type if v.default_backup_schedule_type != null && length(v.default_backup_schedule_type) > 0 }
}
output "spanner_instances_deletion_policy" {
  description = "Map of deletion_policy values across all spanner_instances, keyed the same as var.spanner_instances except keys with no deletion_policy are omitted"
  value       = { for k, v in google_spanner_instance.spanner_instances : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "spanner_instances_display_name" {
  description = "Map of display_name values across all spanner_instances, keyed the same as var.spanner_instances except keys with no display_name are omitted"
  value       = { for k, v in google_spanner_instance.spanner_instances : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "spanner_instances_edition" {
  description = "Map of edition values across all spanner_instances, keyed the same as var.spanner_instances except keys with no edition are omitted"
  value       = { for k, v in google_spanner_instance.spanner_instances : k => v.edition if v.edition != null && length(v.edition) > 0 }
}
output "spanner_instances_effective_labels" {
  description = "Map of effective_labels values across all spanner_instances, keyed the same as var.spanner_instances except keys with no effective_labels are omitted"
  value       = { for k, v in google_spanner_instance.spanner_instances : k => v.effective_labels if v.effective_labels != null && length(v.effective_labels) > 0 }
}
output "spanner_instances_force_destroy" {
  description = "Map of force_destroy values across all spanner_instances, keyed the same as var.spanner_instances except keys with no force_destroy are omitted"
  value       = { for k, v in google_spanner_instance.spanner_instances : k => v.force_destroy if v.force_destroy != null }
}
output "spanner_instances_instance_type" {
  description = "Map of instance_type values across all spanner_instances, keyed the same as var.spanner_instances except keys with no instance_type are omitted"
  value       = { for k, v in google_spanner_instance.spanner_instances : k => v.instance_type if v.instance_type != null && length(v.instance_type) > 0 }
}
output "spanner_instances_labels" {
  description = "Map of labels values across all spanner_instances, keyed the same as var.spanner_instances except keys with no labels are omitted"
  value       = { for k, v in google_spanner_instance.spanner_instances : k => v.labels if v.labels != null && length(v.labels) > 0 }
}
output "spanner_instances_name" {
  description = "Map of name values across all spanner_instances, keyed the same as var.spanner_instances except keys with no name are omitted"
  value       = { for k, v in google_spanner_instance.spanner_instances : k => v.name if v.name != null && length(v.name) > 0 }
}
output "spanner_instances_num_nodes" {
  description = "Map of num_nodes values across all spanner_instances, keyed the same as var.spanner_instances except keys with no num_nodes are omitted"
  value       = { for k, v in google_spanner_instance.spanner_instances : k => v.num_nodes if v.num_nodes != null }
}
output "spanner_instances_processing_units" {
  description = "Map of processing_units values across all spanner_instances, keyed the same as var.spanner_instances except keys with no processing_units are omitted"
  value       = { for k, v in google_spanner_instance.spanner_instances : k => v.processing_units if v.processing_units != null }
}
output "spanner_instances_project" {
  description = "Map of project values across all spanner_instances, keyed the same as var.spanner_instances except keys with no project are omitted"
  value       = { for k, v in google_spanner_instance.spanner_instances : k => v.project if v.project != null && length(v.project) > 0 }
}
output "spanner_instances_state" {
  description = "Map of state values across all spanner_instances, keyed the same as var.spanner_instances except keys with no state are omitted"
  value       = { for k, v in google_spanner_instance.spanner_instances : k => v.state if v.state != null && length(v.state) > 0 }
}
output "spanner_instances_terraform_labels" {
  description = "Map of terraform_labels values across all spanner_instances, keyed the same as var.spanner_instances except keys with no terraform_labels are omitted"
  value       = { for k, v in google_spanner_instance.spanner_instances : k => v.terraform_labels if v.terraform_labels != null && length(v.terraform_labels) > 0 }
}


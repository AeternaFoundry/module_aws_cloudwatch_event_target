output "cloudwatch_event_targets_id" {
  description = "Map of id values across all cloudwatch_event_targets, keyed the same as var.cloudwatch_event_targets"
  value       = { for k, v in aws_cloudwatch_event_target.cloudwatch_event_targets : k => v.id if v.id != null && length(v.id) > 0 }
}
output "cloudwatch_event_targets_appsync_target" {
  description = "Map of appsync_target values across all cloudwatch_event_targets, keyed the same as var.cloudwatch_event_targets"
  value       = { for k, v in aws_cloudwatch_event_target.cloudwatch_event_targets : k => one(v.appsync_target) if v.appsync_target != null && length(v.appsync_target) > 0 }
}
output "cloudwatch_event_targets_arn" {
  description = "Map of arn values across all cloudwatch_event_targets, keyed the same as var.cloudwatch_event_targets"
  value       = { for k, v in aws_cloudwatch_event_target.cloudwatch_event_targets : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "cloudwatch_event_targets_batch_target" {
  description = "Map of batch_target values across all cloudwatch_event_targets, keyed the same as var.cloudwatch_event_targets"
  value       = { for k, v in aws_cloudwatch_event_target.cloudwatch_event_targets : k => one(v.batch_target) if v.batch_target != null && length(v.batch_target) > 0 }
}
output "cloudwatch_event_targets_dead_letter_config" {
  description = "Map of dead_letter_config values across all cloudwatch_event_targets, keyed the same as var.cloudwatch_event_targets"
  value       = { for k, v in aws_cloudwatch_event_target.cloudwatch_event_targets : k => one(v.dead_letter_config) if v.dead_letter_config != null && length(v.dead_letter_config) > 0 }
}
output "cloudwatch_event_targets_ecs_target" {
  description = "Map of ecs_target values across all cloudwatch_event_targets, keyed the same as var.cloudwatch_event_targets"
  value       = { for k, v in aws_cloudwatch_event_target.cloudwatch_event_targets : k => one(v.ecs_target) if v.ecs_target != null && length(v.ecs_target) > 0 }
}
output "cloudwatch_event_targets_event_bus_name" {
  description = "Map of event_bus_name values across all cloudwatch_event_targets, keyed the same as var.cloudwatch_event_targets"
  value       = { for k, v in aws_cloudwatch_event_target.cloudwatch_event_targets : k => v.event_bus_name if v.event_bus_name != null && length(v.event_bus_name) > 0 }
}
output "cloudwatch_event_targets_force_destroy" {
  description = "Map of force_destroy values across all cloudwatch_event_targets, keyed the same as var.cloudwatch_event_targets"
  value       = { for k, v in aws_cloudwatch_event_target.cloudwatch_event_targets : k => v.force_destroy if v.force_destroy != null }
}
output "cloudwatch_event_targets_http_target" {
  description = "Map of http_target values across all cloudwatch_event_targets, keyed the same as var.cloudwatch_event_targets"
  value       = { for k, v in aws_cloudwatch_event_target.cloudwatch_event_targets : k => one(v.http_target) if v.http_target != null && length(v.http_target) > 0 }
}
output "cloudwatch_event_targets_input" {
  description = "Map of input values across all cloudwatch_event_targets, keyed the same as var.cloudwatch_event_targets"
  value       = { for k, v in aws_cloudwatch_event_target.cloudwatch_event_targets : k => v.input if v.input != null && length(v.input) > 0 }
}
output "cloudwatch_event_targets_input_path" {
  description = "Map of input_path values across all cloudwatch_event_targets, keyed the same as var.cloudwatch_event_targets"
  value       = { for k, v in aws_cloudwatch_event_target.cloudwatch_event_targets : k => v.input_path if v.input_path != null && length(v.input_path) > 0 }
}
output "cloudwatch_event_targets_input_transformer" {
  description = "Map of input_transformer values across all cloudwatch_event_targets, keyed the same as var.cloudwatch_event_targets"
  value       = { for k, v in aws_cloudwatch_event_target.cloudwatch_event_targets : k => one(v.input_transformer) if v.input_transformer != null && length(v.input_transformer) > 0 }
}
output "cloudwatch_event_targets_kinesis_target" {
  description = "Map of kinesis_target values across all cloudwatch_event_targets, keyed the same as var.cloudwatch_event_targets"
  value       = { for k, v in aws_cloudwatch_event_target.cloudwatch_event_targets : k => one(v.kinesis_target) if v.kinesis_target != null && length(v.kinesis_target) > 0 }
}
output "cloudwatch_event_targets_redshift_target" {
  description = "Map of redshift_target values across all cloudwatch_event_targets, keyed the same as var.cloudwatch_event_targets"
  value       = { for k, v in aws_cloudwatch_event_target.cloudwatch_event_targets : k => one(v.redshift_target) if v.redshift_target != null && length(v.redshift_target) > 0 }
}
output "cloudwatch_event_targets_region" {
  description = "Map of region values across all cloudwatch_event_targets, keyed the same as var.cloudwatch_event_targets"
  value       = { for k, v in aws_cloudwatch_event_target.cloudwatch_event_targets : k => v.region if v.region != null && length(v.region) > 0 }
}
output "cloudwatch_event_targets_retry_policy" {
  description = "Map of retry_policy values across all cloudwatch_event_targets, keyed the same as var.cloudwatch_event_targets"
  value       = { for k, v in aws_cloudwatch_event_target.cloudwatch_event_targets : k => one(v.retry_policy) if v.retry_policy != null && length(v.retry_policy) > 0 }
}
output "cloudwatch_event_targets_role_arn" {
  description = "Map of role_arn values across all cloudwatch_event_targets, keyed the same as var.cloudwatch_event_targets"
  value       = { for k, v in aws_cloudwatch_event_target.cloudwatch_event_targets : k => v.role_arn if v.role_arn != null && length(v.role_arn) > 0 }
}
output "cloudwatch_event_targets_rule" {
  description = "Map of rule values across all cloudwatch_event_targets, keyed the same as var.cloudwatch_event_targets"
  value       = { for k, v in aws_cloudwatch_event_target.cloudwatch_event_targets : k => v.rule if v.rule != null && length(v.rule) > 0 }
}
output "cloudwatch_event_targets_run_command_targets" {
  description = "Map of run_command_targets values across all cloudwatch_event_targets, keyed the same as var.cloudwatch_event_targets"
  value       = { for k, v in aws_cloudwatch_event_target.cloudwatch_event_targets : k => v.run_command_targets if v.run_command_targets != null && length(v.run_command_targets) > 0 }
}
output "cloudwatch_event_targets_sagemaker_pipeline_target" {
  description = "Map of sagemaker_pipeline_target values across all cloudwatch_event_targets, keyed the same as var.cloudwatch_event_targets"
  value       = { for k, v in aws_cloudwatch_event_target.cloudwatch_event_targets : k => one(v.sagemaker_pipeline_target) if v.sagemaker_pipeline_target != null && length(v.sagemaker_pipeline_target) > 0 }
}
output "cloudwatch_event_targets_sqs_target" {
  description = "Map of sqs_target values across all cloudwatch_event_targets, keyed the same as var.cloudwatch_event_targets"
  value       = { for k, v in aws_cloudwatch_event_target.cloudwatch_event_targets : k => one(v.sqs_target) if v.sqs_target != null && length(v.sqs_target) > 0 }
}
output "cloudwatch_event_targets_target_id" {
  description = "Map of target_id values across all cloudwatch_event_targets, keyed the same as var.cloudwatch_event_targets"
  value       = { for k, v in aws_cloudwatch_event_target.cloudwatch_event_targets : k => v.target_id if v.target_id != null && length(v.target_id) > 0 }
}


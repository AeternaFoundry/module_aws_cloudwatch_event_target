variable "cloudwatch_event_targets" {
  description = <<EOT
Map of cloudwatch_event_targets, attributes below
Required:
    - arn
    - rule
Optional:
    - event_bus_name
    - force_destroy
    - input
    - input_path
    - region
    - role_arn
    - target_id
    - appsync_target (block):
        - graphql_operation (optional)
    - batch_target (block):
        - array_size (optional)
        - job_attempts (optional)
        - job_definition (required)
        - job_name (required)
    - dead_letter_config (block):
        - arn (optional)
    - ecs_target (block):
        - capacity_provider_strategy (optional, block):
            - base (optional)
            - capacity_provider (required)
            - weight (optional)
        - enable_ecs_managed_tags (optional)
        - enable_execute_command (optional)
        - group (optional)
        - launch_type (optional)
        - network_configuration (optional, block):
            - assign_public_ip (optional)
            - security_groups (optional)
            - subnets (required)
        - ordered_placement_strategy (optional, block):
            - field (optional)
            - type (required)
        - placement_constraint (optional, block):
            - expression (optional)
            - type (required)
        - platform_version (optional)
        - propagate_tags (optional)
        - tags (optional)
        - task_count (optional)
        - task_definition_arn (required)
    - http_target (block):
        - header_parameters (optional)
        - path_parameter_values (optional)
        - query_string_parameters (optional)
    - input_transformer (block):
        - input_paths (optional)
        - input_template (required)
    - kinesis_target (block):
        - partition_key_path (optional)
    - redshift_target (block):
        - database (required)
        - db_user (optional)
        - secrets_manager_arn (optional)
        - sql (optional)
        - statement_name (optional)
        - with_event (optional)
    - retry_policy (block):
        - maximum_event_age_in_seconds (optional)
        - maximum_retry_attempts (optional)
    - run_command_targets (block):
        - key (required)
        - values (required)
    - sagemaker_pipeline_target (block):
        - pipeline_parameter_list (optional, block):
            - name (required)
            - value (required)
    - sqs_target (block):
        - message_group_id (optional)
EOT

  type = map(object({
    arn            = string
    rule           = string
    event_bus_name = optional(string)
    force_destroy  = optional(bool)
    input          = optional(string)
    input_path     = optional(string)
    region         = optional(string)
    role_arn       = optional(string)
    target_id      = optional(string)
    appsync_target = optional(object({
      graphql_operation = optional(string)
    }))
    batch_target = optional(object({
      array_size     = optional(number)
      job_attempts   = optional(number)
      job_definition = string
      job_name       = string
    }))
    dead_letter_config = optional(object({
      arn = optional(string)
    }))
    ecs_target = optional(object({
      capacity_provider_strategy = optional(list(object({
        base              = optional(number)
        capacity_provider = string
        weight            = optional(number)
      })))
      enable_ecs_managed_tags = optional(bool)
      enable_execute_command  = optional(bool)
      group                   = optional(string)
      launch_type             = optional(string)
      network_configuration = optional(object({
        assign_public_ip = optional(bool)
        security_groups  = optional(set(string))
        subnets          = set(string)
      }))
      ordered_placement_strategy = optional(list(object({
        field = optional(string)
        type  = string
      })))
      placement_constraint = optional(list(object({
        expression = optional(string)
        type       = string
      })))
      platform_version    = optional(string)
      propagate_tags      = optional(string)
      tags                = optional(map(string))
      task_count          = optional(number)
      task_definition_arn = string
    }))
    http_target = optional(object({
      header_parameters       = optional(map(string))
      path_parameter_values   = optional(list(string))
      query_string_parameters = optional(map(string))
    }))
    input_transformer = optional(object({
      input_paths    = optional(map(string))
      input_template = string
    }))
    kinesis_target = optional(object({
      partition_key_path = optional(string)
    }))
    redshift_target = optional(object({
      database            = string
      db_user             = optional(string)
      secrets_manager_arn = optional(string)
      sql                 = optional(string)
      statement_name      = optional(string)
      with_event          = optional(bool)
    }))
    retry_policy = optional(object({
      maximum_event_age_in_seconds = optional(number)
      maximum_retry_attempts       = optional(number)
    }))
    run_command_targets = optional(list(object({
      key    = string
      values = list(string)
    })))
    sagemaker_pipeline_target = optional(object({
      pipeline_parameter_list = optional(list(object({
        name  = string
        value = string
      })))
    }))
    sqs_target = optional(object({
      message_group_id = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_event_targets : (
        v.ecs_target == null || (v.ecs_target.ordered_placement_strategy == null || (length(v.ecs_target.ordered_placement_strategy) <= 5))
      )
    ])
    error_message = "Each ordered_placement_strategy list must contain at most 5 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_event_targets : (
        v.ecs_target == null || (v.ecs_target.placement_constraint == null || (length(v.ecs_target.placement_constraint) <= 10))
      )
    ])
    error_message = "Each placement_constraint list must contain at most 10 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_event_targets : (
        v.run_command_targets == null || (length(v.run_command_targets) <= 5)
      )
    ])
    error_message = "Each run_command_targets list must contain at most 5 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_event_targets : (
        v.sagemaker_pipeline_target == null || (v.sagemaker_pipeline_target.pipeline_parameter_list == null || (length(v.sagemaker_pipeline_target.pipeline_parameter_list) <= 200))
      )
    ])
    error_message = "Each pipeline_parameter_list list must contain at most 200 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_event_targets : (
        v.appsync_target == null || (v.appsync_target.graphql_operation == null || (length(v.appsync_target.graphql_operation) >= 1 && length(v.appsync_target.graphql_operation) <= 1048576))
      )
    ])
    error_message = "must be between 1 and 1048576 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_event_targets : (
        v.batch_target == null || (v.batch_target.array_size == null || (v.batch_target.array_size >= 2 && v.batch_target.array_size <= 10000))
      )
    ])
    error_message = "must be between 2 and 10000"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_event_targets : (
        v.batch_target == null || (v.batch_target.job_attempts == null || (v.batch_target.job_attempts >= 1 && v.batch_target.job_attempts <= 10))
      )
    ])
    error_message = "must be between 1 and 10"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_event_targets : (
        v.ecs_target == null || (v.ecs_target.group == null || (length(v.ecs_target.group) >= 1 && length(v.ecs_target.group) <= 255))
      )
    ])
    error_message = "must be between 1 and 255 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_event_targets : (
        v.ecs_target == null || (v.ecs_target.platform_version == null || (length(v.ecs_target.platform_version) >= 0 && length(v.ecs_target.platform_version) <= 1600))
      )
    ])
    error_message = "must be between 0 and 1600 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_event_targets : (
        v.input == null || ((can(jsondecode(v.input))) && (length(v.input) >= 0 && length(v.input) <= 8192))
      )
    ])
    error_message = "all of: must be valid JSON; must be between 0 and 8192 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_event_targets : (
        v.input_path == null || (length(v.input_path) >= 0 && length(v.input_path) <= 256)
      )
    ])
    error_message = "must be between 0 and 256 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_event_targets : (
        v.input_transformer == null || (length(v.input_transformer.input_template) >= 1 && length(v.input_transformer.input_template) <= 8192)
      )
    ])
    error_message = "must be between 1 and 8192 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_event_targets : (
        v.kinesis_target == null || (v.kinesis_target.partition_key_path == null || (length(v.kinesis_target.partition_key_path) >= 1 && length(v.kinesis_target.partition_key_path) <= 256))
      )
    ])
    error_message = "must be between 1 and 256 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_event_targets : (
        v.redshift_target == null || (v.redshift_target.db_user == null || (length(v.redshift_target.db_user) >= 1 && length(v.redshift_target.db_user) <= 128))
      )
    ])
    error_message = "must be between 1 and 128 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_event_targets : (
        v.redshift_target == null || (v.redshift_target.sql == null || (length(v.redshift_target.sql) >= 1 && length(v.redshift_target.sql) <= 100000))
      )
    ])
    error_message = "must be between 1 and 100000 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_event_targets : (
        v.redshift_target == null || (v.redshift_target.statement_name == null || (length(v.redshift_target.statement_name) >= 1 && length(v.redshift_target.statement_name) <= 500))
      )
    ])
    error_message = "must be between 1 and 500 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_event_targets : (
        v.retry_policy == null || (v.retry_policy.maximum_event_age_in_seconds == null || (v.retry_policy.maximum_event_age_in_seconds >= 0 && v.retry_policy.maximum_event_age_in_seconds <= 86400))
      )
    ])
    error_message = "must be between 0 and 86400"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_event_targets : (
        v.retry_policy == null || (v.retry_policy.maximum_retry_attempts == null || (v.retry_policy.maximum_retry_attempts >= 0 && v.retry_policy.maximum_retry_attempts <= 185))
      )
    ])
    error_message = "must be between 0 and 185"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_event_targets : (
        v.target_id == null || (length(v.target_id) <= 64)
      )
    ])
    error_message = "[from validateTargetID: invalid when len(value) > 64]"
  }
  # Note: 23 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}


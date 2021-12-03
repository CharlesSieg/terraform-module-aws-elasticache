variable "alarm_actions" {
  default     = []
  description = "Alarm action list"
  type        = list(string)
}

variable "alarm_cpu_threshold_percent" {
  default     = 75
  description = "CPU threshold alarm level"
  type        = number
}

variable "alarm_memory_threshold_percentage" {
  default     = 80
  description = "Ram threshold alarm level"
  type        = number
}

variable "allowed_cidrs" {
  default     = []
  description = "A list of CIDRs to allow access to."
  type        = list(string)
}

variable "additional_security_groups" {
  default     = []
  description = "A list of Security Group IDs to allow access to."
  type        = string
}

variable "apply_immediately" {
  default     = true
  description = "Specifies whether any modifications are applied immediately, or during the next maintenance window."
  type        = bool
}

variable "az_mode" {
  default     = "single-az"
  description = "Whether the nodes in this Memcached node group are created in a single Availability Zone or created across multiple Availability Zones in the cluster's region. Valid values for this parameter are single-az or cross-az. If cross-az is specified, num_cache_nodes must be greater than 1."
  type        = string
}

variable "cluster_id" {
  description = "Group identifier. ElastiCache converts this name to lowercase. Changing this value will re-create the resource."
  type        = string
}

variable "engine_version" {
  default     = "4.0.10"
  description = "Version number of the cache engine to be used."
  type        = string
}

variable "internal_dns_zone_id" {
  description = "Internal dns zone id"
  type        = string
}

variable "maintenance_window" {
  default     = "fri:08:00-fri:09:00"
  description = "Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period."
  type        = string
}

variable "node_type" {
  default     = "cache.t2.small"
  description = "The instance class used."
  type        = string
}

variable "notification_topic_arn" {
  default     = null
  description = "ARN of an SNS topic to send ElastiCache notifications to."
  type        = string
}

variable "num_cache_nodes" {
  default     = 1
  description = "The initial number of cache nodes that the cache cluster will have. This value must be between 1 and 40."
  type        = number
}

variable "ok_actions" {
  default     = []
  description = "The list of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Number (ARN)"
  type        = list(string)
}

variable "parameter_group_name" {
  default     = "default.memcached1.4"
  description = "The name of the parameter group to associate with this cache cluster."
  type        = string
}

variable "parameters" {
  default     = []
  description = "A list of ElastiCache parameters to apply. Supplying this list overrides use of an existing parameter group specified by parameter_group_name."
  type        = list(string)
}

variable "port" {
  default     = 11211
  description = "The port number on which each of the cache nodes will accept connections."
  type        = number
}

variable "preferred_availability_zones" {
  default     = []
  description = "List of Availability Zones in which cache nodes are created. If creating the cluster in an Amazon VPC, nodes can only be placed in Availability Zones that are associated with the subnets in the selected subnet group. The number of Availability Zones listed must equal the value of num_cache_nodes."
  type        = list(string)
}

variable "subnet_ids" {
  description = "Required. List of VPC Subnet IDs for the cache subnet group."
  type        = list(string)
}

variable "tags" {
  default     = {}
  description = "Key-value map of resource tags."
  type        = map(string)
}

variable "vpc_id" {
  description = "Required. ID of the VPC in which this cluster is provisioned."
  type        = string
}

variable metric_name {
    type = list(string)
    default = ["CPUUtilization", "DiskWriteOps"]
}

variable "InsId" {
    type = list(string)
    default = ["i-0307cd4b4265c1aa0", "i-03d501112b3d30c7b"]
  
}

variable "alarms" {
   type = map(string)
   default = {}
}
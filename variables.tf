variable metric_name {
    type = list(string)
    default = ["CPUUtilization", "DiskWriteOps"]
}

variable "InsId" {
    type = list(string)
    default = ["i-0307cd4b4265c", "i-03d50111d30c7b"]
}

variable "alarms" {
   type = map(string)
   default = {}
}
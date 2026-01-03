
locals {
    alarms = flatten ([
      for metric in var.metric_name : [
        for instanceid in var.InsId : {
          metric = metric
          instanceid = instanceid
        }
      ]
    ])
}

output "test" {
  value = local.alarms
  
}

resource "aws_cloudwatch_metric_alarm" "ec2alarms" {
  #for_each = { for metrics in var.metric : metrics => metrics }
  for_each = { for alarms in local.alarms : "${alarms.metric}-${alarms.instanceid}" => alarms }
  alarm_name = format("High-EC2-Utilization-Alarm-for-%s-monitoring-and-instance-is-%s", each.value.metric, each.value.instanceid)
  evaluation_periods = 1
  datapoints_to_alarm = 1
  comparison_operator = "LessThanThreshold"
  namespace = "AWS/EC2"
  metric_name = each.value.metric
  period = 60
  statistic = "Minimum"
  threshold = 5
  alarm_description = format("This is being used for EC2 %s monitoring", each.value.metric)
  alarm_actions = ["arn:aws:sns:us-east-1:707318434536:AWS-ALARM-JITEN"]
  dimensions = {
    InstanceId = each.value.instanceid
  }
}
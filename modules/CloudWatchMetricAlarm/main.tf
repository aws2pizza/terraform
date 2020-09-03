resource "aws_cloudwatch_metric_alarm" "create" {
  count = length(var.CloudWatchMetricAlarm) != 0 ? length(var.CloudWatchMetricAlarm) : 0

  alarm_name = format("%s%s%s%s%s",
    "MetricAlarm",
    var.CloudWatchMetricAlarm[count.index].statistic != "null" ? format("-%s", var.CloudWatchMetricAlarm[count.index].statistic) : "",
    var.CloudWatchMetricAlarm[count.index].alarm_name != "null" ? format("-%s", var.CloudWatchMetricAlarm[count.index].alarm_name) : "",
    var.CloudWatchMetricAlarm[count.index].tags[1] != "null" ? format("-%s", var.CloudWatchMetricAlarm[count.index].tags[1]) : "",
    var.CloudWatchMetricAlarm[count.index].tags[2] != "null" ? format("-%s", var.CloudWatchMetricAlarm[count.index].tags[2]) : ""
  )

  comparison_operator = var.CloudWatchMetricAlarm[count.index].comparison_operator
  metric_name         = var.CloudWatchMetricAlarm[count.index].metric_name
  statistic           = var.CloudWatchMetricAlarm[count.index].statistic
  namespace           = var.CloudWatchMetricAlarm[count.index].namespace
  period              = var.CloudWatchMetricAlarm[count.index].period
  evaluation_periods  = var.CloudWatchMetricAlarm[count.index].evaluation_periods
  threshold           = var.CloudWatchMetricAlarm[count.index].threshold

  alarm_actions = var.alarm_actions
  ok_actions    = var.ok_actions

  dimensions = {
    AutoScalingGroupName = var.AutoScalingGroupName
  }
}

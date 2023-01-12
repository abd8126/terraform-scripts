# resource "aws_cloudwatch_log_group" "root_usage_filter" {
#   name = "root_usage_filter"

#   tags = {
#     Environment = "production"
#     Application = "serviceA"
#   }
# }

# resource "aws_cloudwatch_log_metric_filter" "root_usage_filter" {
#   name          = "root_usage_filter"
#   pattern       = "user=root"
#   log_group_name = aws_cloudwatch_log_group.root_usage_filter.name
#   depends_on = [
#     aws_cloudwatch_log_group.root_usage_filter
#   ]
#   metric_transformation {
#     name      = "RootUserEventCount"
#     namespace = "CloudTrailMetrics"
#     value     = "1"
#   }
# }

# resource "aws_cloudwatch_metric_alarm" "root_usage_alarm" {
#   alarm_name          = "root_usage_alarm"
#   comparison_operator = "GreaterThanThreshold"
#   threshold           = 1
#   evaluation_periods  = "1"
#   metric_name         = "root_usage_filter"
#   namespace           = "AWS/Logs"
#   alarm_description   = "This alarm will trigger when usage of the root account is detected"
#   alarm_actions       = [aws_sns_topic.root_usage_alarm.arn]
#   statistic           = "SampleCount"
#   period              = "60"
#   dimensions = {
#     LogGroupName = aws_cloudwatch_log_group.root_usage_filter.name
#     FilterName = aws_cloudwatch_log_metric_filter.root_usage_filter.name
#   }
#   depends_on = [
#     aws_cloudwatch_log_metric_filter.root_usage_filter
#   ]
# }
# resource "aws_sns_topic" "root_usage_alarm" {
#   name = "alert-root_usage_alarm"
# }
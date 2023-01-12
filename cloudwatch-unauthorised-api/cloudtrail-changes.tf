# resource "aws_cloudwatch_metric_alarm" "CloudWatchAlarm" {
#   alarm_name = "cloudtrail_changes"
#   alarm_description = "A CloudWatch Alarm that triggers when changes are made to CloudTrail."
#   metric_name = "CloudTrailEventCount"
#   namespace = "CloudTrailMetrics"
#   statistic = "Sum"
#   period = "300"
#   threshold = "1"
#   evaluation_periods = "1"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   alarm_actions = [ module.SnsTopic.arn ]
#   treat_missing_data = "notBreaching"
# }
# resource "aws_cloudwatch_log_group" "test" {
#   name = "cloudtrail_changes"

#   tags = {
#     Environment = "production"
#     Application = "serviceA"
#   }
# }
# resource "aws_cloudwatch_log_metric_filter" "MetricFilter" {
#   log_group_name = aws_cloudwatch_log_group.test.name
#   pattern = "{ ($.eventName = CreateTrail) || ($.eventName = UpdateTrail) || ($.eventName = DeleteTrail) || ($.eventName = StartLogging) || ($.eventName = StopLogging) }"
#   name = "CloudTrailEventCount-cloudtrail_changes"

#   metric_transformation {
#     name = "CloudTrailEventCount"
#     value = "1"
#     namespace = "CloudTrailMetrics"
#   }

# }

# module "SnsTopic" {
#   source = "github.com/asecurecloud/tf_sns_email"

#   display_name = "alarm-action"
#   email_address = "anubhav.glau@gmail.com"
#   stack_name = "cloudtrail-changes-stack-SnsTopic-cDaNI"
# }
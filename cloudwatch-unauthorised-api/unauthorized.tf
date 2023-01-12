# resource "aws_cloudwatch_log_group" "test" {
#   name = "Yada"

#   tags = {
#     Environment = "production"
#     Application = "serviceA"
#   }
# }
# resource "aws_cloudwatch_log_metric_filter" "test" {
#   name           = "MyAppAccessCount"
#   pattern        = "\"unauthorized\""
#   log_group_name = aws_cloudwatch_log_group.test.name
#   depends_on = [
#     aws_cloudwatch_log_group.test
#   ]

#   metric_transformation {
#     name      = "EventCount"
#     namespace = "YourNamespace"
#     value     = "1"
#   }
# }
# resource "aws_cloudwatch_metric_alarm" "test" {
#   alarm_name                = "UnauthorizedAPICallsAlarm"
#   comparison_operator       = "GreaterThanOrEqualToThreshold"
#   evaluation_periods        = "1"
#   metric_name               = "Invocations"
#   namespace                 = "AWS/Logs"
#   period                    = "60"
#   statistic                 = "Average"
#   threshold                 = "1"
#   alarm_description         = "This metric monitors ec2 cpu utilization"
#   alarm_actions       = [aws_sns_topic.test.arn]
#   dimensions = {
#     LogGroupName = aws_cloudwatch_log_group.test.name,
#     FilterName = aws_cloudwatch_log_metric_filter.test.name
#   }
#   depends_on = [
#     aws_cloudwatch_log_group.test, aws_cloudwatch_log_metric_filter.test, aws_sns_topic.test
#   ]
# }
# resource "aws_sns_topic" "test" {
#   name = "alerts-unauthorized-api-calls"
# }

var AWS = require('aws-sdk');
AWS.config.update({region:'us-east-1'});

var cw = new AWS.CloudWatch({apiVersion: '2010-08-01'});

var params = {
  AlarmName: 'Demo_Web_Server_CPU_Utilization', 
  ComparisonOperator: 'GreaterThanThreshold',
  EvaluationPeriods: 1,
  MetricName: 'CPUUtilization',
  Namespace: 'AWS/EC2',
  Period: 60,
  Statistic: 'Average',
  Threshold: 70.0,
  ActionsEnabled: false,
  AlarmDescription: 'Alarm when server CPU exceeds 70%',
  Dimensions: [
    {
      Name: 'code-demo-instance',
      Value: 'i-08c5bbc730cd1594c'
    },
  ],
  Unit: 'Seconds'
};

cw.putMetricAlarm(params, function(err, data) {
  if (err) {
    console.log("Error", err);
  } else {
    console.log("Success", data);
  }
});
var AWS = require('aws-sdk');
AWS.config.update({region:'us-east-1'});

var cw = new AWS.CloudWatch({apiVersion: '2010-08-01'});

cw.describeAlarms({StateValue: 'INSUFFICIENT_DATA'}, 
  function(err, data) {
    if (err) {
      console.log("Error", err);
    } else {
        data.MetricAlarms.forEach(function (item, index, array) {
        console.log(item.AlarmName);
    });
  }
});
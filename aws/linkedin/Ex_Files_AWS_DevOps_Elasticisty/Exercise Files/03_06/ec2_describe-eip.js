var AWS = require('aws-sdk');
AWS.config.update({region:'us-east-1'});

var ec2 = new AWS.EC2({apiVersion: '2016-11-15'});

var params = {
};

ec2.describeAddresses(params, function(err, data) {
   if (err) {
      console.log("Error", err);
   } else {
      console.log("Success", JSON.stringify(data.Addresses));
   }
});
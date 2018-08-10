var AWS = require('aws-sdk');
AWS.config.update({region:'us-east-1'});

var ec2 = new AWS.EC2({apiVersion: '2016-11-15'});

var paramsAllocateAddress = {
   Domain: 'vpc'
};

ec2.allocateAddress(paramsAllocateAddress, function(err, data) {
   if (err) {
      console.log("Address Not Allocated", err);
   } else {
      console.log("Address allocated:", data.AllocationId);
      var paramsAssociateAddress = {
        AllocationId: data.AllocationId,
        InstanceId: 'i-08c5bbc730cd1594c'
      };
      ec2.associateAddress(paramsAssociateAddress, 
        function(err, data) {
          if (err) {
            console.log("Address Not Associated", err);
          } else {
            console.log("Address associated:", data.AssociationId);
          }
        });
   }
});
# list s3 buckets, good way to test awscli basic configuration
aws s3 ls

# for HA - list AZs
aws ec2 describe-availability-zones

# for HA - describe health of your ALB
aws elb describe-instance-health --load-balancer-name classicelb

# for Elasticity - describe EC2 resource utlitization alarms
aws cloudwatch describe-alarms --alarm-names awsec2-i-0cf4e847f63c25bac-CPU-Utilization

# for Elasticity - create a new DynamoDB table with parameter values
aws dynamodb create-table --table-name MusicCollection --attribute-definitions AttributeName=Artist,AttributeType=S AttributeName=SongTitle,AttributeType=S --key-schema AttributeName=Artist,KeyType=HASH AttributeName=SongTitle,KeyType=RANGE --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 
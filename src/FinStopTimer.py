# def my_handler(event,context):
# 	return event["time"]
import boto3
import os
# Enter the region your instances are in. Include only the region without specifying Availability Zone; e.g., 'us-east-1'

def lambda_handler(event, context):
    client = boto3.client('ec2')
    region = os.environ.get('REGION')
    tag = os.environ.get('TAG')
    print(tag);
    # ec2 = boto3.resource('ec2', region_name = region)
    # instances = ec2.instances.filter(
    # 	Filters = [{'Name':'tag-value', 'Values':[tag]}])
    response = client.describe_instances(
        Filters = [{'Name':'tag-value', 'Values':[tag]},
        {'Name':'instance-state-name', 'Values':['running']}]
        )
    # for instance in instances:
    	# print(instance)
    # instances.stop_instances()
    # return instance.id
    InstanceList =  list()
    for r in response['Reservations']:
        # print(r['Instances'])
        for instance in r['Instances']:
            print(instance['InstanceId'])
            InstanceList.append(instance['InstanceId'])
    client.stop_instances(InstanceIds = InstanceList)
# def my_handler(event,context):
# 	return event["time"]
import boto3
import os
# Enter the region your instances are in. Include only the region without specifying Availability Zone; e.g., 'us-east-1'

def lambda_handler(event, context):
    region = os.environ.get('REGION')
    tag = os.environ.get('TAG')
    print(tag);
    ec2 = boto3.resource('ec2', region_name = region)
    instances = ec2.instances.filter(
    	Filters = [{'Name':'tag-value', 'Values':[tag]}])
    print(instances);
    for instance in instances:
    	print(instance.id)
    instances.stop()
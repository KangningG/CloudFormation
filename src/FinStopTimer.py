# def my_handler(event,context):
#   return event["time"]
import boto3
import os
# Enter the region your instances are in. Include only the region without specifying Availability Zone; e.g., 'us-east-1'

def lambda_handler(event, context):
    client = boto3.client('ec2')
    region = os.environ.get('REGION')
    taglist = os.environ.get('TAG')
    tags = list()
    for tag in taglist.split(','):
         tags.append(tag)
    print(tags)
    response = client.describe_instances(
        Filters = [{'Name':'tag:Name', 'Values':tags},
        {'Name':'instance-state-name', 'Values':['running']}]
        )
    InstanceList =  list()
    for r in response['Reservations']:
        # print(r['Instances'])
        for instance in r['Instances']:
            print(instance['InstanceId'])
            InstanceList.append(instance['InstanceId'])
    
    client.stop_instances(InstanceIds = InstanceList)
# def my_handler(event,context):
#   return event["time"]
import boto3
import os
# Enter the region your instances are in. Include only the region without specifying Availability Zone; e.g., 'us-east-1'

def lambda_handler(event, context):
    # client = boto3.client('ec2')
    if os.environ.get('REGION') == "":
        fakeClient = boto3.client('ec2')
        regions = [region['RegionName'] for region in fakeClient.describe_regions()['Regions']]
    else:
        regions = [os.environ.get('REGION')]
    taglist = os.environ.get('TAG')
    tags = list()
    for region in regions:
        InstanceList =  list()
        client = boto3.client('ec2', region_name=region)
        for tag in taglist.split(','):
            tags.append(tag)
            response = client.describe_instances(
                Filters = [{'Name':'tag:Name', 'Values':tags},
                {'Name':'instance-state-name', 'Values':['running']}]
                )
        for r in response['Reservations']:
            for instance in r['Instances']:
                # print(instance['InstanceId'])
                InstanceList.append(instance['InstanceId'])
                # print("{0} : {1}".format(region,tag))
        # print(InstanceList)
        if not InstanceList:
            continue
        else:
            client.stop_instances(InstanceIds = InstanceList)
# Highly Available Web App Deployment using CloudFormation

Deployment of a web application infrastructure that scales up and down according to load and that is replicated
to withstand failure in one zone.

The application is deployed using Infrastructure as Code with AWS CloudFormation.

This is the architecture diagram of the application:

![architecture diagram](docs/Architecture%20Diagram.png)

The deployed web app files are provided by Udacity.

## Deploying the Stack
To deploy the stack you will need to have the AWS CLI installed and configured.

1. Clone this repository or download it as a zip file and unzip it.
2. Create a JSON file with required parameters for the CloudFormation template. In this case it will be named `params.json`
    but you can name it whatever you want. For details about the available parameters check the 
    [infrastructure.yaml](src/infrastructure.yaml) file. This is how the file contents should look like:
    ```json5
    [
      {
        "ParameterKey": "BastionHostAllowedIpv4Address",
        "ParameterValue": "<IPv4 Address>"
      },
      {
        "ParameterKey": "BastionHostKeyName",
        "ParameterValue": "<Key Name>"
      },
      {
        "ParameterKey": "UdacityS3ReadOnlyEC2RoleName",
        "ParameterValue": "UdacityS3ReadOnlyEC2Role"
      }
    ]
    ```
3. Run the `aws cloudformation create-stack` command and pass to it the paths of the template and parameter files as
    follows:
    ```shell script
    aws cloudformation create-stack \
      --stack-name webapp \
      --capabilities CAPABILITY_NAMED_IAM \
      --template-body file://<path-to-directory>/infrastructure.yaml \
      --parameters file://<path-to-directory>/params.json
    ```
4. Open CloudFormation from the AWS console and wait for the stack until it is in the `CREATE_COMPLETE` state.
5. Open the `Outputs` tab and find the link next to the `LoadBalancerDnsName` key and open it to access the application.

To destroy the stack run the following command:
```shell script
aws cloudformation delete-stack --stack-name webapp
```
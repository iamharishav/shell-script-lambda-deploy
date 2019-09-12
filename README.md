# Shell script to deploy aws lambda function
* Set AWS access key & secrete key in the terminal
> $aws configure
* Configure lambda function names: 
> "dev_function_name" or "beta_function_name" or "pro_function" in the shell script
* Set the Node ENV variable
> $export NODE_ENV = "dev/beta/prod"
* Deploy the lambda function
> $ ./deploy.sh

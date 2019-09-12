if [ $NODE_ENV=='dev' ] 
then
functionName=DEV_FUNCTION_NAME
elif [ $NODE_ENV == 'beta' ]
then
functionName=BETA_FUNCTION_NAME
elif [ $NODE_ENV == 'prod' ]
then
functionName=PROD_FUNCTION_NAME
else
echo "NODE_ENV=$NODE_ENV is neither prod or beta so existing"
exit 
fi
echo "NODE_ENV=$NODE_ENV" 
rm -rf ../lambda.zip
node build.js || { echo 'Build failed' ; exit 1; }
zip -r9 ../lambda.zip * -x "*.git*" -x "*.html" -x "server.js" -x "*.sh" -x "assets*" -x "build.js"
cd ..
aws lambda --region ap-south-1 update-function-code --zip-file fileb://lambda.zip  --function-name $functionName
cd -

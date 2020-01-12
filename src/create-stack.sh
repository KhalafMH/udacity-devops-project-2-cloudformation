if test "$#" -ne 3; then
  echo "usage: $0 <stack-name> <template-file> <parameters-file>"
else
  aws cloudformation create-stack --stack-name "$1" --template-body "$2" --parameters "$3" \
      --tags Key=project,Value="$1",Key=course,Value=udacity-devops
fi

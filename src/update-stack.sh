if test "$#" -ne 3; then
  echo "usage: $0 <stack-name> <template-file> <parameters-file>"
else
  aws cloudformation update-stack --stack-name "$1" --template-body "$2" --parameters "$3"
fi

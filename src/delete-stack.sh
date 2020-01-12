if test "$#" -ne 1; then
  echo "usage: $0 <stack-name>"
else
  aws cloudformation delete-stack --stack-name "$1"
fi

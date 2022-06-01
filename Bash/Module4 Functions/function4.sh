#!/QOpenSys/pkgs/bin/bash

#  allocate global variables
var1='A'
var2='B'

# a quick function to allocate a local & global variable
test_function() {
  local var1='C'
  var2='D'
  echo "Inside function: var1 is: $var1, var2 is: $var2"
}

echo "Before executing function: var1 is: $var1, var2 is: $var2"

test_function

echo "After executing function: var1 is: $var1, var2 is: $var2"





















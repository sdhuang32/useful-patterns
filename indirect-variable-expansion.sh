#!/bin/bash

STAGE="TEST"
TEST_AWS_KEY="value"

# method 1, which I used before
indirect_var="${STAGE}_AWS_KEY"
export REACT_APP_AWS_KEY="${!indirect_var}"
echo "method 1: ${REACT_APP_AWS_KEY}"

# method 2
eval "export REACT_APP_AWS_KEY=\${${STAGE}_AWS_KEY}"
echo "method 2: ${REACT_APP_AWS_KEY}"

#!/bin/bash

# Verified in macos bash env only.

vars="SHELL
  mhtest
  SECURITYSESSIONID"

for v in $vars; do
    tmp=$(printenv |grep $v);

    # the following one-line command can do the same thing as the commented if statement below
    echo -n -e "${tmp:+${tmp/=/=\"}\"\n}"

    #if [ -n "${tmp}" ]; then
    #    echo "${tmp/=/=\"}\""
    #fi
done

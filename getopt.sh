#!/bin/bash

usage(){
    echo "usage: $0 [-d date]"
    echo "  e.g."
    echo "      $0"
    echo "      $0 20180707"

    exit 1
}

DATE=""
while getopts ":d:" arg; do
    case "${arg}" in
        d)
            DATE=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

echo "\$# = $#"
echo "DATE = $DATE"
echo "\$1 = $1"

if [ $# -gt 0 ]; then
    usage
fi

#!/bin/bash

#see http://askubuntu.com/questions/141791/is-there-a-way-to-update-all-java-related-alternatives

update-alternatives --get-selections | grep -i openjdk |
while read line
do
    alternative=$(echo $line | awk '{print $1}')
    path=$(echo $line | awk '{print $3}')
    newpath=$(echo $path | sed -e 's/java-6-openjdk/java-6-sun/')
    status=unchanged
    if [ -f $newpath ]
    then
        status=modified
        echo "-> update-alternatives --install /usr/bin/$alternative $alternative $newpath 1"
        update-alternatives --install /usr/bin/$alternative $alternative $newpath 1
        echo "-> update-alternatives --set $alternative $newpath"
        update-alternatives --set $alternative $newpath
    else
        echo "$alternative unchanged"
    fi
done

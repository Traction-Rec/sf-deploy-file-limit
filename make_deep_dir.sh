#!/bin/bash

cd force-app/main/default/

# Create 100 versions of the Hello.cls file
for i in {1..100}
do
  # Create the directory structure
  dir=$(seq -s '/' $i $((i+99)))
  mkdir -p $dir

  # Create the file with the appropriate class name
  file="$dir/Hello$i.cls"
  echo "public with sharing class Hello$i {}" > $file
  echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<ApexClass xmlns=\"http://soap.sforce.com/2006/04/metadata\">
    <apiVersion>61.0</apiVersion>
    <status>Active</status>
</ApexClass>" > $file-meta.xml
done
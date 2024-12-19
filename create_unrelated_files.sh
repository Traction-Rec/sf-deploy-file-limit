#!/bin/bash

cd force-app/main/default/_ignore_these_markdown_files

for ((i=1; i<=10000; i++))
do
    echo "contents $i" > "$i.md"
done

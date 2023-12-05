#!/bin/bash
i=1
while read p; do
	if [ $(( i % 12)) == $1 ]; then
	        FIELD1=$(echo $p| cut -d" " -f1)
        	PDBID=$(echo $FIELD1| cut -d"_" -f1)
	        CHAIN1=$(echo $FIELD1| cut -d"_" -f2)
        	./data_precompute_patches_one.sh $PDBID\_$CHAIN1
	fi
	i=$((i+1))
done < lists/all_peptides.txt

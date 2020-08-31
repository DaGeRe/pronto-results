sum=0
for project in commons-compress commons-csv commons-dbcp commons-fileupload commons-imaging commons-io commons-jcs commons-numbers commons-pool commons-text
do
	ssc=$(cat deps_$project.json | jq ".versions | keys[]" | wc -l)
	noChanges=$(cat nonChanges_$project.json | jq ".nonRunableReasons | keys[]" | wc -l)
	sum=$((sum+ssc+noChanges))
done
echo "Analyzed: $sum"

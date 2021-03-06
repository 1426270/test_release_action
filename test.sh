last_tags=($(git tag | tail -n 2));
for t in "${last_tags[@]}"; do
    echo tag: $t;
done
changed_files=($(git diff ${last_tags[0]} ${last_tags[1]} --name-only))
for f in "${changed_files[@]}"; do 
    filename=$(basename -- "$f");
    extension="${filename##*.}";
    filename="${filename%.*}";
    if [ "$extension" == "json" ]; then
        echo $filename, $extension;
    fi
done
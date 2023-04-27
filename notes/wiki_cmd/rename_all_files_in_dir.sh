for file in *
do
    # check if the file is a regular file
    if [ -f "$file" ]
    then
        # get the first letter of the file name
        first_letter=$(echo "$file" | head -c 1)
        
        # create the new file name with 0 after first letter
        new_file_name="$first_letter"0"${file:1}"
        
        # rename the file
        mv "$file" "$new_file_name"
        
        echo "Renamed $file to $new_file_name"
    fi
done
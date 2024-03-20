#!/bin/bash
current_time=$(date +"%H:%M (%D)")
#echo "current time is $current_time"
check=$(git status -s)

if [ -z "$check" ]; then
    echo -e "Auto Backup: Nothing to add"
    exit 0    
else
    git add .
    modified=()
    added=()
    renamed=()
    deleted=()

    git_stat=$(git status -s)
    while read -r line
    do    
        # echo "$line"
        status=${line::2}
        file_name=${line#* }
        #echo "$status"
        # echo $file_name
        case "$status" in 
            "A ")
                added+=$file_name","
                ;;
            "M ")
                modified+=$file_name","
                ;;
            "R ")
                renamed+=$file_name","
                ;;
            "D ")
                deleted+=$file_name","
        esac
    done < <(printf '%s\n' "$git_stat")

    changes_string=""

    if [ -n "$added" ]; then
        changes_string+="   ADDED: $added\n" 
    fi
    if [ -n "$modified" ]; then 
        changes_string+="MODIFIED: $modified\n" 
    fi
    if [ -n "$renamed" ]; then 
        changes_string+=" RENAMED: $renamed\n" 
    fi
    if [ -n "$deleted" ]; then 
        changes_string+=" DELETED: $deleted\n" 
    fi
    echo -e "Auto Backup $current_time\n$changes_string" > temp_file
    git commit -F temp_file
    rm temp_file
    git push origin main:auto_backup
fi

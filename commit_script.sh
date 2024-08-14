#!/bin/bash

# Repository directory (update this with your actual repo path)
repo="/Users/tharushikawodya/Developer/new"

# Navigate to the repository
cd $repo || { echo "Repository path not found"; exit 1; }

# File to modify (ensure this file exists in your repository)
file_to_modify="dummy_file.txt"


# Number of commits
total_commits=12

# Start date (ensure this is a recent date within this year)
start_date="2024-04-19 07:00:00"

# Custom commit message prefix
commit_message="Progress update"

# Create the specified number of commits
for i in $(seq 1 $total_commits)
do
    # Increment the commit date by hours to spread them out
    commit_date=$(date -j -v+${i}H -f "%Y-%m-%d %H:%M:%S" "$start_date" +"%Y-%m-%d %H:%M:%S")

    # Make a small change to the file
    echo "Progress update number $i on $commit_date" >> $file_to_modify

    # Stage the file
    git add $file_to_modify

    # Create a commit with the calculated date and custom message
    GIT_COMMITTER_DATE="$commit_date" GIT_AUTHOR_DATE="$commit_date" git commit -m "$commit_message - Commit number $i"

    # Print the commit number and date for verification
    echo "Created commit number $i with date $commit_date"
done

# Push all commits to the default branch (e.g., 'main')
git push origin main
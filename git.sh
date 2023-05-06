#!/bin/bash

# pre requsite you should you login gh or git by using below cmd 

#gh auth login   or git login 

# Set the GitHub username and repository name
username=mahisakapal  # this can be organtion name 

read -p "Enter your GitHub repository name without org name: " repository
# example myproject1

# Set the path to the file with the list of contributors
contributors_file=userlist.txt

# this code will take a token from terminal if you have logined 

#access_token=$(gh auth status | grep -oP 'github\.com:\K[^ ]+')  # only for linux 

access_token=$(gh auth status | grep -o 'github\.com:\K[^ ]+')  # only for mac 

# Loop over the list of contributors in the file and add them to the repository with "push" permission
while read contributor; do
  # Add the contributor to the repository with "push" permission
  # gh repo collaborator add $username/$repository $contributor permission='triage' 
  gh api \
  --method PUT \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  /repos/$username/$repository/collaborators/$contributor  \
  -f permission='push'    # number of permisstion pull, triage, push, maintain, admin 
done < "$contributors_file"




# github_user_add_scripts

# pre requsite you should login gh or git by using below cmd 

#gh auth login  or git login 

# Set the GitHub username and repository name

# this code will take a token from terminal if you have logined 

#access_token=$(gh auth status | grep -oP 'github\.com:\K[^ ]+')  # only for linux 

access_token=$(gh auth status | grep -o 'github\.com:\K[^ ]+')  # only for mac 

 # number of permisstion pull, triage, push, maintain, admin 

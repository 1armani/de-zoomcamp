git clone <link to repo>

git status

git diff

git add


# remove from tracking but save the file
git rm --cached 7_project/dbt/README.md
git rm -r --cached 1_intro/2_docker_sql/ny_taxi_postgres_data/

# same but remove the file
git rm --f 7_project/dbt/README.md

# to ignore files or folder add the path to .gitignore file:
.gitignore





# init current directory
git init 

# set to be merged when pulled
git config pull.rebase false
git pull



#add ssh-key to git-hub (id_rsa.pub in the ssh-keys section)
git clone git@github.com:1armani/de-zoomcamp.git



# how to set ignore the files in all repos of the computer:
touch ~/.gitignore_global 
vim ~/.gitignore_global 

# OS generated files #
######################
.DS_Store
.DS_Store?
.Spotlight-V100

git config --global core.excludesfile ~/.gitignore_global





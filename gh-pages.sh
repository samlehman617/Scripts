#!/bin/bash

github_user = 'samlehman617'
project_name = basename -s .git `git config --get remote.origin.url`




# Test for packages
if [npm list create-react-app]
then
	npm install -g create-react-app
fi


create-react-app $project_name 
cd $project_name
npm start

git add .
git commit -m "Created github pages. (script)."

if [npm list gh-pages]
then
	npm install --save gh-pages
fi

# Change package.json
jq '.homepage = "https://$github_user.github.io/$project_name"' package.json | sponge package.json
jq '.name = "$project_name"' package.json | sponge package.json
sed -i '15i\ "predeploy": "npm run build",' ./package.json
sed -i '16i\ "deploy": "gh-pages -d build",' ./package.json


npm run deploy

#!/bin/bash
rm -rf public
cd blog
rm -rf public
git checkout dev
hugo --theme=hugo-nuo --baseUrl="https://akkagao.github.io/"
git add .
git commit -m "`date +%Y-%m-%d:%X` public dev"
git push
echo "akkagao.github.io" > public/CNAME
cp -r public ../
git checkout master
rm -rf *
mv ../public/* ./
git add .
git commit -m " `date +%Y-%m-%d:%X` public master"
git push
git checkout dev
cd ..
rm -rf public

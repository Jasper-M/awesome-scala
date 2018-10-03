#!/bin/sh

setup_git() {
echo "Set git config START"

  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
 echo "Set git config END"
}

commit_files() {
 echo "commit START"
 git diff
  git checkout master
  git add README.md
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
  echo "commit END"
}

upload_files() {
 echo "upload_files START"
  git remote add origin-repo https://${GITHUB_TOKEN}@github.com/sake92/awesome-scala.git > /dev/null 2>&1
  git push --quiet origin-repo master 
  echo "upload_files END"
}

setup_git
commit_files
upload_files
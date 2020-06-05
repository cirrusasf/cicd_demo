#!/bin/bash

#this script does git push and trigger the jenkns build

#push to github repo
git push

#triger the jenkins build
.git/hooks/post-commit.sample


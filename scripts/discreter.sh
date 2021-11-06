#!/bin/sh

# Script to add, commit and push file by file
# all files from a repository.
#
# The following link provides further information:
#
# https://stackoverflow.com/q/69720519/2371987
#
# Copyright (C) 2021 Francisco Maria Calisto
# e-mail: francisco.calisto@tecnico.ulisboa.pt
# Permission to copy and modify is granted under the MIT license
# Last revised: 26/10/2021

CUR_DIR=$(pwd)
PROJECT_DIR="${CUR_DIR}"

for fileToCommit in $(find ${PROJECT_DIR}/* -type f);
do
  test -f "$fileToCommit" || continue
  printf "%s\n" "${fileToCommit}"
  git add "${fileToCommit}"
  git commit -a -m "[ADD] New ${fileToCommit##*/} File"
  git push
done
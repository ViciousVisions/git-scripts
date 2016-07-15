#!/bin/sh
#
#Must set the following before running script
#OLD_EMAIL="someone@gmail.com"
#CORRECT_NAME="ViciousVisions"
#CORRECT_EMAIL="nobody@yahoo.com"

git filter-branch --env-filter '
OLD_EMAIL="someone@gmail.com"
CORRECT_NAME="ViciousVisions"
CORRECT_EMAIL="nobody@yahoo.com"
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags

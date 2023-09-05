#!/bin/bash
# OWD 2023

# Generate an HTML tree from the current working directory and prepare it for
# publication on the York user web instance.

SED_SUB="<head>"
SED_REP="<head>\n <link rel=\"stylesheet\" href=\"tree.css\">\
  \n <base target=\"_parent\" \/>"

WEB_PATH="$HOME/web"
OUT_NAME="$WEB_PATH/tree/tree.html"

[[ ! $PWD -ef $WEB_PATH ]] && URL_SUFFIX="/$(realpath "$PWD" \
    --relative-to "$WEB_PATH")"

echo "Writing an HTML tree of $PWD into $OUT_NAME"

tree "$PWD" -I secret \
    -H https://www-users.york.ac.uk/~"$(whoami)$URL_SUFFIX" | \
    sed '0,/'"$SED_SUB"'/s//'"$SED_REP"'/' > "$OUT_NAME"


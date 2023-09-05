#!/bin/bash
# OWD 2023

SED_SUB="<head>"
SED_REP="<head>\n <link rel=\"stylesheet\" href=\"tree.css\">"

WEB_PATH="$HOME/web"
OUT_NAME="$WEB_PATH/tree/tree.html"

[[ ! $PWD -ef $WEB_PATH ]] && URL_SUFFIX="/$(realpath "$PWD" \
    --relative-to "$WEB_PATH")"

echo "Writing an HTML tree of $PWD into $OUT_NAME"

tree "$PWD" -H https://www-users.york.ac.uk/~"$(whoami)$URL_SUFFIX" | \
    sed '0,/'"$SED_SUB"'/s//'"$SED_REP"'/' > "$OUT_NAME"


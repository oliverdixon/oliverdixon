#!/bin/bash
# OWD 2023

# Generate an HTML tree from the current working directory and prepare it for
# publication on the York user web instance.

SED_COMMAND='/<style type=\"text\/css\">$/,/<\/style>$/d;
    s/<head>/ <link rel=\"stylesheet\" type=\"text\/css\" href=\"tree.css\">\n <base target=\"_parent\" rel=\"noopener noreferrer\">/'

WEB_PATH="$HOME/web"
OUT_NAME="$WEB_PATH/tree/tree.html"

[[ ! $PWD -ef $WEB_PATH ]] && URL_SUFFIX="/$(realpath "$PWD" \
    --relative-to "$WEB_PATH")"

echo "Writing an HTML tree of $PWD into $OUT_NAME"

tree "$PWD" -I secret \
    -H https://www-users.york.ac.uk/~"$(whoami)$URL_SUFFIX" | \
    sed "$SED_COMMAND" > "$OUT_NAME"


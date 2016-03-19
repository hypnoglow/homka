# Quotes the string for Extendet RegExp
str::ere_quote() {
    sed 's/[]\.|$(){}?+*^]/\\&/g' <<< "$*"
}

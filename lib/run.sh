run::timed() {
    local start=$(date +%s)
    local stop
    local result

    "$@"
    result=$?

    stop=$(date +%s)
    declare -g timer=$((stop-start))

    return ${result}
}

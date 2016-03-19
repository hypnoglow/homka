# Library for input/output helpers and related functions.
################################################################################

# Simple config reader.
#
# It understands the following format of the config file:
#     # This is a comment and it is ignored.
#     name = John
#     age = 25
#     # Empty lines are skipped.
#
#     message = "Hello, world!" # Line comments are also supported.
#
# Usage:
#     . lib/io.sh
#     io::read_conf "my_config.conf"
#     echo "$name" # outputs "John"
#
io::read_conf() {
    # TODO: save current value of extglob and restore it afterwards
    shopt -s extglob
    configfile=$1

    while IFS='= ' read lhs rhs
    do
        if [[ ! $lhs =~ ^\ *# && -n $lhs ]]; then
            rhs="${rhs%%\#*}"    # Del in line right comments
            rhs="${rhs%%*( )}"   # Del trailing spaces
            rhs="${rhs%\"*}"     # Del opening string quotes
            rhs="${rhs#\"*}"     # Del closing string quotes

            # We need to pass -g flag to declare variable that will be
            # available in includer-file.
            declare -g $lhs="$rhs"
        fi
    done < $configfile
}

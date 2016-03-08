# Standard library containing common functions and global variables.
################################################################################

### GLOBAL VARIABLES ###

[ -z "$_SELF" ]    && declare -g _SELF="Undefined"
[ -z "$_VERSION" ] && declare -g _VERSION="0.0.0"
[ -z "$_AUTHOR" ]  && declare -g _AUTHOR="John Doe"
[ -z "$_CALLER" ]  && declare -g _CALLER="$0"

# 16 Colors palette
# Reminder:
#     0 - normal
#     1 - bold
#     4 - underscore
declare -g _COLOR_BLACK="\033[00;30m"
declare -g _COLOR_RED="\033[00;31m"
declare -g _COLOR_GREEN="\033[00;32m"
declare -g _COLOR_BROWN="\033[00;33m"
declare -g _COLOR_BLUE="\033[00;34m"
declare -g _COLOR_PURPLE="\033[00;35m"
declare -g _COLOR_CYAN="\033[00;36m"
declare -g _COLOR_LIGHT_GRAY="\033[00;37m"
declare -g _COLOR_DARK_GRAY="\033[01;30m"
declare -g _COLOR_LIGHT_RED="\033[01;31m"
declare -g _COLOR_LIGHT_GREEN="\033[01;32m"
declare -g _COLOR_YELLOW="\033[01;33m"
declare -g _COLOR_LIGHT_BLUE="\033[01;34m"
declare -g _COLOR_LIGHT_PURPLE="\033[01;35m"
declare -g _COLOR_LIGHT_CYAN="\033[01;36m"
declare -g _COLOR_WHITE="\033[01;37m"
declare -g _COLOR_RESET="\033[0m"

### LOGGING FUNCTIONS ###

_error() {
    echo -e "${_COLOR_PURPLE}${_SELF}${_COLOR_RESET} ${_COLOR_CYAN}[$(date +'%Y-%m-%dT%H:%M:%S%z')]${_COLOR_RESET} ${_COLOR_RED}ERROR${_COLOR_RESET}: $@" >&2
}

_info() {
    echo -e "${_COLOR_PURPLE}${_SELF}${_COLOR_RESET} ${_COLOR_CYAN}[$(date +'%Y-%m-%dT%H:%M:%S%z')]${_COLOR_RESET} ${_COLOR_GREEN}INFO${_COLOR_RESET}: $@"
}

_warning() {
    echo -e "${_COLOR_PURPLE}${_SELF}${_COLOR_RESET} ${_COLOR_CYAN}[$(date +'%Y-%m-%dT%H:%M:%S%z')]${_COLOR_RESET} ${_COLOR_YELLOW}WARNING${_COLOR_RESET}: $@" >&2
}

### FLOW CONTROL FUNCTIONS ###

# Checks last command's result. I
# If it is not 0, then trigger error and exit.
#
# Example:
#     mkdir -p test/dir
#     _expect "Cannot create directory test/dir"
#
_expect() {
    result=$?
    if [ $result -ne 0 ] ; then
        _error "[$result] $1"
        exit 1
    fi
}

# Checks last command's result. I
# If it is not 0, then trigger warning.
# This function does not abort script!
#
# Example:
#     rm test.log
#     _swear "Cannot delete file test.log"
#
_swear() {
    if [ $? -ne 0 ] ; then
        _warning $1
    fi
}
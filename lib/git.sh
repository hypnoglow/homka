# Library for git-based functions.
################################################################################

# Print untracked files count.
#
# Example:
#     _git_get_untracked_count path/to/dir/inside/repo
#
_git_get_untracked_count() {
    git status --porcelain $1 2>/dev/null | grep "^??" | wc -l
}

# Print index status.
#
# Example:
#     _git_get_index_status path/to/dir/inside/repo
#
_git_get_index_status() {
    git diff --shortstat $1 2>/dev/null
}
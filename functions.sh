# Packages autocomplete
_get_packages_autocomplete()
{
    _init_completion || return
    COMPREPLY=($(apt-cache --no-generate pkgnames "$cur" 2>/dev/null))
    return 0
}

# Autocomplete wrapper function
# URL: http://unix.stackexchange.com/questions/4219/how-do-i-get-bash-completion-for-command-aliases 
function make_completion_wrapper () {
    local function_name="$2"
    local arg_count=$(($#-3))
    local comp_function_name="$1"
    shift 2
    local function="
        function $function_name {
            ((COMP_CWORD+=$arg_count))
            COMP_WORDS=( "$@" \${COMP_WORDS[@]:1} )
            "$comp_function_name"
            return 0
        }"
    eval "$function"
}

find_git_branch() {
    # Based on: http://stackoverflow.com/a/13003854/170413
    local branch
    if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
        if [[ "$branch" == "HEAD" ]]; then
            branch='detached*'
        fi
        GIT_BRANCH="($branch)"
    else
        GIT_BRANCH=""
    fi
}

find_git_dirty() {
    local status=$(git status --porcelain 2> /dev/null)
    if [[ "$status" != "" ]]; then
        GIT_DIRTY='*'
    else
        GIT_DIRTY=''
    fi
}
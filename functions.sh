# Packages autocomplete
_get_packages_autocomplete()
{
    _init_completion || return
    COMPREPLY=($(apt-cache --no-generate pkgnames "$cur" 2>/dev/null))
    return 0
}

# Packages remove autocomplete
_get_packages_remove_autocomplete ()
{
    local cur opt;
    COMPREPLY=();
    cur="${COMP_WORDS[COMP_CWORD]}";

    if [ -f /etc/debian_version ]; then
        COMPREPLY=($( _xfunc dpkg _comp_dpkg_installed_packages $cur ));
    else
        _xfunc rpm _rpm_installed_packages;
    fi;

    return 0
}

# Service autocomplete
_get_service_autocomplete()
{
    local cur prev words cword;
    _init_completion || return;
    [[ $cword -gt 2 ]] && return 0;
    if [[ $cword -eq 1 && $prev == ?(*/)S ]]; then
        _services;
        [[ -e /etc/mandrake-release ]] && _xinetd_services;
    else
        local sysvdirs;
        _sysvdirs;
        COMPREPLY=($( compgen -W '`sed -e "y/|/ /" \
            -ne "s/^.*\(U\|msg_u\)sage.*{\(.*\)}.*$/\2/p" \
            ${sysvdirs[0]}/${prev##*/} 2>/dev/null` start stop' -- "$cur" ));
    fi
}

# Autocomplete wrapper function
# URL: http://unix.stackexchange.com/questions/4219/how-do-i-get-bash-completion-for-command-aliases
make_completion_wrapper () {
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

# Get git branch
function get_git_branch() {
    echo `git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
}

# Get git branch feature
# For the tasks with feature/{TASK}
function get_git_task_feature() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    ARRAY=(${BRANCH//\// })
    if [ ! -z "${ARRAY[1]}" ]
    then
        echo "[${ARRAY[1]}] - "
    else
        echo ""
    fi
}


# Get current branch in git repo
function parse_git_branch() {
    BRANCH=`get_git_branch`
    if [ ! "${BRANCH}" == "" ]
    then
        echo "[${BRANCH}] "
    else
        echo ""
    fi
}

# Check if a command exists
command_exists () {
    type "$1" &> /dev/null ;
}

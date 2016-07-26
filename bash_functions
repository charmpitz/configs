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
  echo $function_name
  echo "$function"
}

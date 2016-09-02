__phpunit_opts=`phpunit --help | grep -o -e "\-\-[a\-z\-]*"`

_phpunit_completion()
{
    COMPREPLY=( $(compgen -W "${__phpunit_opts}" -- ${COMP_WORDS[COMP_CWORD]}) )
    return 0
}

complete -F _phpunit_completion phpunit

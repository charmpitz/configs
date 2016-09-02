#!/bin/bash

if command_exists phpunit ; then
    __phpunit_opts=`phpunit --help | egrep -o "\-\-[a\-z\-]*"`

    _phpunit_completion()
    {
        COMPREPLY=( $(compgen -W "${__phpunit_opts}" -- ${COMP_WORDS[COMP_CWORD]}) )
        return 0
    }

    complete -F _phpunit_completion phpunit
fi

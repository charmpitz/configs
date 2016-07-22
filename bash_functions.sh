_get_packages_autocomplete()
{
    _init_completion || return
    COMPREPLY=($(apt-cache --no-generate pkgnames "$cur" 2>/dev/null))
    return 0
}

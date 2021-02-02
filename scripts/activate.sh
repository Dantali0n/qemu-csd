#!/usr/bin/env

# This file must be used with "source activate" *from bash*
# you cannot run it directly

if [ "${BASH_SOURCE-}" = "$0" ]; then
    echo "You must source this script: \$ source $0" >&2
    exit 33
fi

deactivate () {
    # reset old environment variables
    # ! [ -z ${VAR+_} ] returns true if VAR is declared at all
    if ! [ -z "${_OLD_VIRTUAL_PATH:+_}" ] ; then
        PATH="$_OLD_VIRTUAL_PATH"
        export PATH
        unset _OLD_VIRTUAL_PATH
    fi

    if ! [ -z "${_OLD_LD_PATH:+_}" ] ; then
        LD_LIBRARY_PATH="$_OLD_LD_PATH"
        export LD_LIBRARY_PATH
        unset _OLD_LD_PATH
    else
      unset LD_LIBRARY_PATH
    fi

    # This should detect bash and zsh, which have a hash command that must
    # be called to get it to forget past commands.  Without forgetting
    # past commands the $PATH changes we made may not be respected
    if [ -n "${BASH-}" ] || [ -n "${ZSH_VERSION-}" ] ; then
        hash -r 2>/dev/null
    fi

    if ! [ -z "${_OLD_VIRTUAL_PS1+_}" ] ; then
        PS1="$_OLD_VIRTUAL_PS1"
        export PS1
        unset _OLD_VIRTUAL_PS1
    fi

    unset VIRTUAL_ENV
    if [ ! "${1-}" = "nondestructive" ] ; then
        # Self destruct!
        unset -f deactivate
    fi
}

# unset irrelevant variables
deactivate nondestructive

# Always use the directory of the script as root for the virtual environment!
VIRTUAL_ENV="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

_OLD_VIRTUAL_PATH="$PATH"
PATH="$VIRTUAL_ENV/bin:$PATH"
export PATH

if [ -z "${VIRTUAL_ENV_DISABLE_PROMPT-}" ] ; then
    _OLD_VIRTUAL_PS1="${PS1-}"
    if [ "x" != x ] ; then
        PS1="${PS1-}"
    else
        PS1="(`basename \"$VIRTUAL_ENV\"`) ${PS1-}"
    fi
    export PS1
fi

if [ -z "$LD_LIBRARY_PATH" ]; then
	LD_LIBRARY_PATH="$VIRTUAL_ENV/lib"
else
  _OLD_LD_PATH="$LD_LIBRARY_PATH"
  LD_LIBRARY_PATH="$VIRTUAL_ENV/lib:$LD_LIBRARY_PATH"
fi

export LD_LIBRARY_PATH;

# This should detect bash and zsh, which have a hash command that must
# be called to get it to forget past commands.  Without forgetting
# past commands the $PATH changes we made may not be respected
if [ -n "${BASH-}" ] || [ -n "${ZSH_VERSION-}" ] ; then
    hash -r 2>/dev/null
fi

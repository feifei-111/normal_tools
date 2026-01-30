export CLICOLOR="1"

if [ -n "$ZSH_VERSION" ]; then
    # zsh 补全
    autoload -Uz compinit && compinit
    setopt PROMPT_SUBST
    
    # git prompt (zsh 原生)
    autoload -Uz vcs_info
    precmd() { vcs_info; }
    zstyle ':vcs_info:git:*' formats ' %F{magenta}{%F{cyan}%b%F{magenta}}'
    
    YELLOW="%F{yellow}"
    NO_COLOR="%f"
    GREEN="%F{green}"
    WHITE="%F{white}"
    BLUE="%F{blue}"
    CYAN="%F{cyan}"
    RED="%F{red}"
    MAGENTA="%F{magenta}"
    
    if [ -n "$PS1_SHOW_HOST" ]; then
        HOST_PREFIX="%F{blue}%m "
    else
        HOST_PREFIX=""
    fi
    export PROMPT='${HOST_PREFIX}${YELLOW}λ ${GREEN}%~${YELLOW}${vcs_info_msg_0_} ${YELLOW}>${NO_COLOR} '
else
    # bash
    source ~/bash_setup_scripts/git-tools/git-prompt.sh
    source ~/bash_setup_scripts/git-tools/git-completion.sh
    
    YELLOW="\[\033[1;33m\]"
    NO_COLOR="\[\033[0m\]"
    GREEN="\[\033[1;32m\]"
    WHITE="\[\033[1;37m\]"
    BLUE="\[\033[1;34m\]"
    CYAN="\[\033[36;1m\]"
    RED="\[\033[31;1m\]"
    MAGENTA="\[\033[35m\]"
    
    if [ -n "$PS1_SHOW_HOST" ]; then
        HOST_PREFIX="\[\033[1;34m\]\h "
    else
        HOST_PREFIX=""
    fi
    export PS1="$HOST_PREFIX$YELLOWλ $GREEN\w$YELLOW\$(__git_ps1 \" \[\033[35m\]{\[\033[36m\]%s\[\033[35m\]}\") $YELLOW>$NO_COLOR "
fi

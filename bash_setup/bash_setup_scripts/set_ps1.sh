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
    export PROMPT='%B${HOST_PREFIX}${YELLOW}λ ${GREEN}%~${YELLOW}${vcs_info_msg_0_} ${YELLOW}>${NO_COLOR}%b '
else
    # bash
    source ~/bash_setup_scripts/git-tools/git-prompt.sh
    source ~/bash_setup_scripts/git-tools/git-completion.sh
    
    # 样式
    BOLD="\[\033[1m\]"
    UNBOLD="\[\033[22m\]"
    RESET_ALL="\[\033[0m\]"
    
    # 颜色
    YELLOW="\[\033[33m\]"
    GREEN="\[\033[32m\]"
    WHITE="\[\033[37m\]"
    BLUE="\[\033[34m\]"
    CYAN="\[\033[36m\]"
    RED="\[\033[31m\]"
    MAGENTA="\[\033[35m\]"
    
    if [ -n "$PS1_SHOW_HOST" ]; then
        HOST_PREFIX="$BOLD$BLUE\h "
    else
        HOST_PREFIX=""
    fi
    export PS1="$HOST_PREFIX$BOLD$YELLOWλ $GREEN\w$YELLOW\$(__git_ps1 \" $MAGENTA{$CYAN%s$MAGENTA}\") $YELLOW>$RESET_ALL "
fi

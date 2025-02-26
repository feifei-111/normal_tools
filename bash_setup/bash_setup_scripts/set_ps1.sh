# Shell prompt
source ~/bash_setup_scripts/git-tools/git-prompt.sh # defined __git_ps1
source ~/bash_setup_scripts/git-tools/git-completion.sh

# Shell prompt
export CLICOLOR="1"
YELLOW="\[\033[1;33m\]"
NO_COLOR="\[\033[0m\]"
GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"  # `$WHITE\h` will show host
BLUE="\[\033[36;1m\]"
RED="\[\033[31;1m\]"

export PS1="$YELLOWλ $GREEN\w$YELLOW\$(__git_ps1 \" \[\033[35m\]{\[\033[36m\]%s\[\033[35m\]}\") $YELLOW>$NO_COLOR "
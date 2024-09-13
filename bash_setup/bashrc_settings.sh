
##==============================configs by wzf==============================================

# alias
alias duu='du --max-depth=1 -h'
alias cdd='cdd_script(){ mkdir $1 && cd $1;}; cdd_script'
alias setP='export http_proxy=;export https_proxy=;export no_proxy='
alias unsetP='unset http_proxy;unset https_proxy'
alias showP='env | grep proxy'
alias showG='env | grep CUDA_VISIBLE_DEVICES'
alias setG='GPU_script(){ export CUDA_VISIBLE_DEVICES=$1;}; GPU_script'
alias ps1='SetPS1(){ source ~/bash_setup/set_ps1.sh;}; SetPS1'
alias apyp='AddPYPATH(){ export PYTHONPATH=$PWD:$PYTHONPATH;}; AddPYPATH'

unset GREP_OPTIONS
ps1
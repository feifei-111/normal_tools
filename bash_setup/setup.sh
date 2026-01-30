#!/bin/bash

SHOW_HOST=false
if [[ "$1" == "host" ]]; then
    SHOW_HOST=true
fi

if [[ "$SHELL" == */zsh ]]; then
    RC_FILE=~/.zshrc
else
    RC_FILE=~/.bashrc
fi

cp -r bash_setup_scripts ~

# 删除旧配置
if grep -q "bash setup config by wzf" "$RC_FILE" 2>/dev/null; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' '/bash setup config by wzf/,/end of bash setup config by wzf/d' "$RC_FILE"
    else
        sed -i '/bash setup config by wzf/,/end of bash setup config by wzf/d' "$RC_FILE"
    fi
fi

echo "##==============================bash setup config by wzf==============================================" >> $RC_FILE

if [[ "$SHOW_HOST" == true ]]; then
    echo "export PS1_SHOW_HOST=1" >> $RC_FILE
else
    echo "unset PS1_SHOW_HOST" >> $RC_FILE
fi

cat bashrc_settings.sh >> $RC_FILE

echo "#==============================end of bash setup config by wzf==============================================" >> $RC_FILE

echo "配置完成，请重新打开终端或执行: source $RC_FILE"

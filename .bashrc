# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias log='conventional-changelog -p angular -i CHANGELOG.md'  # 根据git的提交信息自动生成日志

PS1="\[\e[1;41;33m\][\u@\h \W \t]\\$\[\e[0m\]"

# GREETER THEME, BASED ON RKJ AND SMT
# Author: rahmanhakim2435@protonmail.com


function start() {}

# VERSION CONTROL
VCS_PROMPT_PREFIX1=" %{$fg[white]%}on%{$reset_color%} "
VCS_PROMPT_PREFIX2=":%{$fg[cyan]%}"
VCS_PROMPT_SUFFIX="%{$reset_color%}"
VCS_PROMPT_DIRTY=" %{$fg[red]%}x"
VCS_PROMPT_CLEAN=" %{$fg[green]%}o"

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${VCS_PROMPT_PREFIX1}git${VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$VCS_PROMPT_CLEAN"


# Greeter

local greet='$(greet_prompt)'

local greet_prompt() {
	H=$(date +%H)
	if (( 4 <= 10#$H && 10#$H < 11 )); then 
	    echo -n "Good Morning, $USER"
	elif (( 11 <= 10#$H && 10#$H < 18 )); then 
	    echo -n "Good Afternoon, $USER"

	elif (( 18 <= 10#$H && 10#$H < 23 )); then
	    echo -n "Good Evening, $USER"

	elif (( 23 <= 10#$H && 10#$H > 4 )); then
	    echo -n "Sleep Well, $USER" 
fi
}

PROMPT=$'%{$fg[red]%}[$USER%{$fg[magenta]%}@%{\e[0m%}%{\e[0;36m%}%m%{\e[0;34m%}%B]%b%{\e[0m%} in %b%{\e[0;34m%}%B[%b%{\e[1;37m%}%~%{\e[0;34m%}%B]%b%{\e[0m%}    \n%{\e[0;34m%}%B%b%{\e[0;33m%}'%D{"%H:%M - $greet"}%b$'%{\e[0;34m%}%B%b%{\e[0m%}
%{\e[0;34m%}%B└─%{$fg[magenta]%} >>'

RPROMPT=$' %{$fg[red]%}$(git_prompt_info)'

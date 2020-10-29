# Based on simple zsh theme
# Net by rahmanhakim@protonmail.com/mochidaz@github.com
# Shows your current network, but only for wireless network for now (?) idk haven't tested it with ethernet.
# If you want to create any improvements, just submit a pull request

function start() {}

local INTERFACE=$(ip link | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*state UP' | awk '{print $2;}' | tr -d ':')


local get_ssid() {
	
	if iw &>/dev/null; then
		echo -n $(iw dev | grep ssid | awk '{ print $2; }')
	elif iwgetid &>/dev/null; then
		echo -n $(iwgetid -r)	
	fi
}

PROMPT=$'%{$fg[yellow]%}-> %{$reset_color%}%(!.%{$fg[red]%}.%{$fg[green]%})%~%{$reset_color%}%{$fg_bold[blue]%} $(git_prompt_info)%{$reset_color%}\n%{$fg[blue]%}>> ' 

RPROMPT=$'%{$fg[blue]%}$INTERFACE %{$fg[red]%}$(get_ssid)'

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_DIRTY=" ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"

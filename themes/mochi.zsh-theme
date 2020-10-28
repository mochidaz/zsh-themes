# VCS
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

# HG info
local hg_info='$(hg_prompt_info)'
hg_prompt_info() {
	# make sure this is a hg dir
	if [ -d '.hg' ]; then
		echo -n "${VCS_PROMPT_PREFIX1}hg${VCS_PROMPT_PREFIX2}"
		echo -n $(hg branch 2>/dev/null)
		if [ -n "$(hg status 2>/dev/null)" ]; then
			echo -n "$VCS_PROMPT_DIRTY"
		else
			echo -n "$VCS_PROMPT_CLEAN"
		fi
		echo -n "$VCS_PROMPT_SUFFIX"
	fi
}

local exit_code="%(?,,C:%{$fg[red]%}%?%{$reset_color%})"
OS=$(awk -F= '$1=="NAME" { print $2 ;}' /etc/os-release)

PROMPT="
%{$terminfo[bold]$fg[blue]%}>>%{$reset_color%} \
%{$fg[magenta]%}$OS - \
%(#,%{$bg[yellow]%}%{$fg[black]%}%n%{$reset_color%},%{$fg[cyan]%}%n) \
%{$fg[white]%}@ \
%{$fg[red]%}%m \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%}\
${hg_info}\
${git_info}\
 \
$exit_code
%{$terminfo[bold]$fg[yellow]%}fn %{$reset_color%}%{$fg[cyan]%}main%{$fg[white]%}()%{$reset_color%}%{$reset_color%}%{$fg[yellow]%} -> %{$reset_color%}() { "

RPROMPT=}

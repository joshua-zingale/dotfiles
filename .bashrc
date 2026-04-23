[ -z "$PS1" ] && return


if [[ -z $NO_COLOR ]]; then
	GREEN="\e[32m"
	CYAN="\e[36m"
	RED="\e[31m"
	MAGENTA="\e[35m"
	YELLOW="\e[33m"
	BOLD="\e[1m"
	RESET="\e[0m"
else 
	GREEN=""
	CYAN=""
	RED=""
	MAGENTA=""
	YELLOW=""
	BOLD=""
	RESET=""
fi

__add_to_path_if_not_in_path() {
	item_to_add=$1
	[[ $PATH =~ (^|:)${item_to_add}(:|$) ]] || export PATH="$item_to_add:$PATH"
}

__add_to_path_if_not_in_path "$HOME/.local/bin"
if [[ -d "$HOME/.bashrc.d" ]]; then
	for config in "$HOME/.bashrc.d/"*.bash; do
		[[ -r "$config" ]] && . "$config"
	done
fi

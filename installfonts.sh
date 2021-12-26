#!/usr/bin/env bash

# Dirs
DIR=`pwd`
FONT_DIR="$HOME/.local/share/fonts"

# Install Fonts
install_fonts() {
	echo -e "\n[*] Installing fonts..."
	if [[ -d "$FONT_DIR" ]]; then
		cp -rf $DIR/fonts/* "$FONT_DIR"
	else
		mkdir -p "$FONT_DIR"
		cp -rf $DIR/fonts/* "$FONT_DIR"
	fi
}

# Main
main() {
	clear
	cat <<- EOF
		[*] Installing Fonts in $FONT_DIR
		
		[1] Continue
		[2] Exit
	
	EOF

	read -p "[?] Select Option : "

	if [[ $REPLY == "1" ]]; then
		install_fonts
	elif [[ $REPLY == "2" ]]; then
		exit 1
	else
		echo -e "\n[!] Invalid Option, Exiting...\n"
		exit 1
	fi
}

main
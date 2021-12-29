#!/usr/bin/env bash

# Checking that you are screwing up :)
theme=$1
if [ -z "$1" ]
 then
    # No theme supplied by UP script / falling back to Amber
    theme="catppuccin"
fi

# Available themes array
themes=(catppuccin catppuccin2);
if [[ " "${themes[@]}" " == *" "$1" "* ]] ;then
    echo "Good boy.."
else
    # Invalid theme supplied by UP script / falling back to Amber
    theme="catppuccin"
fi

source $HOME/.config/leftwm/themes/current/scripts/colors_$theme.sh

# Color files
THEME_FILE="$HOME/.config/leftwm/themes/current/theme.toml"
POLYBAR_FILE="$HOME/.config/leftwm/themes/current/polybar.colors"
LIQUID_POLYBAR_FILE="$HOME/.config/leftwm/themes/current/polybar.liquid"
ROFI_FILE="$HOME/.config/leftwm/themes/current/scripts/rasi/colors.rasi"
SCRIPT_BT_FILE="$HOME/.config/leftwm/themes/current/scripts/bluetooth.sh"
SCRIPT_CAU_FILE="$HOME/.config/leftwm/themes/current/scripts/check-arch-updates.sh"

# Change LeftWM theme colors
sed -i -e "s/default_border_color = '#.*/default_border_color = '$COLOR_BORDER_INACTIVE'/g" $THEME_FILE
sed -i -e "s/floating_border_color = '#.*/floating_border_color = '$COLOR_BORDER_FLOATING'/g" $THEME_FILE
sed -i -e "s/focused_border_color = '#.*/focused_border_color = '$COLOR_BORDER_ACTIVE'/g" $THEME_FILE

# Change rofi colors
sed -i -e "s/background: #.*/background: $COLOR_APPLET_BACKGROUND;/g" $ROFI_FILE
sed -i -e "s/background-light: #.*/background-light: $COLOR_APPLET_BACKGROUND_LIGHT;/g" $ROFI_FILE
sed -i -e "s/foreground: #.*/foreground: $COLOR_FOREGROUND;/g" $ROFI_FILE
sed -i -e "s/foreground-dark: #.*/foreground-dark: $COLOR_FOREGROUND_DARK;/g" $ROFI_FILE
sed -i -e "s/primary: #.*/primary: $COLOR_PRIMARY;/g" $ROFI_FILE
sed -i -e "s/bordercolor: #.*/bordercolor: $COLOR_BORDER_ACTIVE;/g" $ROFI_FILE

# Change polybar config colors
sed -i -e "s/background = #.*/background = $COLOR_BAR_BACKGROUND/g" $POLYBAR_FILE
sed -i -e "s/foreground = #.*/foreground = $COLOR_BAR_FOREGROUND/g" $POLYBAR_FILE
sed -i -e "s/primary = #.*/primary = $COLOR_PRIMARY/g" $POLYBAR_FILE
sed -i -e "s/secondary = #.*/secondary = $COLOR_SECONDARY/g" $POLYBAR_FILE
sed -i -e "s/alternate = #.*/alternate = $COLOR_ALTERNATE/g" $POLYBAR_FILEFILE

# Change polybar liquid colors
sed -i -e "/^{% if tag.mine %}/s/#[a-zA-Z0-9]\{6\}/$COLOR_PRIMARY/g" $LIQUID_POLYBAR_FILE
sed -i -e "/^{% elsif tag.visible %}/s/#[a-zA-Z0-9]\{6\}/$COLOR_PRIMARY/g" $LIQUID_POLYBAR_FILE
sed -i -e "/^{% elsif tag.busy %}/s/#[a-zA-Z0-9]\{6\}/$COLOR_SECONDARY/g" $LIQUID_POLYBAR_FILE
sed -i -e "/^{% else tag.visible %}%/s/#[a-zA-Z0-9]\{6\}/$COLOR_FOREGROUND/g" $LIQUID_POLYBAR_FILE
sed -i -e "s/%{B#[A-Za-z0-9_]*}%{F#[A-Za-z0-9_]*} {{ workspace.layout }}/%{B$COLOR_BAR_BACKGROUND}%{F$COLOR_BAR_FOREGROUND} {{ workspace.layout }}/g" $LIQUID_POLYBAR_FILE

# Change Bluetooth script colors
sed -i -e "s/%{F#[A-Za-z0-9_]*/%{F$COLOR_PRIMARY/g" $SCRIPT_BT_FILE
sed -i -e "s/%{F#[A-Za-z0-9_]*}  Off/%{F$COLOR_INACTIVE}  Off/g" $SCRIPT_BT_FILE

# Change Check Arch updates script colors
sed -i -e "s/%{F#[A-Za-z0-9_]*/%{F$COLOR_PRIMARY/g" $SCRIPT_CAU_FILE

#! /bin/bash

echo -n "bold color same as fg : "
echo `gconftool-2 --get "/apps/gnome-terminal/profiles/Default/bold_color_same_as_fg"`
echo -n "use theme colors : "
echo `gconftool-2 --get "/apps/gnome-terminal/profiles/Default/use_theme_colors"`
echo -n "foreground color : "
echo `gconftool-2 --get "/apps/gnome-terminal/profiles/Default/foreground_color"`
echo -n "background color : "
echo `gconftool-2 --get "/apps/gnome-terminal/profiles/Default/background_color"`
echo "palette :"
echo `gconftool-2 --get "/apps/gnome-terminal/profiles/Default/palette"`

#!/bin/bash

# gsettings list-recursively org.gnome.desktop.wm.keybindings | grep to-workspace

if [[ "$XDG_CURRENT_DESKTOP" == "GNOME" || "$XDG_CURRENT_DESKTOP" == "ubuntu:GNOME" ]]; then
  echo GNOME detected!
  if command -v gsettings &>/dev/null; then
    echo gsettings available!
    echo Configuring some system wide settings...
    gsettings set org.gnome.mutter dynamic-workspaces false
    gsettings set org.gnome.desktop.wm.preferences num-workspaces 10
    gsettings set org.gnome.Terminal.Legacy.Settings confirm-close false
    # gsettings set org.gnome.gnome-screenshot auto-save-directory file://$HOME/Desktop
    gsettings set org.gnome.eog.ui disable-close-confirmation true
    gsettings set org.gnome.eog.ui disable-trash-confirmation true

    # keyboard shortcuts
    echo Ensuring to have 'toggle-maximized' configured...
    gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Alt>F10']"

    echo Ensuring Ctrl-Alt-left/right cycle windows...
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Super>Page_Up', '<Super><Alt>Left']"
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Super>Page_Down', '<Super><Alt>Right']"
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Super><Shift>Page_Up', '<Super><Shift><Alt>Left']"
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Super><Shift>Page_Down', '<Super><Shift><Alt>Right']"

    gsettings set org.gnome.settings-daemon.plugins.media-keys magnifier "['<Super><Alt>F8']" # to solve conflict with workspace 8
    for i in $(seq 9); do
      echo Configuring desktop $i...
      gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Super><Alt><Shift>$i']"
      gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super><Alt>$i']"
    done
    echo Configuring desktop 10...
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 "['<Super><Alt><Shift>0']"
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 "['<Super><Alt>0']"

    echo Configuring Alt-tab, Super-grave and Super-tab...
    gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
    gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"
    gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
    gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"
    gsettings set org.gnome.desktop.wm.keybindings switch-group "['<Super>Above_Tab']"
    gsettings set org.gnome.desktop.wm.keybindings switch-group-backward "['<Shift><Super>Above_Tab']"

    echo Configuring Win-r...
    gsettings set org.gnome.desktop.wm.keybindings panel-run-dialog "['<Alt>F1', '<Super>r']"

    echo Configuring launchers...
    gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['<Control><Alt>t', '<Super>t']"
    gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"
    gsettings set gsettings set org.gnome.mutter overlay-key ''
    gsettings set org.gnome.desktop.wm.keybindings activate-window-menu "['<Super><Control><Shift>F10']"
    gsettings set org.gnome.shell.keybindings toggle-overview "['<Super>w', '<Alt>Space']"
    gsettings set org.gnome.shell.keybindings toggle-application-view "['<Super>a']"

    echo Configuring scrolling...
    gsettings set org.gnome.desktop.peripherals.mouse natural-scroll false
    gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true

    echo Configuring Super-Shift-s to make a screenshot...
    gsettings set org.gnome.shell.keybindings show-screenshot-ui "['Print', '<Shift><Super>s']"
    echo Done!
  fi
elif [ "$XDG_CURRENT_DESKTOP" == "KDE" ]; then
  sed -i 's|\(Switch to Desktop\) \([0-9]\)=[^,]*,[^,]*,[A-Za-z]\+ to Desktop [0-9]|\1 \2=Meta+Ctrl+\2,,\1 \2|' ~/.config/kglobalshortcutsrc
  sed -i 's|\(Switch to Desktop\) 10=[^,]*,[^,]*,[A-Za-z]\+ to Desktop 10|\1 10=Meta+Ctrl+0,,\1 10|' ~/.config/kglobalshortcutsrc

  sed -i 's|\(Window to Desktop\) 1=[^,]*,[^,]*,[A-Za-z]\+ to Desktop 1|\1 1=Meta+Ctrl+!,,\1 1|' ~/.config/kglobalshortcutsrc
  sed -i 's|\(Window to Desktop\) 2=[^,]*,[^,]*,[A-Za-z]\+ to Desktop 2|\1 2=Meta+Ctrl+@,,\1 2|' ~/.config/kglobalshortcutsrc
  sed -i 's|\(Window to Desktop\) 3=[^,]*,[^,]*,[A-Za-z]\+ to Desktop 3|\1 3=Meta+Ctrl+#,,\1 3|' ~/.config/kglobalshortcutsrc
  sed -i 's|\(Window to Desktop\) 4=[^,]*,[^,]*,[A-Za-z]\+ to Desktop 4|\1 4=Meta+Ctrl+$,,\1 4|' ~/.config/kglobalshortcutsrc
  sed -i 's|\(Window to Desktop\) 5=[^,]*,[^,]*,[A-Za-z]\+ to Desktop 5|\1 5=Meta+Ctrl+%,,\1 5|' ~/.config/kglobalshortcutsrc
  sed -i 's|\(Window to Desktop\) 6=[^,]*,[^,]*,[A-Za-z]\+ to Desktop 6|\1 6=Meta+Ctrl+^,,\1 6|' ~/.config/kglobalshortcutsrc
  sed -i 's|\(Window to Desktop\) 7=[^,]*,[^,]*,[A-Za-z]\+ to Desktop 7|\1 7=Meta+Ctrl+\&,,\1 7|' ~/.config/kglobalshortcutsrc
  sed -i 's|\(Window to Desktop\) 8=[^,]*,[^,]*,[A-Za-z]\+ to Desktop 8|\1 8=Meta+Ctrl+*,,\1 8|' ~/.config/kglobalshortcutsrc
  sed -i 's|\(Window to Desktop\) 9=[^,]*,[^,]*,[A-Za-z]\+ to Desktop 9|\1 9=Meta+Ctrl+(,,\1 9|' ~/.config/kglobalshortcutsrc
  sed -i 's|\(Window to Desktop\) 10=[^,]*,[^,]*,[A-Za-z]\+ to Desktop 10|\1 10=Meta+Ctrl+),,\1 10|' ~/.config/kglobalshortcutsrc

  sed -i 's|^RectangularRegionScreenS.\+|RectangularRegionScreenShot=Meta+Shift+Print\\tMeta+Shift+S|' ~/.config/kglobalshortcutsrc
fi

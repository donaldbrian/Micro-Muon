#!/bin/bash
run_kons() {
konsole --hold \
        --geometry 1200x900+0+0 \
        -e /bin/bash -c "$*;$SHELL"
}
choice=$(kdialog --title "Updates" --geometry 360x300+300+300  \
             --separate-output  \
             --checklist "Update options:" \
                 1 "List upgradable packages"             off \
                 2 "Update database only"                 off \
                 3 "Update database and install packages" off \
                 4 "Search for packages"                  off \
                 5 "Search for packages - with details"   off \
                 6 "Search for packages - with dependecies and all"   off \
                 7 "Do something silly :·)"               off \
                 8 Exit                                  off)
case $choice in 
1) run_kons "apt list --upgradable -v" ; $0          ;;
2) run_kons "sudo apt update" ; $0                          ;;
3) run_kons "sudo apt update && sudo apt full-upgrade" ; $0 ;;
4) term=$(kdialog --title "Package search" --inputbox "Package to search for:  (partial names allowed - may return long lists)");run_kons "apt search $term;echo Use sudo apt install [package name] to install it." ; $0  ;;
5) term=$(kdialog --title "Package search" --inputbox "Package to search for:  (wildcards (*) allowed - returns a lot of info)");run_kons "apt-cache policy $term" ; $0  ;;
6) term=$(kdialog --title "Package search" --inputbox "Package to search for:  [wildcards (*) allowed (*not* advised)] - returns quite a lot of info)");run_kons "apt show  $term" ; $0  ;;
7) run_kons "apt moo" ; $0 ;;
8) exit
esac

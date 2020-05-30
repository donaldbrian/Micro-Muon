#!/bin/bash
choice=$(zenity --width=420 --height=320 --list \
  --title="Search and update" \
  --column="Choice" --column="Action" \
    1 "List upgradable packages" \
    2 "Update database only" \
    3 "Update database and install packages" \
    4 "Search for packages" \
    5 "Search for packages - with details" \
    6 "Search for packages - with dependecies and all" \
    7 "Do something silly" \
    8 "Exit" )
#echo $choice;exit
run_kons() {
konsole --hold \
        --geometry 1200x900+0+0 \
        -e /bin/bash -c "$*;$SHELL"
}
case $choice in 
1) run_kons "apt list --upgradable -v" ; $0          ;;
2) run_kons "sudo apt update" ; $0                          ;;
3) run_kons "sudo apt update && sudo apt full-upgrade" ; $0 ;;
4) term=$(zenity --title "Package search" --entry --text  "Package to search for:  (partial names allowed - may return long lists)");run_kons "apt search $term;echo Use sudo apt install [package name] to install it."; $0  ;;
5) term=$(zenity --title "Package search" --entry --text "Package to search for:  (wildcards (*) allowed - returns a lot of info)");run_kons "apt-cache policy $term"; $0  ;;
6) term=$(zenity --title "Package search" --entry --text  "Package to search for:  [wildcards (*) allowed (*not* advised)] - returns quite a lot of info)");run_kons "apt show  $term"; $0  ;;
7) run_kons "apt moo" ; $0 ;;
8) exit
esac

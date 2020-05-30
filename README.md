# Micro-Muon
Just make the script executable and run it.

Update.sh uses Kdialog.
Updzen.sh uses Zenity.
They both use konsole as terminal. 
If you'd like to use a different terminal (you should really just apt install konsole, but if you do...:·)
just (search and) replace "konsole" entries with "your terminal of choice" ones.

If you use yad get the zenity version and replace "zenity" entries with "yad".
Just add the line

choice=$(echo $choice | cut -c1-1)

between "8 "Exit" )" and "run_kons() {"

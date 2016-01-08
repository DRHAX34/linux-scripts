if [ $(id -u) -ne 0 ]; then
  echo "This script must be run as root";
  exit 1;
fi

if [ $# -eq 2 ]
  then
  create_ap --ieee80211n --ht_capab '[HT40+]' $1 $2 $3 $4
  else

  printf "Usage $0 <wifiInterface> <InternetOriginInterface> <HotspotSSID> <WPAKey>\n";

fi

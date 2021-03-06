#!/bin/bash
#constants
PCNSSETTINGSFILE=/opt/APC/PowerChute/group1/pcnsconfig.ini
BAKFILE=/opt/APC/PowerChute/group1/pcnsconfig.bak
CURRENT_ENV=

#try to detect environment
UNRAID_KERNEL_CHECK="Unraid"
APCCONTROL_FILE="/etc/apcupsd/apccontrol"
# if kernel version and apccontrol files are present - we are running on unraid
if [[ "$(uname -r | cut -d- -f2)" == "$UNRAID_KERNEL_CHECK" ]] && [[ -f "$APCCONTROL_FILE" ]]; then
    echo "We've detected UNRAID"
    CURRENT_ENV=UNRAID
elif [[ -f "$PCNSSETTINGSFILE" ]]; then # check if we are on pcns
    
    echo "We've detected PowerChute Network Shutdown (PCNS)"
    CURRENT_ENV=PCNS
    cp "${PCNSSETTINGSFILE}" "${BAKFILE}"
    #powerfail event
    #enable command file
    sed -ir "s/^[#]*\s*event_PowerFailed_enableCommandFile\ =\ .*/event_PowerFailed_enableCommandFile\ =\ true/" "${PCNSSETTINGSFILE}"
    #set 3 sec delay to avoid flapping
    sed -ir "s/^[#]*\s*event_PowerFailed_commandFileDelay\ =\ .*/event_PowerFailed_commandFileDelay\ =\ 3/" "${PCNSSETTINGSFILE}"
    #set the script handler
    sed -ir "s/^[#]*\s*event_PowerFailed_commandFilePath\ =\ .*/event_PowerFailed_commandFilePath\ =\ \/opt\/ups-telegram-notifier\/power-down-tg.sh/" "${PCNSSETTINGSFILE}"
elif [[ -f "$UNRAID_APCCONTROL_FILE" ]]; then
    echo "We've detected Generic APCUPSD"
    CURRENT_ENV=APCUPSD
fi



echo "please input telegram token, e.g. 123456:AbcDefGhi_JlkMno"
read tg_token
echo "please input telegram chat id, e.g. -12345678"
read tg_chat_id
echo TELEGRAM_TOKEN="${tg_token}" > /etc/telegram.sh.conf
echo TELEGRAM_CHAT="${tg_chat_id}" >> /etc/telegram.sh.conf
echo "please input the UPS name"
read ups_name
mkdir -p /opt/ups-telegram-notifier
cd /opt/ups-telegram-notifier
#iterate throught needed files --> download and postprocess them
for fn in power-down-tg.sh power-up-tg.sh bypass-on-tg.sh
do
  curl -o "${fn}" -fsSL https://raw.githubusercontent.com/Bobby-88/ups-telegram-notifier/master/"${fn}"
  sed -i "s/\[UPS_NAME\]/${ups_name}/g" "${fn}"
  chmod +x "${fn}"
done
curl -o telegram.sh -fsSL https://raw.githubusercontent.com/Bobby-88/ups-telegram-notifier/master/telegram.sh
chmod +x telegram.sh


#curl -o power-up-tg.sh -fsSL https://raw.githubusercontent.com/Bobby-88/ups-telegram-notifier/master/power-up-tg.sh
#sed -i "s/\[UPS_NAME\]/${ups_name}/g" power-up-tg.sh
#chmod +x power-up-tg.sh
#curl -o bypass-on-tg.sh -fsSL https://raw.githubusercontent.com/Bobby-88/ups-telegram-notifier/master/bypass-on-tg.sh
#chmod +x bypass-on-tg.sh
#config file


#installation for unraid
#sed -ir '/^.*Running\ on\ batteries\..*/a \\t\/opt\/ups-telegram-notifier\/power-down-tg.sh' apccontrol
echo "Installation done"


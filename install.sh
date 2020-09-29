#!/bin/bash

echo "please input telegram token"
read tg_token
echo "please input telegram chat id"
read tg_chat_id
echo TELEGRAM_TOKEN="${tg_token}" > /etc/telegram.sh.conf
echo TELEGRAM_CHAT="${tg_chat_id}" >> /etc/telegram.sh.conf
echo "please input the UPS name"
read ups_name
mkdir -p /opt/tg-notifier
cd /opt/tg-notifier
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

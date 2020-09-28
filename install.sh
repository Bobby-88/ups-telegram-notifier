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
curl -o telegram.sh -fsSL https://raw.githubusercontent.com/Bobby-88/shell-tg-notifier/master/telegram.sh
chmod +x telegram.sh
curl -o power-down-tg.sh -fsSL https://raw.githubusercontent.com/Bobby-88/shell-tg-notifier/master/power-down-tg.sh
sed -i "s/\[UPS_NAME\]/${ups_name}/g" power-down-tg.sh
chmod +x power-down-tg.sh
curl -o bypass-on-tg.sh -fsSL https://raw.githubusercontent.com/Bobby-88/shell-tg-notifier/master/bypass-on-tg.sh
chmod +x bypass-on-tg.sh

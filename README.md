# UPS Telegram Notifier

UPS Telegram Notifier is a tool which will inform you once anything happens with your UPS.

For example, if there is power failure - you will receive a notification in your telegram chat.

Currently, this tool supports integration with:
1. apcupsd (tested on UNRAID)
2. PowerChute Network Shutdown

# Installation
To install, please use:

```/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Bobby-88/shell-tg-notifier/master/install.sh)"```


Currently, the following events are supported:

##### 1. ONBATTERY
	This event occurs on a power outage on the main line, where UPS is coneected to

##### 2. OFFBATTERY
	This happens after ONBATTERY, when the mains return to normal condition

##### 3. COMMFAILURE
	If you disconnect UPS from the server (apcupsd/powerchute)

##### 4. COMMOK
	After the connectivity between server and UPS is restored



    failing)
	echo "Battery power exhausted on UPS ${2}. Doing shutdown." | ${WALL}
    ;;
    loadlimit)
	echo "Remaining battery charge below limit on UPS ${2}. Doing shutdown." | ${WALL}
    ;;
    runlimit)
	echo "Remaining battery runtime below limit on UPS ${2}. Doing shutdown." | ${WALL}
    ;;
    doreboot)
	echo "UPS ${2} initiating Reboot Sequence" | ${WALL}
	${SHUTDOWN} -r now "apcupsd UPS ${2} initiated reboot"
    ;;
    doshutdown)
	echo "UPS ${2} initiated Shutdown Sequence" | ${WALL}
	${SHUTDOWN} -h now "apcupsd UPS ${2} initiated shutdown"
    ;;
    emergency)
	echo "Emergency Shutdown. Possible battery failure on UPS ${2}." | ${WALL}
    ;;
    changeme)
	echo "Emergency! Batteries have failed on UPS ${2}. Change them NOW" | ${WALL}
    ;;

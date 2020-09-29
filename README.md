# UPS Telegram Notifier

UPS Telegram Notifier is a tool which will inform you via Telegram once anything happens with your UPS. 
Pretty handy if you have NAS protected with UPS (and you really should) and want basic monitoring for the setup.

For example, if there is power failure - you will receive a notification in your telegram chat.

Currently, this tool supports integration with:
1. apcupsd (tested on UNRAID)
2. PowerChute Network Shutdown


#### Currently, the following events are supported:

##### 1. ONBATTERY
	This event occurs on a power outage on the main line, where UPS is connected to

##### 2. OFFBATTERY
	This happens after ONBATTERY, when the mains return to normal condition

##### 3. COMMFAILURE
	If you disconnect UPS from the server (apcupsd/powerchute)

##### 4. COMMOK
	After the connectivity between server and UPS is restored

##### 5. CHANGEME
	When the UPS batteries have failed and should be changed. Normally, UPS will continuously beep during such malfunction.

##### 6. EMERGENCY
	echo "Emergency Shutdown. Possible battery failure on UPS ${2}." | ${WALL}
    ;;

    loadlimit)
	echo "Remaining battery charge below limit on UPS ${2}. Doing shutdown." | ${WALL}
    ;;
    runlimit)
	echo "Remaining battery runtime below limit on UPS ${2}. Doing shutdown." | ${WALL}
    ;;

    failing)
	echo "Battery power exhausted on UPS ${2}. Doing shutdown." | ${WALL}
    ;;

    doshutdown)
	echo "UPS ${2} initiated Shutdown Sequence" | ${WALL}
	${SHUTDOWN} -h now "apcupsd UPS ${2} initiated shutdown"
    ;;



# Installation
To install, please use:

```/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Bobby-88/shell-tg-notifier/master/install.sh)"```


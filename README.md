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

1. onbattery
	echo "Power failure on UPS ${2}. Running on batteries." | ${WALL}

2. offbattery)
	echo "Power has returned on UPS ${2}..." | ${WALL}
	wall "Mains power returned to UPS ${2}"

3. commfailure
	echo "Warning communications lost with UPS ${2}" | ${WALL}

4. commok
	echo "Communications restored with UPS ${2}" | ${WALL}



    failing)
	echo "Battery power exhausted on UPS ${2}. Doing shutdown." | ${WALL}
    ;;
    timeout)
	echo "Battery time limit exceeded on UPS ${2}. Doing shutdown." | ${WALL}
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

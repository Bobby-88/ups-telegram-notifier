# shell-tg-notifier
to install, please use:

```/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Bobby-88/shell-tg-notifier/master/install.sh)"```


Currently, the following events are supported:

onbattery)
echo "Power failure on UPS ${2}. Running on batteries." | ${WALL}

offbattery)
echo "Power has returned on UPS ${2}..." | ${WALL}
wall "Mains power returned to UPS ${2}"

commfailure
echo "Warning communications lost with UPS ${2}" | ${WALL}

commok
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

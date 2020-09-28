# shell-tg-notifier
to install, please use:

```/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Bobby-88/shell-tg-notifier/master/install.sh)"```

    commfailure
	echo "Warning communications lost with UPS ${2}" | ${WALL}
    
    commok
	echo "Communications restored with UPS ${2}" | ${WALL}
   
#
# powerout, onbattery, offbattery, mainsback events occur
#   in that order.
#
    powerout)
    ;;
    onbattery)
	echo "Power failure on UPS ${2}. Running on batteries." | ${WALL}
	wall "Mains power failure on UPS ${2}"
    ;;
    offbattery)
	echo "Power has returned on UPS ${2}..." | ${WALL}
	wall "Mains power returned to UPS ${2}"
    ;;
    mainsback)
	if [ -f /etc/apcupsd/powerfail ] ; then
	   printf "Continuing with shutdown."  | ${WALL}
	fi
    ;;
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
    annoyme)
	echo "Power problems with UPS ${2}. Please logoff." | ${WALL}
    ;;
    emergency)
	echo "Emergency Shutdown. Possible battery failure on UPS ${2}." | ${WALL}
    ;;
    changeme)
	echo "Emergency! Batteries have failed on UPS ${2}. Change them NOW" | ${WALL}
    ;;
    remotedown)
	echo "Remote Shutdown. Beginning Shutdown Sequence." | ${WALL}


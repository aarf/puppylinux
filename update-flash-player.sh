#!/bin/dash
# update flash player, works for 32-bit/64-bit
# jamesbond 2015
# MIT License
# i18n

export TEXTDOMAIN=get_app

### configuration
APPTITLE="$(gettext 'Flash Updater')"
WORKDIR=/tmp/flash-updater.$$

# make sure we cleanup after ourselves
trap 'rm -rf $WORKDIR; exit' 0 INT HUP TERM

### generic helper
# $1-text
msg() {
	[ -z "$DISPLAY" ] && echo "$1" ||
	Xdialog --title "$APPTITLE" --infobox "$1" 0 0 10000
}

# $1-text, no-text => kill previous splash
splash() {
	if [ "$1" ]; then
		if [ "$DISPLAY" ]; then
			Xdialog --title "$APPTITLE" --no-buttons --infobox "$1" 0 0 10000000 &
			SPID=$!
		else
			echo "$1"
		fi
	else 
		[ "$SPID" ] && kill $SPID 2>/dev/null
		SPID=""
	fi
}

get_config() {
	if [ $(id -u) -ne 0 ]; then
		msg "$(gettext 'You need to be root.')"
		exit
	fi	
	case $(uname -m) in
		i*86)
			LIBDIR=i386
			ARCH=lib
			USE_ARCH=32
			;;
		x86_64)
			LIBDIR=lib64
			ARCH=x86_64
			USE_ARCH=64
			;;
	esac
	INSTALL_PATH=/usr/$LIBDIR/mozilla/plugins/libflashplayer.so
}

### flash related stuff
# $1 path, stdout: version
get_flash_version() {
	strings "$1"  | 
	grep FlashPlayer_ | 
	cut -d "_" -f 2-5 | 
	sed 's/_/./g'
}

# stdout: version
get_latest_flash_version() {
	wget -qO - "http://www.adobe.com/software/flash/about/" | 
	grep -A 3 Linux | 
	sed -n 's#.*<td>\([0-9].*\)</td>.*#\1#p'
}

# $1-version, $2-target
download_flash() {
	wget -qO $2 "http://fpdownload.adobe.com/get/flashplayer/pdc/$1/flash_player_npapi_linux.$ARCH.tar.gz"
}

##### main #####
get_config
CURRENT=$(get_flash_version $INSTALL_PATH)

#Stupid Adobe decided not to support DRM for Linux after 11.x
if [ "$(echo "$CURRENT" | cut -d "." -f 1)" -le 23 ]; then
Xdialog --title "Flash Updater" --yesno  "You currently have Flash Player $CURRENT installed which can handle Digital Rights Management video streams. \n The Newer Flash players for Seamonkey/Firefox will not handle DRM streams. \n\n If you want to continue the update click yes. \n\n NOTE: At this time the only way to have the newest Flash player AND have it work with Hulu/Netfilx/Amazon is to use Google-Chrome." 0 0
value=$?
case $value in
1) echo "LEAVING"
exit
;;
255) echo "You closed the box "
exit
;;
esac
fi


splash "$(gettext 'Checking the version of the latest Flash player...')"
if ! LATEST=$(get_latest_flash_version); then
	splash
	msg "$(gettext 'Cannot connect to Adobe website. Leaving now.')"
	exit
fi
splash
if [ "$CURRENT" = "$LATEST" ]; then
	msg "$(eval echo $(gettext 'Your flash player $CURRENT is up-to-date.'))"
else
	splash "$(eval echo $(gettext 'Your current version is $CURRENT, now downloading version $LATEST...'))"
	mkdir $WORKDIR; cd $WORKDIR
	if download_flash $LATEST - | tar -xzv; then
		splash
		splash "$(gettext 'Download successful, now installing ...')"
		cp libflashplayer.so /usr/$LIBDIR/mozilla/plugins
		cp usr/bin/flash-player-properties /usr/bin/flash-player-properties-$USE_ARCH
		cp -a usr/share/icons usr/share/pixmaps usr/share/applications /usr/share
		splash
		msg "$(gettext 'Done. Restart your browser.')"
	else
		splash
		msg "$(gettext 'Download fail. Please try again.')"
	fi
fi
cd

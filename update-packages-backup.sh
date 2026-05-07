#!/bin/bash
# INSTALLED PACKAGES BACKUP


# Create log

log='backup/packages-backup-log'


if ${log+"false"};  then
    # la variable no está seteada
    echo "Please check file variable log."
    return 1; else
    if test ! -e "$log"; then
    # files doesn't exists
    # create it
    touch "$log"
    fi
fi

echo "--------------- Start log at: ---------------" >> $log
date >> $log

# Total packages
dpkg_all="backup/dpkg-all-installed-packages"
# Check Initial
if ${dpkg_all+"false"};  then
    # la variable no está seteada
    echo "Please check file variable dpkg_all."
    return 1; else
    if test ! -e "$dpkg_all"; then
    # files doesn't exists
    # create it
    touch "$dpkg_all"
    fi
fi
echo '>>>   Initial # of packages total:' >> $log
wc -l $dpkg_all >> $log


# Automatically installed dependencies
# #
dpkg_auto="backup/dpkg-auto-installed-packages"

# # Check Initial
if ${dpkg_auto+"false"}; then
    # la variable no está seteada
    echo "Please check file variable dpkg_auto."
    return 1; else

    if test ! -e "$dpkg_auto"; then
    # files doesn't exists
    # create it
    touch "$dpkg_auto"
    fi
fi
echo '>>>   Initial # of dependecies:' >> $log
wc -l $dpkg_auto >> $log


# Only manually installed packages
dpkg_manual="backup/dpkg-manually-installed-packages"

# Check Initial
if ${dpkg_manual+"false"}; then
    # la variable no está seteada
    echo "Please check file variable dpkg_manual."
    return 1; else

    if test ! -e "$dpkg_manual"; then
    # files doesn't exists
    # create it
    touch "$dpkg_manual"
    fi
fi

echo '>>>   Initial # of manually installed packages:' >> $log
wc -l $dpkg_manual >> $log



##################



# Manually installed snap packages
# #
snap_manual="backup/snap-manually-installed-packages"

# # Check Initial
if ${snap_manual+"false"}; then
    # la variable no está seteada
    echo "Please check file variable snap_manual."
    return 1; else

    if test ! -e "$snap_manual"; then
    # files doesn't exists
    # create it
    touch "$snap_manual"
    fi
fi
echo '>>>   Initial # of snap packages:' >> $log
wc -l $snap_manual >> $log

# Manually installed flatpak packages
# #
flatpak_manual="backup/flatpak-manually-installed-packages"

# # Check Initial
if ${flatpak_manual+"false"}; then
    # la variable no está seteada
    echo "Please check file variable flatpak_manual."
    return 1; else

    if test ! -e "$flatpak_manual"; then
    # files doesn't exists
    # create it
    touch "$flatpak_manual"
    fi
fi
echo '>>>   Initial # of flatpak packages:' >> $log
wc -l $flatpak_manual >> $log



echo "--------------- End log ---------------" >> $log


cat $log




# Update $dpkg_all
# dpkg-query -W -f='${Status} ${Package}\n' | grep "install ok installed" | awk '{print $4}' > $dpkg_all
# echo 'Updated # of packages total:' >> $log
# wc -l $dpkg_all >> $log

# Update $dpkg_auto
# apt-mark showauto > $dpkg_auto
# echo 'Updated # of dependecies:' >> $log
# wc -l $dpkg_auto >> $log

## Update $dpkg_manual
# comm -23 $dpkg_all $dpkg_auto > $dpkg_manual
# echo 'Updated # of manually installed packages:'  >> $log
# wc -l $dpkg_manual >> $log

## Update $snap_manual
# snap list | grep -v Publisher | grep -v canonical | awk '{print $1}' | tail -n +2 >> $snap_manual
# echo 'Updated # of manually installed packages:' >> $log
# wc -l $snap_manual >> $log

## Update $flatpak_manual
# flatpak list --app  | awk '{print $1}' | tail -n +1 >> $flatpak_manual
# echo 'Updated # of flatpak manually installed packages:' >> $log
# wc -l $flatpak_manual >> $log


# Command for installation of dpkg manually installed packages list
# xargs sudo apt install < $dpkg-manual


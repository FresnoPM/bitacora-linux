#!/bin/bash
#
# INSTALLED PACKAGES BACKUP

# Total packages

echo "--------------- Start log at: ---------------" >> 'backup/update-log'
date >> 'backup/update-log'

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
echo '>>>   Initial # of packages total:' >> 'backup/update-log'
wc -l $dpkg_all >> 'backup/update-log'


# Update
# dpkg-query -W -f='${Status} ${Package}\n' | grep "install ok installed" | awk '{print $4}' > $dpkg_all
# echo 'Updated # of packages total:'
# wc -l $dpkg_all
#



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
echo '>>>   Initial # of dependecies:' >> 'backup/update-log'
wc -l $dpkg_auto >> 'backup/update-log'


# update
# apt-mark showauto > $dpkg_auto
# echo 'Updated # of dependecies:'
# wc -l $dpkg_auto


# Only manually installed packages

# Check Initial

dpkg_manual="backup/dpkg-manually-installed-packages"

# # Check Initial
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

echo '>>>   Initial # of manually installed packages:' >> 'backup/update-log'
wc -l $dpkg_manual >> 'backup/update-log'


## Update
# comm -23 $dpkg_all $dpkg_auto > $dpkg_manual
# echo 'Updated # of manually installed packages:'
# wc -l $dpkg_manual


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
echo '>>>   Initial # of snap packages:' >> 'backup/update-log'
wc -l $snap_manual >> 'backup/update-log'





## Update
# snap list | grep -v Publisher | grep -v canonical | awk '{print $1}' | tail -n +2 >> $snap_manual
# echo 'Updated # of manually installed packages:' >> 'backup/update-log'
# wc -l $snap_manual >> 'backup/update-log'




## Update
# flatpak list --app  | awk '{print $1}' | tail -n +1 >> $flatpak_manual
# echo 'Updated # of flatpak manually installed packages:' >> 'backup/update-log'
# wc -l $flatpak_manual >> 'backup/update-log'

echo "--------------- End log ---------------" >> 'backup/update-log'


echo 'backup/update-log'



# Command for installation of manually installed packages list
# xargs sudo apt install < $dpkg-manual


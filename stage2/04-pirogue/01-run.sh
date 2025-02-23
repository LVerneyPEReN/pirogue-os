#!/bin/bash -e

# Disable useerconfig asking for the creation of a new unix user
on_chroot << EOF
apt-get remove --purge userconf-pi
EOF

###
# Install PiRogue packages
on_chroot << EOF
export PIROGUE_IMAGE_BUILD=0
curl -o /etc/apt/sources.list.d/pirogue-os.list "https://pts-project.org/ppa/pirogue.list"
curl -o /etc/apt/trusted.gpg.d/pirogue-os.asc "https://pts-project.org/ppa/Key.gpg"
apt update

DEBIAN_FRONTEND=noninteractive apt install -y pirogue-base
EOF
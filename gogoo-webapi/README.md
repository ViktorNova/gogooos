Here must be placed components from openwebos

Most of system components from openWebOS moved to portage
For install openWebOS clone install script from

git://github.com/openwebos/build-desktop.git

Then adjust build-webos-desktop.sh
i.e. comment at bottom of build-webos-desktop.sh build commands for packages placed here

WARNING!!!

DO NOT INSTALL openWebOS from install-webos-desktop.sh
IT WILL REWRITE YOUR /var/db. IT'S PAINFULL :(

I was do not tested install-webos-desktop.sh after installing this packages


You need to adjust install-webos-desktop.sh 
Comment  next lines in install-webos-desktop.sh 

  do_remove_folder /var/db
  ln -sf ${ROOTFS}/var/db /var/db


And adjust service-bus.sh like this

BEFORE
 service_start mojodb-luna -c /etc/palm/mojodb.conf /var/db

AFTER
 service_start mojodb-luna -c /etc/palm/mojodb.conf /var/lib/mojodb
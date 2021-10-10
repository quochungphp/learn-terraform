# SSH to ec2

```bash
# login
$ ssh 54.173.0.236 -l ubuntu -i ec2login

# use root permission
$ sudo -s

# show config
$ ifconfig

# show route
$ route -n

# ping to check can go out side
$ ping 8.8.8.8

```

# EBS volume
## Show default config
`$ df -h `
df -h
Filesystem      Size  Used Avail Use% Mounted on
udev            476M     0  476M   0% /dev
tmpfs            98M  768K   98M   1% /run
/dev/xvda1      7.7G  1.4G  6.4G  18% /
tmpfs           490M     0  490M   0% /dev/shm
tmpfs           5.0M     0  5.0M   0% /run/lock
tmpfs           490M     0  490M   0% /sys/fs/cgroup
/dev/loop0       33M   33M     0 100% /snap/snapd/13170
/dev/loop1       56M   56M     0 100% /snap/core18/2128
/dev/loop2       25M   25M     0 100% /snap/amazon-ssm-agent/4046
tmpfs            98M     0   98M   0% /run/user/1000

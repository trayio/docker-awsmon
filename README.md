#### AWS monitor tools

Full description can be found at https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/mon-scripts.html

Intended for use with CoreOS and systemd's timers.

Example setup (collect stats every 5 minutes):

/etc/systemd/system/awsmon.timer

```
[Unit]
Description=awsmon

[Timer]
OnCalendar=*:0/5
Unit=awsmon.service

[Install]
WantedBy=multi-user.target
```

/etc/systemd/system/awsmon.service

```
[Unit]
Description=awsmon
After=network.target

[Service]
Type=oneshot
ExecStart=/usr/bin/docker run --rm tray/awsmon --mem-util --disk-space-util --disk-path=/ --auto-scaling --from-cron
```

Enable and start the timer:

```
$ sudo systemctl enable awsmon.timer
$ sudo systemctl start awsmon.timer
```

install:
	install -m 644 -D ./override.conf /etc/systemd/system/snapper-timeline.timer.d/override.conf
	install -m 644 ./n0stack-backup@.timer /etc/systemd/system/
	install -m 644 ./n0stack-backup@.service /etc/systemd/system/
	install -m 644 ./fio /etc/snapper/configs/

uninstall:
	rm /etc/systemd/system/snapper-timeline.timer.d/override.conf
	rm /etc/systemd/system/n0stack-backup@.service
	rm /etc/systemd/system/n0stack-backup@.timer
	rm /etc/snapper/configs/fio

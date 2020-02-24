install:
	install -m 644 -D ./override.conf /etc/systemd/system/snapper-timeline.timer.d/override.conf
	install -m 644 ./n0stack-backup-image.timer /etc/systemd/system/
	install -m 644 ./n0stack-backup-image.service /etc/systemd/system/
	install -m 644 ./n0stack-backup@.timer /etc/systemd/system/
	install -m 644 ./n0stack-backup@.service /etc/systemd/system/
	install -m 644 ./fio /etc/snapper/configs/

uninstall:
	rm -f /etc/systemd/system/snapper-timeline.timer.d/override.conf
	rm -f /etc/systemd/system/n0stack-backup-image.service
	rm -f /etc/systemd/system/n0stack-backup-image.timer
	rm -f /etc/systemd/system/n0stack-backup@.service
	rm -f /etc/systemd/system/n0stack-backup@.timer
	rm -f /etc/snapper/configs/fio

SERVICE := gotify

include ../tools/Makefile.mk
include ../tools/Makefile.env

include ../tools/Makefile.Docker.mk

install:
	install -m 744 backup_gotify /etc/cron.daily/backup_gotify
	$(DC) up --no-start

restore:
	docker run --rm -i -t -v gotify_data:/data kadock/sqlite sqlite3 /data/gotify.db ".restore /data/gotify.backup.db"


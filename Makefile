SSH_HOSTNAME:=aws
SRC_DIRNAME:=etc/nginx
DST_DIRNAME:=/etc/nginx
TEMP_DIRNAME=/tmp/nginx

all:
	rsync -a --delete $(SRC_DIRNAME)/ -e ssh $(SSH_HOSTNAME):$(TEMP_DIRNAME)
	ssh $(SSH_HOSTNAME) sudo rsync -a $(TEMP_DIRNAME)/ $(DST_DIRNAME)
	ssh $(SSH_HOSTNAME) < ./ssh.sh

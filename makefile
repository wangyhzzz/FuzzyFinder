# objs=$(shell find cache -type d)
OBJS:=
DIR:=test
HASH=$(shell echo ${DIR}|md5sum.exe| cut -d' ' -f1)
DIR2:=cache/$(shell echo ${DIR}| sed 's@/\|:@.@g')

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
# mkfile_dir := $(dir $(mkfile_path))
cd:
	cd ~/.vim-fuf-data/ && make all -f ${mkfile_path}
all:
	make ${DIR2}.${HASH} -f ${mkfile_path}

cache/%: $(shell "/usr/bin/find" ${DIR} -type d)
	-rm ${DIR2}
	touch $@


SHELL := /bin/bash
.DEFAULT_GOAL=vars
TOOLS_DIR := ./tools
OUTPUT_DIR := ./outputs
AIB_SH_URL := https://gitlab.com/CentOS/automotive/src/automotive-image-builder/-/raw/main/auto-image-builder.sh?ref_type=heads
AIB_DISTRO := autosd10
AIB_MODE := package
AIB_TARGET = qemu
AIB_EXPORT = qcow2
AIB_IMAGE := image
AIB_OUTPUT := disk.qcow2
AIB_RUN_OPTS := --nographic
ESDV_BLUEPRINT_DIR :=

ifneq ($(ESDV_BLUEPRINT_DIR),)
	AIB_RUN_OPTS += --sharedir=${ESDV_BLUEPRINT_DIR}
endif

.PHONY: vars
vars:
	@$(foreach v, $(.VARIABLES), \
		$(if $(filter-out environment% default automatic, $(origin $v)), \
			echo $v=$($v);))

prepare/tools:
	mkdir -p ${TOOLS_DIR}
	curl -L -o ${TOOLS_DIR}/auto-image-builder.sh ${AIB_SH_URL}
	chmod +x ${TOOLS_DIR}/auto-image-builder.sh

prepare/output:
	mkdir -p ${OUTPUT_DIR}

prepare: prepare/tools prepare/output

.PHONY: build
build: prepare
	sudo ${TOOLS_DIR}/auto-image-builder.sh \
		build \
		--define-file aib/vars.yml  \
		--define-file aib/vars-devel.yml  \
		--distro ${AIB_DISTRO} \
		--mode ${AIB_MODE} \
		--target ${AIB_TARGET} \
		--export ${AIB_EXPORT} \
		aib/${AIB_IMAGE}.aib.yml ${OUTPUT_DIR}/${AIB_OUTPUT}
	sudo chown $(shell logname) ${OUTPUT_DIR}/${AIB_OUTPUT}

.PHONY: clean
clean:
	rm -rf ${OUTPUT_DIR}
	rm -rf ${TOOLS_DIR}
	sudo rm -rf _build/

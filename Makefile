SHELL := /bin/sh
.PHONY: all

export GO111MODULE=on

MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
MKFILE_DIR := $(dir $(MKFILE_PATH))
RELEASE_DIR := ${MKFILE_DIR}/build/bin
GO_MOD := $(shell go list -m)

CG_TARGET = ${RELEASE_DIR}/cg

all: ${CG_TARGET}

${CG_TARGET}:
	mkdir -p ${RELEASE_DIR}
	go mod tidy
	CGO_ENABLED=0 go build -a -o ${CG_TARGET} ${GO_MOD}/cmd/cargo

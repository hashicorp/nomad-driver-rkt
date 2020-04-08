#!/bin/sh
set -o errexit

DEST="pkg/linux_amd64"
NAME="nomad-driver-rkt"
mkdir -p "${DEST}"

echo "===> Building rkt driver binary"
echo

docker run -it --rm \
	-w /go/src/github.com/hashicorp/nomad-driver-rkt \
	-v "$(pwd):/go/src/github.com/hashicorp/nomad-driver-rkt" \
       	golang:1.12 \
	/bin/sh \
	-c "go build -o ${DEST}/${NAME} ."

echo
echo "===> Done: ${DEST}/${NAME}"

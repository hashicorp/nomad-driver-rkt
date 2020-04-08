**🚨 [Rkt has been abandoned upstream.](https://github.com/rkt/rkt) Users are encouraged to migrate their workloads to a [different task driver](https://nomadproject.io/docs/drivers/).**

Nomad Rkt Driver
==================

- Website: https://www.nomadproject.io
- Mailing list: [Google Groups](http://groups.google.com/group/nomad-tool)

Requirements
------------

- [Nomad](https://www.nomadproject.io/downloads.html) 0.9+
- [Go](https://golang.org/doc/install) 1.12.16 (to build the provider plugin)

Building The Driver
---------------------

Clone repository to: `$GOPATH/src/github.com/hashicorp/nomad-driver-rkt`

```sh
$ mkdir -p $GOPATH/src/github.com/hashicorp; cd $GOPATH/src/github.com/hashicorp
$ git clone git@github.com:hashicorp/nomad-driver-rkt
```

Enter the provider directory and build the provider

```sh
$ cd $GOPATH/src/github.com/hashicorp/nomad-driver-rkt
$ make build
```

Using the driver
----------------------

- [Documentation](https://nomadproject.io/docs/drivers/rkt/)

Developing the Provider
---------------------------

If you wish to work on the driver, you'll first need [Go](http://www.golang.org) installed on your machine. You'll also need to correctly setup a [GOPATH](http://golang.org/doc/code.html#GOPATH), as well as adding `$GOPATH/bin` to your `$PATH`.

To compile the provider, run `make build`. This will build the provider and put the provider binary in the `$GOPATH/bin` directory.

```sh
$ make build
```

In order to test the provider, you can simply run `make test`.

```sh
$ make test
```

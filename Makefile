.PHONY: all packages machines

TAG := "0.8.3"

all: ubuntu-15.10-x86_64 ubuntu-15.10-x86 ubuntu-15.04-x86_64 ubuntu-15.04-x86 ubuntu-14.04-x86_64 ubuntu-14.04-x86 ubuntu-12.04-x86_64 ubuntu-12.04-x86 

ubuntu-15.10-x86_64:
	./build.sh ubuntu-15.10-x86_64 $(TAG)

ubuntu-15.10-x86:
	./build.sh ubuntu-15.10-x86 $(TAG)

ubuntu-15.04-x86_64:
	./build.sh ubuntu-15.04-x86_64 $(TAG)

ubuntu-15.04-x86:
	./build.sh ubuntu-15.04-x86 $(TAG)

ubuntu-14.04-x86_64:
	./build.sh ubuntu-14.04-x86_64 $(TAG)

ubuntu-14.04-x86:
	./build.sh ubuntu-14.04-x86 $(TAG)

ubuntu-12.04-x86_64:
	./build.sh ubuntu-12.04-x86_64 $(TAG)

ubuntu-12.04-x86:
	./build.sh ubuntu-12.04-x86 $(TAG)

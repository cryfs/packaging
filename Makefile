.PHONY: all packages machines

REPOSITORY := "https://github.com/cryfs/cryfs"
TAG := "4bdd5"

all: packages

DOCKERFILES := $(shell find docker -name "*.dockerfile" | sed -n 's|^docker/||p')

# -------------------------------------------------------------------------------
# Build docker containers for the operating systems we want to build packages for
# -------------------------------------------------------------------------------

CONTAINERTARGETS := $(DOCKERFILES:.dockerfile=.image)

containers: $(CONTAINERTARGETS)

%.image: docker/%.dockerfile
	docker build -t cryfs/$* -f $< docker

# -------------------------------------
# Build packages using these containers
# -------------------------------------

PACKAGETARGETS := $(addprefix build/,$(DOCKERFILES:.dockerfile=.deb))

packages: $(PACKAGETARGETS)

build/%.deb: %.image
	docker run cryfs/$* $(REPOSITORY) $(TAG) > $@

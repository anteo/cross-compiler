PLATFORMS = android-arm \
            android-x86 \
			darwin-x64 \
			linux-x86 \
			linux-x64 \
			linux-arm \
			windows-x86 \
			windows-x64
DOCKER = docker
IMAGE = anteo/cross-compiler

.PHONY: $(PLATFORMS)

all:
	$(DOCKER) build -t $(IMAGE):base .
	for i in $(PLATFORMS); do \
		$(DOCKER) build -t $(IMAGE):$$i $$i ; \
	done

$(PLATFORMS):
	$(DOCKER) build -t $(IMAGE):base .
	$(DOCKER) build -t ${IMAGE}:$@ $@

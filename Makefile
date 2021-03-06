REPO = https://github.com/imdea-software/fcsl-pcm.git
TAG = v1.3
WORKDIR = workdir

.PHONY: all get

all: $(WORKDIR)
	dune build

get: $(WORKDIR)

$(WORKDIR):
	git clone --recursive --depth=1 -b $(TAG) $(REPO) $(WORKDIR)
	cp -r dune-files/* $(WORKDIR)/

install:
	dune install coq-fcsl-pcm

REPO = https://github.com/imdea-software/fcsl-pcm.git
TAG = master #v1.3
COMMIT = 1c7389f9b73ffa63295bd7b3bddb0fcbf727abb3
WORKDIR = workdir

.PHONY: all get

all: $(WORKDIR)
	dune build

get: $(WORKDIR)

$(WORKDIR):
	git clone --recursive --depth=1 -b $(TAG) $(REPO) $(WORKDIR)
	${if $(COMMIT), (cd $(WORKDIR) && git checkout $(COMMIT))}
	cp -r dune-files/* $(WORKDIR)/

install:
	dune install coq-fcsl-pcm

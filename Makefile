REPO = https://github.com/imdea-software/fcsl-pcm.git
TAG = master #v1.3
COMMIT = 1c7389f9b73ffa63295bd7b3bddb0fcbf727abb3
WORKDIR = workdir

# Git boilerplate
define GIT_CLONE_COMMIT
mkdir -p $(WORKDIR) && cd $(WORKDIR) && git init && \
git remote add origin $(REPO) && \
git fetch --depth=1 origin $(COMMIT) && git reset --hard FETCH_HEAD
endef

.PHONY: all get

all: $(WORKDIR)
	dune build

get: $(WORKDIR)

$(WORKDIR):
	${if $(COMMIT), $(GIT_CLONE_COMMIT), git clone --recursive --depth=1 -b $(TAG) $(REPO) $(WORKDIR)}
	cp -r dune-files/* $(WORKDIR)/

install:
	dune install coq-fcsl-pcm

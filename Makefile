# DOCKER STUFF

build:
	docker build -t unpaper .
run:
	docker run -i -t -v $$(pwd):/src unpaper
debug:
	docker run -i -t -v $$(pwd):/src unpaper /bin/bash

# UNAPPER STUFF
pgm:
	pdftoppm -gray -r 300 input/input.pdf
unpaper:
	for F in build/-*.pgm; do unpaper $$F $$F.out; done
dirtypdf:
	convert -verbose build/-1.pgm build/out.pdf
pdf:
	convert -verbose build/*.pgm.out build/out.pdf
clean:
	rm -f build/*
all: clean pgm unpaper pdf

.PHONY: build

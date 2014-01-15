# DOCKER STUFF

build:
	docker build -t dergachev/straighten-pdf .
run:
	docker run -i -t -v $$(pwd):/src dergachev/straighten-pdf
debug:
	docker run -i -t -v $$(pwd):/src dergachev/straighten-pdf /bin/bash

# UNPAPER STUFF
ppm:
	pdftoppm ${PDFTOPPM_ARGS} build/in.pdf build/out
rename:
	for F in build/out-*.p*m; do NEW=$$(echo $$F | perl -n -e '/build\/out-(\d+)/ && print sprintf("build/out-%06d.raw",$$1)'); mv $$F $$NEW; done
unpaper:
	unpaper ${UNPAPER_ARGS} build/out-%06d.raw build/out-%02d.pgm.processed
unprocessed:
	convert ${CONVERT_ARGS} build/out-* build/unprocessed.pdf
pdf:
	convert ${CONVERT_ARGS} build/*.processed build/out.pdf
clean:
	rm -f build/out*
all: clean ppm rename unpaper pdf

.PHONY: build

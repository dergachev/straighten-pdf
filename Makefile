convert_args=-verbose -units PixelsPerInch -density 300 -deskew 50% -compress jpeg -quality 20 -depth 8 -background white -alpha remove -alpha off
in=build/in.pdf
out=build/out.pdf

run:
	docker run -i -t -v `pwd`:/src \
	  dergachev/straighten-pdf \
		convert $(convert_args) $(in) $(out)

build:
	docker build -t dergachev/straighten-pdf .

debug:
	docker run -i -t -v `pwd`:/src dergachev/straighten-pdf /bin/bash

.PHONY: build

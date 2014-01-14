straighten-pdf
==============

Docker image to straighten scanned PDFs

## Install

Make sure you have docker installed.

To build the docker container:

```
git clone https://github.com/dergachev/straighten-pdf
cd straighten-pdf
docker build -t unpaper .
```

## Usage

To use, copy your input PDF to `input/in.pdf`.
Then run the container.

```
docker run -i -t -v $(pwd):/src unpaper
```

The output will be stored in `build/out.pdf`.

## Notes

* Uses unpaper, which forces a greyscale conversion.
* Currently set to 300dpi, which is slow and produces large files (1.5MB / page)
* See Makefile for handy shortcuts

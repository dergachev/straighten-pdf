straighten-pdf
==============

Docker image to straighten scanned PDFs using [unpaper](http://unpaper.berlios.de).

## Install

Make sure you have docker installed. Then build the `dergachev/straighten-pdf` container:

```bash
git clone https://github.com/dergachev/straighten-pdf
cd straighten-pdf

# if you are lazy and trust me, just download the docker image
docker pull dergachev/straighten-pdf

# otherwise, build it locally yourself
docker build -t dergachev/straighten-pdf .
```

## Usage

With docker running and `dergachev/straighten-pdf` image installed, run `straighten-pdf.sh`:

```bash
bash run.sh INPUTFILE.pdf
```

The following env variables are respected by straighten-pdf.sh , with respective default values:

```bash
PDFTOPPM_ARGS="-gray -r 300"
UNPAPER_ARGS=""
CONVERT_ARGS="-verbose -limit memory 400m -limit map 400m"
```

For info on these args, see respective manpages:
* [man pdftoppm](http://linux.die.net/man/1/pdftoppm)
* [man unpaper](http://unpaper.berlios.de) (we use 0.4.2, not 0.3)
* [man convert](http://linux.die.net/man/1/convert)

The output will be stored in `build/INPUTFILE.pdf`.

## Notes

* Currently set to 300dpi, which is slow and produces large files (1.5MB / page)
* Can be memory hungry. By default limited to 400m.
* See Makefile for handy shortcuts

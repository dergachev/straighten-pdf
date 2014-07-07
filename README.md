straighten-pdf
==============

Docker image to straighten scanned PDFs using imagemagick.

## Install

Make sure you have docker installed. Then build the `dergachev/straighten-pdf` image:

```bash
git clone https://github.com/dergachev/straighten-pdf
cd straighten-pdf

# optinally, install squid-deb-proxy on your docker host to speed up the build
sudo apt-get install -y squid-deb-proxy

docker build -t dergachev/straighten-pdf .
```

## Usage

With docker running and `dergachev/straighten-pdf` image installed, simply use `make run`:

```bash
make run in=build/infile.pdf out=build/out.pdf
```

The following is the default value of `convert_arg` variable, respected by `make run`:

```bash
convert_args="-verbose -units PixelsPerInch -density 300 -deskew 50% -compress jpeg -quality 20 -depth 8 -background white -alpha remove -alpha off"
```
The background/alpha args are to remove transparency from generated PDFs, which seems to help file size.

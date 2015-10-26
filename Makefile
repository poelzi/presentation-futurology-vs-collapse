SHELL := /usr/bin/zsh
TEX_FILES=$(wildcard src/*.tex)
PDF_FILES=$(TEX_FILES:src/%.tex=out/%.pdf)
PICDIR = ./img

depsvg = $(wildcard $(PICDIR)/*.svg)
svgpdf = $(patsubst %.svg,%.pdf,$(depsvg))


all: deppdf $(PDF_FILES)
clean:
	rm $(svgpdf)
	rm -rf out

deppdf: $(svgpdf)
	echo test echo $(svgpdf)
	echo test


$(PICDIR)/%.pdf: $(PICDIR)/%.svg 
	inkscape -z -T -A $@ $<

imgs:
	./build_img.sh

out/%.pdf:  src/%.tex deppdf imgs  Makefile
	mkdir -p out
	# pdflatex -draftmode  -output-directory out $<
	pdflatex -output-directory out $<



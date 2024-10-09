.PHONY: all build clean

default = all


IMAGE_RUNNER=podman
IMAGE=registry.gitlab.com/islandoftex/images/texlive:latest
WORKDIR=$(PWD)
SOURCES=cv.tex


all: build clean


build: $(SOURCES:.tex=.pdf)


%.pdf: %.tex
	"$(IMAGE_RUNNER)" run --rm --name=cv-builder --volume "$(WORKDIR)":/build --workdir /build "$(IMAGE)"  pdflatex $<


clean:
	rm -f *.aux
	rm -f *.log
	rm -f *.out

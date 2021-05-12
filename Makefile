.PHONY: all zip clean

TEX = mmoptex
ZIP = zip

ZIPNAME = pdfextra.zip

SOURCES = \
	examples/pdfextra-example-part.prc \
	examples/pdfextra-example.pdf \
	examples/pdfextra-example.tex \
	pdfextra-doc.pdf \
	pdfextra-doc.tex \
	pdfextra.opm \
	LICENSE \
	README.md

TARGETS = pdfextra-doc.pdf

all: $(TARGETS)

zip: $(ZIPNAME) Makefile
$(ZIPNAME): $(SOURCES) $(TARGETS)
	zip $@ $^

pdfextra-doc.pdf: pdfextra-doc.tex pdfextra.opm optex-doc.eref
	$(TEX) $<
	$(TEX) $<

clean:
	$(RM) $(TARGETS) $(ZIPNAME) *.ref *.log examples/*.ref examples/*.log

.PHONY: all zip clean

TEX = mmoptex

ZIP_NAME = pdfextra.zip
ZIP_PREFIX = pdfextra

SOURCES = \
	examples/pdfextra-example-part.prc \
	examples/pdfextra-example.pdf \
	examples/pdfextra-example.tex \
	examples/pdfextra-example-latex.tex \
	pdfextra-doc.pdf \
	pdfextra-doc.tex \
	pdfextra.opm \
	pdfextra.tex \
	pdfextra.sty \
	LICENSE \
	README.md

TARGETS = pdfextra-doc.pdf examples/pdfextra-example.pdf

all: $(TARGETS)

zip: $(ZIP_NAME) Makefile
$(ZIP_NAME): $(SOURCES) $(TARGETS)
	$(RM) -r $(ZIP_PREFIX); mkdir -p $(ZIP_PREFIX)
	rsync -R $(SOURCES) $(ZIP_PREFIX)/
	zip -r $@ $(ZIP_PREFIX) || $(RM) $@
	$(RM) -r $(ZIP_PREFIX)

pdfextra-doc.pdf: pdfextra-doc.tex pdfextra.opm extref/optex-doc.eref \
		extref/tex-nutshell.eref
	# special path searching setup is required here
	$(TEX) $<
	$(TEX) $<
	$(TEX) $<

examples/pdfextra-example.pdf: examples/pdfextra-example.tex \
		examples/pdfextra-example-part.prc
	# special path searching setup is required here
	cd examples; \
		$(TEX) pdfextra-example.tex; \
		$(TEX) pdfextra-example.tex; \
		$(TEX) pdfextra-example.tex;

clean:
	$(RM) -r $(TARGETS) $(ZIP_NAME) $(ZIP_PREFIX) *.pdf *.ref *.log \
		examples/*.pdf examples/*.ref examples/*.log examples/*.js \
		examples/*.aux examples/*.out

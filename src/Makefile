#
#	Build usable docs
#

ASCIIDOCTOR = asciidoctor
DSD_GUIDE = dsd-guide
PANDOC = pandoc
PNGSRC = fig1.ditaa fig2.ditaa
PNGS = $(PNGSRC:.ditaa=.png)

# Build the guide in PDF format
all: $(DSD_GUIDE).pdf


$(DSD_GUIDE).pdf: $(DSD_GUIDE).adoc
	$(ASCIIDOCTOR) -d book -r asciidoctor-pdf -b pdf $<


$(DSD_GUIDE).adoc: $(PNGS)
	touch $@

install: all
	cp $(DSD_GUIDE).adoc ..
	cp *.png ..
	cp $(DSD_GUIDE).pdf ..

clean:
	rm -f $(DSD_GUIDE).pdf
	rm -f $(PNGS)

# handy shortcuts for installing necessary packages: YMMV
install-debs:
	sudo apt-get install pandoc asciidoctor ruby-asciidoctor-pdf ditaa

install-rpms:
	sudo dnf install pandoc rubygem-asciidoctor rubygem-asciidoctor-pdf \
		ditaa

%.png: %.ditaa
	ditaa $< $@


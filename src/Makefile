#
#	Build usable docs
#

ASCIIDOCTOR = asciidoctor
DSD_GUIDE = dsd-guide
PANDOC = pandoc
PNGSRC = fig1.ditaa fig2.ditaa
PNGS = $(PNGSRC:.ditaa=.png)

# Build the guide in several formats
all: $(DSD_GUIDE).md $(DSD_GUIDE).pdf $(DSD_GUIDE).html $(DSD_GUIDE).rst

$(DSD_GUIDE).md: $(DSD_GUIDE).xml
	$(PANDOC) -f docbook -t gfm $< -o $@ 

$(DSD_GUIDE).xml: $(DSD_GUIDE).adoc
	$(ASCIIDOCTOR) -d book -b docbook $<

$(DSD_GUIDE).pdf: $(DSD_GUIDE).adoc
	$(ASCIIDOCTOR) -d book -r asciidoctor-pdf -b pdf $<

$(DSD_GUIDE).html: $(DSD_GUIDE).adoc
	$(ASCIIDOCTOR) -d book -b html $<

$(DSD_GUIDE).rst: $(DSD_GUIDE).md
	$(PANDOC) -f gfm -t rst $< -o $@ 

$(DSD_GUIDE).adoc: $(PNGS)
	touch $@

install: all
	cp $(DSD_GUIDE).adoc ..
	cp $(DSD_GUIDE).xml ..
	cp $(DSD_GUIDE).md ..
	cp $(DSD_GUIDE).pdf ..
	cp $(DSD_GUIDE).html ..
	cp $(DSD_GUIDE).rst ..

clean:
	rm -f $(DSD_GUIDE).xml
	rm -f $(DSD_GUIDE).md
	rm -f $(DSD_GUIDE).pdf
	rm -f $(DSD_GUIDE).html
	rm -f $(DSD_GUIDE).rst
	rm -f $(PNGS)

# handy shortcuts for installing necessary packages: YMMV
install-debs:
	sudo apt-get install pandoc asciidoctor ruby-asciidoctor-pdf ditaa

install-rpms:
	sudo dnf install pandoc rubygem-asciidoctor rubygem-asciidoctor-pdf \
		ditaa

%.png: %.ditaa
	ditaa $< $@


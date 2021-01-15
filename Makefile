#
#	Build usable docs
#

ASCIIDOCTOR = asciidoctor
DSD_GUIDE = dsd-guide
PANDOC = pandoc

# Build the guide in several formats
all: $(DSD_GUIDE).md $(DSD_GUIDE).pdf $(DSD_GUIDE).html

$(DSD_GUIDE).md: $(DSD_GUIDE).xml
	$(PANDOC) -f docbook -t markdown_strict $< -o $@ 

$(DSD_GUIDE).xml: $(DSD_GUIDE).adoc
	$(ASCIIDOCTOR) -d book -b docbook $<

$(DSD_GUIDE).pdf: $(DSD_GUIDE).adoc
	$(ASCIIDOCTOR) -d book -r asciidoctor-pdf -b pdf $<

$(DSD_GUIDE).html: $(DSD_GUIDE).adoc
	$(ASCIIDOCTOR) -d book -b html $<

$(DSD_GUIDE).adoc: $(PARTS)
	touch $@

clean:
	rm -f $(DSD_GUIDE).xml
	rm -f $(DSD_GUIDE).md
	rm -f $(DSD_GUIDE).pdf
	rm -f $(DSD_GUIDE).html

# handy shortcuts for installing necessary packages: YMMV
install-debs:
	sudo apt-get install pandoc asciidoctor ruby-asciidoctor-pdf

install-rpms:
	sudo dnf install pandoc rubygem-asciidoctor rubygem-asciidoctor-pdf


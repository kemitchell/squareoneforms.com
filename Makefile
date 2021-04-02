partials=$(wildcard partials/*.html)
html_templates=$(wildcard **/*.html.m4) index.html.m4

.PHONY: all

all: $(html_templates:.html.m4=.html) logo.png logo-on-white-250.png diagram.png | node_modules
	./index-forms

logo.png: logo.svg
	convert -size 500x500 $< $@

logo-on-white-250.png: logo.svg
	convert -size 250x250 $< $@

%.html: %.html.m4 $(partials)
	m4 $< > $@

%.png: %.dot
	dot -Tpng $< > $@

node_modules:
	npm ci

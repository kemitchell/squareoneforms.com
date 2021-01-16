.PHONY: all

all: index.html diagram.png | node_modules
	./index-forms

%.html: %.html.m4
	m4 $< > $@

%.png: %.dot
	dot -Tpng $< > $@

node_modules:
	npm ci

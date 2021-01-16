.PHONY: all

all: diagram.png | node_modules
	./index-forms

%.png: %.dot
	dot -Tpng $< > $@

node_modules:
	npm ci

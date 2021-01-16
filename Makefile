.PHONY: all

all: diagram.png
	./index-forms

%.png: %.dot
	dot -Tpng $< > $@

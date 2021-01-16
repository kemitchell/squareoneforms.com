.PHONY: all

all: graph.png
	./index-forms

%.png: %.dot
	dot -Tpng $< > $@

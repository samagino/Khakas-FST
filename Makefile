LANG = kjh

all:$(LANG).gen.hfst

mor:$(LANG).mor.hfst

$(LANG).mor.hfst:$(LANG).gen.hfst
	hfst-invert $< -o $@

$(LANG).gen.hfst:$(LANG).lexc.hfst $(LANG).twol.hfst
	hfst-compose-intersect -1 $(LANG).lexc.hfst -2 $(LANG).twol.hfst -o $@

$(LANG).lexc.hfst:$(LANG).lexc
	hfst-lexc $< -o $@

$(LANG).twol.hfst:$(LANG).twol
	hfst-twolc $< -o $@

.PHONY=clean

clean:
	- rm -f *.hfst

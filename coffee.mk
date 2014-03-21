COFFEE = $(shell find coffee -name '*.coffee')
COFFEE_TARGETS = $(COFFEE:coffee/%.coffee=%.js)
COFFEE_DOCS = $(COFFEE:coffee/%.coffee=docs/%.html)

coffee_targets: $(COFFEE_TARGETS) $(COFFEE_DOCS)

coffee_clean:
	rm $(COFFEE_TARGETS) $(COFFEE_DOCS)

# compile coffeescript and create source maps
$(COFFEE_TARGETS): %.js: coffee/%.coffee
	mkdir -p $(@D) && coffee -o $(@D) -mc $<

# generate documentation
$(COFFEE_DOCS): docs/%.html: coffee/%.coffee | docs
	mkdir -p $(@D) && docco -o $(@D) $<

LESS = $(shell find less -name '*.less')
LESS_TARGETS = $(LESS:less/%.less=%.css)

less_targets: $(LESS_TARGETS)

less_clean:
	rm $(LESS_TARGETS)

# compile less and create source maps
$(LESS_TARGETS): %.css: less/%.less
	mkdir -p $(@D) && lessc --source-map=$@.map --source-map-url=$(@:static%=%).map $< > $@

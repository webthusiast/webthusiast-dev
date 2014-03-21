GRAPHVIZ = $(shell find graphviz -name '*.dot')
GRAPHVIZ_TARGETS = $(GRAPHVIZ:graphviz/%.dot=%.png)

graphviz_targets: $(GRAPHVIZ_TARGETS)

graphviz_clean:
	rm $(GRAPHVIZ_TARGETS)

$(GRAPHVIZ_TARGETS): %.png: graphviz/%.dot
	mkdir -p $(@D) && dot -T png -o $@ $<

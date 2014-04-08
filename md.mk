MD = $(shell find md -name '*.md')
MD_TARGETS = $(MD:md/%.md=%.html)

md_targets: $(MD_TARGETS)

md_clean:
	rm $(MD_TARGETS)

# execute md, passing the environment as definitions
$(MD_TARGETS): %.html: md/%.md
	mkdir -p $(@D) && md2html $^ > $@

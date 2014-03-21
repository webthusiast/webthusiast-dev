M4 = $(shell find m4 -name '*.m4')
M4_TARGETS = $(M4:m4/%.m4=%)

m4_targets: $(M4_TARGETS)

m4_clean:
	rm $(M4_TARGETS)

# execute m4, passing the environment as definitions
$(M4_TARGETS): %: m4/%.m4 .env
	mkdir -p $(@D) && m4 `eval cat $(filter %.env, $^) | sed 's/^/--define /'` $(filter %.m4, $^) > $@

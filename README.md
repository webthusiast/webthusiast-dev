Usage:

In `Makefile`, after the default target, include some makefile snippets:

	default: m4_targets coffee_targets less_targets graphviz_targets
	clean: m4_clean coffee_clean less_clean graphviz_clean

    include node_modules/webthusiast-dev/m4.mk
    include node_modules/webthusiast-dev/coffee.mk
    include node_modules/webthusiast-dev/less.mk
    include node_modules/webthusiast-dev/graphviz.mk

# Makefile for generating minified files

.PHONY: all

# we cheat and process all .js files instead of an exhaustive list
all: $(patsubst %.js,%.min.js,$(filter-out %.min.js,$(wildcard *.js)))

%.min.js: %.js
	yuicompressor --preserve-semi $< -o ./bin/$@

test: jquery.flot*.js
	./node_modules/.bin/jshint $<

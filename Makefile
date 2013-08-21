# Flot Makefile

BUILD_PATH = ./bin
SRC_PATH = $(filter-out *.min.js,$(wildcard *.js))
SRC = $(wildcard jquery.flot*.js)

.PHONY: all

# The default behavior is to minify all our JavaScript files
JS_MINIFIED = $(SRC_PATH:.js=.min.js)

all: $(JS_MINIFIED)

%.min.js: %.js
	yuicompressor $< -o $(BUILD_PATH)/$@

# Flot's Travis test suite runs JSHint with the options in .jshintrc

.PHONY: test
JS_HINT = $(SRC:.js=.hint.js)
test: $(JS_HINT)

%.hint.js: %.js
	./node_modules/.bin/jshint $<

.PHONY: clean

clean:
	rm -f $(BUILD_PATH)
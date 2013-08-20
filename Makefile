# Flot Makefile

BUILD_PATH = ./bin
SRC_PATH = $(filter-out *.min.js,$(wildcard *.js))

.PHONY: all

# The default behavior is to minify all our JavaScript files
JS_MINIFIED = $(SRC_PATH:.js=.min.js)

all: $(JS_MINIFIED)

%.min.js: %.js
	yuicompressor $< -o $(BUILD_PATH)/$@

# Flot's Travis test suite runs JSHint with the options in .jshintrc

test:
	./node_modules/.bin/jshint jquery.flot*.js

.PHONY: clean

clean:
	rm -f $(BUILD_PATH)
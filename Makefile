BIN = node_modules/.bin
BAILEY = $(BIN)/bailey

HOSTNAME = $(shell hostname -f)
CORRECT_HOSTNAME = abakus.no

STYLUS_FILES = $(shell find src/stylus -name "*.styl")
SOURCE_FILES = $(shell find src -name "*.bs")
TEST_FILES = $(shell find test -name "*.bs")

ifeq ($(findstring $(CORRECT_HOSTNAME),$(HOSTNAME)),$(CORRECT_HOSTNAME))
	ENV = production
	STYLUS = $(BIN)/stylus --compress --include node_modules/nib/lib < $(STYLUS_FILES)
else
	ENV = development
	STYLUS = $(BIN)/stylus --sourcemap --include node_modules/nib/lib < $(STYLUS_FILES)
endif

all: dist dist/public/main.css | node_modules

dist: $(SOURCE_FILES)
	$(BAILEY) -c source

dist/test: $(TEST_FILES)
	$(BAILEY) -c test

dist/public/main.css: | dist/public
	$(STYLUS) > $@

test: all dist/test
	npm test

production:
	git fetch && git reset --hard origin/master
	npm install
	npm update
	make
	forever restart $(PWD)/index.js

dist/public:
	mkdir -p $@

node_modules:
	npm install

.PHONY: all production test

BIN = node_modules/.bin

all: node_modules

node_modules:
	npm install

production:
	git fetch && git reset --hard origin/master
	npm install
	$(BIN)/gulp
	forever restart $(PWD)/index.js

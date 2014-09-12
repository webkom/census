all: node_modules

node_modules:
	npm install

update:
	git fetch && git reset --hard origin/master
	npm install
	node_modules/.bin/gulp

production: update

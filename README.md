# census
Headcount for our servers.

### Usage
```bash
curl -X POST http://census.abakus.no/api/report --data "hostname=<hostname>&username=<username>"
```

## Setup
```bash
git clone git@github.com:webkom/census.git
cd census
npm install
gulp
```

## Tests
```bash
mocha
```

--------
MIT © webkom, Abakus Linjeforening


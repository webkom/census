# census
[![Build Status](https://travis-ci.org/webkom/census.svg)](https://travis-ci.org/webkom/census) [![Coverage Status](https://coveralls.io/repos/webkom/census/badge.png?branch=master)](https://coveralls.io/r/webkom/census?branch=master)

Headcount for our servers. It is a little web project based on express.js, which
lists servers based on pings to its API. The servers themselves need to report
to be shown in the list. However, it is not necessary to attach more than hostname
and a username in the POST request.

If more than 15 minutes pass without a report, your server will show up as dead.

### Reporting
The easiest way to report to Census is to set up a cron job that reports every ten mintues to Census. 
```bash
curl -X POST https://census.abakus.no/api/report --data "hostname={hostname}&username={username}"
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


# census [![Build status](https://ci.frigg.io/badges/webkom/census/)](https://ci.frigg.io/webkom/census/last/) [![Coverage status](https://ci.frigg.io/badges/coverage/webkom/census/)](https://ci.frigg.io/webkom/census/last/)

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

### Authentication
This project requires users to be authenticated in order to see info like IP and
servers that does not belong to the organisation. The project uses passport for
authentication. You can easily add you own strategy by setting the environment
variable `PASSPORT_STRATEGY` to a package or path that require can reach. The
strategy needs to be wrapped in a function like [passport-abakus](https://github.com/webkom/passport-abakus/blob/master/index.bs#L4).
The options you want to pass into the function needs to be put into an environment
variable called `PASSPORT_STRATEGY_OPTIONS`

## Tests
```bash
npm test
```

--------
MIT © webkom, Abakus Linjeforening

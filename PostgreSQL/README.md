# FormaServe f_Learning Repository

![FormaServe Logo](/images/Logo.png)

## Welcome to our Postgress Cribsheet 👋

This is a collection of notes and snippets that I have written to help you get started with PostgreSQL.

Hopefully, they will be of use to you.

## Commands

| Description | Command                                                 |
| ----------- | ------------------------------------------------------- |
| YUM Install | yum install postgresql12-server postgresql12-contrib    |
| Create Postgres Profile | CRTUSRPRF USRPRF(POSTGRES) USRCLS(*SECOFR) TEXT('Profile for POSTGRESQL database') HOMEDIR('/home/postgres') |
| Create Postgres Home Directory | mkdir /home/postgres |
| Change Postgres Directory Owner | mkdir /home/postgres |
| Change Postgres Directory Owner | mkdir /home/postgres |
| Set Environment Variables | export PGDATA=/home/postgres |
| Ensure Path Set | export PATH=$PATH:/QOpenSys/pkgs/bin/ |
| PostgreSQL Init | initdb -E UTF-8 -D /home/postgres -W -A scram-sha-256 |
| Start Postgres server | pg_ctl -D /home/postgres -l logfile start |
| End Postgres server | pg_ctl -D /home/postgres -l logfile stop |
| Postgres Port No | 5432 |
| Check Server | NETSTAT *CNN - Look for port 5432 |
| Check Server | Looking for postgres jobs in QUSRWRK subsystem |
| Submit Start Server to Batch using POSTGRES profile | SBMJOB CMD(QSH CMD('/QOpenSys/pkgs/bin/pg_ctl -D /home/postgres -l logfile start')) JOB(STR_POSTGR) |
| Enter Postgress from BASH | psql |

## 👨‍🏫 Training

We are still providing training in these strange times.  [Get in contact here.](https://www.formaserve.co.uk/location.php) if you have any questions or comments.  We will be happy to help you.

## ✍🏻 Authors
FormaServe Systems Ltd - _All work_ - [FormaServe](https://www.formaserve.co.uk)

## 😊 Contributors
- Andy Youens - FormaServe
- Nick Youens - FormaServe

## 👍 Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## 🚩 Connect with us
- LinkedIn: https://linkedin.com/in/andyyouens
- Twitter: https://twitter.com/AndyYouens
- Twitter: https://twitter.com/FormaServe
- Website: https://learning.formaserve.co.uk
- Website: https://www.formaserve.co.uk

<p>
  <h2 align="left">☕Support</h2>
  <p>
    <a href="https://ko-fi.com/AndyYouens">
      <img align="left" src="https://cdn.buymeacoffee.com/buttons/v2/default-blue.png" height="50" width="210" alt="coffee"/>
    </a>
  </p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</p>

## 📝 License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
- **© 1990 - 2021 [FormaServe Systems Ltd](https://www.formaserve.co.uk)**

## Open Source on IBM i - Oh Yea!

👍👍
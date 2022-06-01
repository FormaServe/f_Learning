# FormaServe MariaDB on IBM i Help

![FormaServe Logo](https://github.com/AndyYouens/f_Learning/blob/master/images/Logo.png)

This document shows useful commands for helping with installing and using MariaDB on IBM i

## Our eLearning IBM i Training Examples

While you are here, why not visit our training videos, which can be found [here](https://learning.formaserve.co.uk)

## Useful Commands

| Command | Description |
| -| - |
| `mysqld_safe --datadir=/QOpenSys/var/lib/mariadb/data` | Start MariaDB Server |
| `mysqladmin -u root -p shutdown` | Stop MariaDB Server |
| `yum install mariadb mariadb-server` | Install MariaDB from Yum |
| `mysqladmin  -u root password abc123` | Set root password |
| `mysql_install_db --user=mysql` | Install MariaDB |
| `GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'your password';` | Grant Root Authority to everything! |
| `SBMJOB CMD(QSH CMD('/QOpenSys/pkgs/bin/mysqld_safe --datadir=/QOpenSys/var/lib/mariadb/data')) JOB(STR_MARIA)` | Start Server as a submitted job |

## Directory & File Locations

| Command | Description |
| -| - |
| `/QOpenSys/etc/mariadb/my.cnf` | MariaDB Configuration |
| `/QOpenSys/var/lib/mariadb/data/server_name.err` | MariaDB Log |
| `/QOpenSys/pkgs/bin/` | MariaDB Binaries |

## Links

- [IBM RFEs for PASE](http://bit.ly/ibm-rfe-all-pase)

## Authors

> FormaServe Systems Ltd - _All work_ - [FormaServe](https://www.formaserve.co.uk)

## Contributors

> Andy Youens - FormaServe
>
> Nick Youens - FormaServe

## Acknowledgments

> Andy Youens - FormaServe Systems Ltd - Twitter [@AndyYouens](https://twitter.com/AndyYouens)

## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
- **© 1990 - 2020 [FormaServe Systems Ltd](https://www.formaserve.co.uk)**

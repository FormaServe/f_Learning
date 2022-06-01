# FormaServe IBM i Containers Help

![FormaServe Logo](https://github.com/AndyYouens/f_Learning/blob/master/images/Logo.png)

This document shows useful commands for helping with file system containers on IBM i

## Our eLearning IBM i Training Examples

Visit our training videos, which can be found [here](https://learning.formaserve.co.uk)

## Useful Container Commands

| Command | Description |
| -| - |
| `yum –installroot=/QOpenSys/containers/andy` | Install software into a container |
| `yum –installroot=/QOpenSys/containers/andy install nodejs14` | Install Node14 into my container example |
| `yum install ibmichroot` | Install IBMiChroot |
| `chroot_setup andy` | Create an IBM i container |
| `chroot /QOpenSys/containers/andy /QOpenSys/usr/bin/bash` | Move into an IBM i container & start bash |
| `rm -rf  /QOpenSys/containers/andy` | Nuke an IBM i container |

## Useful RSync Commands

Don't just use cp to copy files on our IFS, use RSync to sync & copy files.

It can also be used to save & restore directories, including containers, to a remote system, via SSH.

Once you start using RSync you won't go back to cp - believe me!

| Command | Description |
| -| - |
| `rsync -avh /andy /backups` | Back-up a directory named andy to a directory named backups |
| `rsync -ah backups/ andy/` | To restore your backups, reverse the source & destination |
| `rsync -ah backups/ andy/` | To update a backups, just run rsync again with the same arguments. Rsync will only copy the changes - Neat! |
| `rsync -zavh /andy/ andy@proteus:backups/` | Back-up directory Andy to remote server Proteus & place in directory /Backups |
| `rsync -zvh /f_mtd/routes/*.js /backups/f_mtd/routes` | Back-up all javascript files (.js) to directory /backups/f_mtd/routes/ |
| `rsync -zavh --progress /andy/ andy@proteus:backups/` | Back-up to remote server showing progress |

## RSync Flags

| Flag | Description |
| -| - |
| `-a` | Archive mode. Instructs rsync to preserve time stamps, permissions & other bits! |
| `-h` | Human readable output |
| `-v` | Turns on verbose output |
| `-z` | Compress data |
| `-z` | Compress data |

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

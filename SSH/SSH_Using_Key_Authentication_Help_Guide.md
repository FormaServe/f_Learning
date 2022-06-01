# FormaServe - Using Key Authentication for SSH IBM i Help Guide

![FormaServe Logo](https://github.com/AndyYouens/f_Learning/blob/main/images/Logo.png)

This document shows useful commands for helping with using key authentication to automate signon to SSH sessions on IBM i

## Our eLearning IBM i Training Examples

While you are here, why not visit our training videos, which can be found [here](https://learning.formaserve.co.uk)

## Useful Commands

| Command | Description |
| -| - |
| `ls -ld /home/userID` | Show directory attributes on users home directory |
| `chown andy /home/userID` | Change owner of users home directory|
| `chmod 755 /home/userID` | Change authority of users home directory |
| -| - |
| `ls -ld /home/userID/.ssh` | Show directory attributes on users home ssh directory |
| `chown andy /home/userID/.ssh` | Change owner of users home ssh directory|
| `chmod 700 /home/userID/.ssh` | Change authority of users home ssh directory |
| -| - |
| `ls -ld /home/userID/.ssh/authorized_keys` | Show directory attributes on users authorised keys file |
| `chown andy /home/userID.ssh/authorized_keys` | Change owner of users authorised keys file|
| `chmod 600 /home/userID/.ssh/authorized_keys` | Change authority of users  authorised keys file |
| -| - |

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
- **© 1990 - 2021 [FormaServe Systems Ltd](https://www.formaserve.co.uk)**

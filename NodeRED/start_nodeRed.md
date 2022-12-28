# Start Node-RED server running on IBM i

<img src="/images/Logo.png" align="right">

![YouTube Channel Subscribers](https://img.shields.io/youtube/channel/subscribers/UCQtPrEz09kfRhrKmx9xyGWQ?style=social)
![YouTube Channel Views](https://img.shields.io/youtube/channel/views/UCQtPrEz09kfRhrKmx9xyGWQ?style=social)
![Twitter Follow](https://img.shields.io/twitter/follow/formaserve?style=social)

## From a BASH shell session

``` bash
node-red
```

if you do not have the node-red directory in your PATH, then include the path with node-red.

``` bash
/QOpenSys/pkgs/lib/nodejs18/bin/node-red
```

## From an interactive 5250 session

```
QSH CMD('/QOpenSys/pkgs/lib/nodejs18/bin/node-red ')
```

## From a 5250 submitted job

```
SBMJOB CMD(QSH CMD('/QOpenSys/pkgs/lib/nodejs18/bin/node-red ')) JOB(NODE_RED) JOBQ(*LIBL/QSYSNOMAX)
```

## From a 5250 job scheduled entry

```
ADDJOBSCDE JOB(NODE_RED) CMD(QSH CMD('node-red -p 1880')) FRQ(*ONCE) SCDTIME(1800) SAVE(*YES) JOBQ(QSYSWRK/QSYSNOMAX) TEXT('Node-RED')
```

## Please note

The above commands assume you have node.js version 18 installed on your IBM i.

If this is not the case, replace the path values from /nodejs18 to the version you are running.

## ✍🏻 Authors

FormaServe Systems Ltd - _All work_ - [FormaServe](https://www.formaserve.co.uk)

## Disclaimer

Please check out our [formal disclaimer](https://www.formaserve.co.uk/examples.php) for more information.

## 📝 License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
- **© 1990 - 2023 [FormaServe Systems Ltd](https://www.formaserve.co.uk)**

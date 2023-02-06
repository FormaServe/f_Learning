# Run Node-RED 3.1 (beta) on IBM i

<img src="/images/Logo.png" align="right">

![YouTube Channel Subscribers](https://img.shields.io/youtube/channel/subscribers/UCQtPrEz09kfRhrKmx9xyGWQ?style=social)
![YouTube Channel Views](https://img.shields.io/youtube/channel/views/UCQtPrEz09kfRhrKmx9xyGWQ?style=social)
![Twitter Follow](https://img.shields.io/twitter/follow/formaserve?style=social)

Node-RED version 3.1.0-beta.1 has been released to the public.

We have this running, without any issues at this time, on our IBM i server.

To install node-RED Beta in its own directory, without comprimising your existing installation, follow these instructions.

## Install Instructions

``` bash
mkdir node-red-310
cd node-red-310
mkdir node_modules
npm install node-red@next
```

then inside the node-red-310 directory, run the following

``` bash
npx node-red
```

## Acknowledgement

Thanks to Nick O'Leary for these details.

## ✍🏻 Authors

FormaServe Systems Ltd - _All work_ - [FormaServe](https://www.formaserve.co.uk)

## Disclaimer

Please check out our [formal disclaimer](https://www.formaserve.co.uk/examples.php) for more information.

## 📝 License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
- **© 1990 - 2023 [FormaServe Systems Ltd](https://www.formaserve.co.uk)**

# f_Learning Ansible Help

<img src="https://github.com/FormaServe/f_Learning/blob/main/images/Logo.png" align="right">

## Introduction 👋

This document is intended as a crib-sheet when presenting Ansible on IBM i workshops, and for delegates, at User Groups

## IBM i AdHoc Commands

| Description | Command     |
| ----------- | ----------- |
| Ping IBM i specifing inventory file | <code>ansible ibmi -i ~/ansible/hosts -m ping</code> |
| Limit ping to 1 IBM i only | <code>ansible ibmi -i ~/ansible/hosts -m ping --limit Galatea</code> |
| Show detailed log | <code>ansible ibmi -m ping -verbose</code> |
| Create library | <code>ansible ibmi -m ibm.power_ibmi.ibmi_cl_command -a "cmd='crtlib lib(AYOUENS)'"</code>|
| Create library with joblog | <code>ansible ibmi -m ibm.power_ibmi.ibmi_cl_command -a "cmd='crtlib lib(AYOUENS) text(ansible)' joblog=true"</code> |
| Display IBM i facts | <code>ansible ibmi -m ibm.power_ibmi.ibmi_facts </code>|
| Upgrade git on a box | <code>ansible ibmi -m yum -a "name=git state=latest" </code>|
| Upgrade all open-source on a box | <code>ansible ibmi -m yum -a "name=*all state=latest" </code>|
| List tags | <code>ansible-playbook tags.yml --list-tags</code>|
| Omit section/tags | <code>ansible-playbook ibmi_check_disks.yml --skip-tags debug</code>|
| Run section/tags | <code>ansible-playbook ibmi_check_disks.yml --tags email</code>|

## Galaxy Stuff

| Description | Command     |
| ----------- | ----------- |
| IBM i Import | <code>ansible-galaxy collection install ibm.power_ibmi </code>|
| Update collection | <code>ansible-galaxy collection install --force ibm.power_ibmi </code>|

## Misc Bumph

| Description | Command     |
| ----------- | ----------- |
| Get version | <code>ansible --version </code>|
| List current inventory | <code>ansible-inventory --list </code>|
| List current inventory namin inventory file | <code>ansible-inventory -i inventory –list </code>|
| List config that has changed | <code>ansible-config dump --only-changed </code>|
| Syntax check a playbook without executing | <code>ansible-playbook ibmi_yum_install.yml --syntax-check </code>|

## Ansible-vault Commands

| Description | Command     |
| ----------- | ----------- |
| Encryption | <code>ansible-vault encrypt secret </code>|
| Decryption | <code>ansible-vault decrypt secret </code>|
| Ask for password | <code>ansible-playbook --ask-vault-pass use_secret.yml </code>|
| Dont show unencrypted stuff in playbook | <code>no_log: true </code>|

## Ansible Doc Commands

| Description | Command     |
| ----------- | ----------- |
| Get module info | <code>ansible-doc ping</code>|
| Selective info for azure | <code>ansible-doc -l &#124; grep azure &#124; less</code>|

## 🔗 Links

| Description | Command     |
| ----------- | ----------- |
| Ansible Playbook Keywords | https://docs.ansible.com/ansible/latest/reference_appendices/playbooks_keywords.html
| Ansible Modules | https://docs.ansible.com/ansible/latest/collections/index.html
| Ansible IBM i Documents | https://ibm.github.io/ansible-for-i/index.html
| Ansible IBM i GitHub Repo | https://github.com/IBM/ansible-for-i/
| Ansible IBM i Modules | https://ibm.github.io/ansible-for-i/modules.html
| IBM i Cloud Blog | https://ibm.github.io/cloud-i-blog/archivers/2020_0602_automate_your_ibm_i_tasks_with_ansible
| Ansible Galaxy IBM i | https://galaxy.ansible.com/ibm/power_ibmi

## ✔️ YouTube Videos

- Our YouTube channel can be found [here.](https://www.youtube.com/FormaServeSystemsLtdLoughton)
- Subscribe to our YouTube channel to get the latest news &amp; updates on our f_Learning videos [here.](https://www.youtube.com/FormaServeSystemsLtdLoughton?sub_confirmation=1 )

## ✍🏻 Authors

FormaServe Systems Ltd - _All work_ - [FormaServe](https://www.formaserve.co.uk)

## 😊 Contributors

- Andy Youens - FormaServe
- Nick Youens - FormaServe

## 👍 Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change

## 🚩 Connect with us

- LinkedIn: https://linkedin.com/in/andyyouens
- Twitter: https://twitter.com/AndyYouens
- Twitter: https://twitter.com/FormaServe
- Website: https://learning.formaserve.co.uk
- Website: https://www.formaserve.co.uk

<p>
  <h2 align="left">☕Support Us</h2>
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
- **© 1990 - 2022 [FormaServe Systems Ltd](https://www.formaserve.co.uk)**

## Example of BASH .profile
##
## Shows the following details in the terminal:
## 😃 jriddle@GALATEA Wed May 25 11:12:57 /powerwire/f_weather  (dotenv)
##
## Make sure you are using nerd fonts for your bash terminal https://www.nerdfonts.com/
##
## © Copyright (C) 1990-2022 FormaServe Systems Ltd.

PATH=/QOpenSys/pkgs/bin:$PATH
export PATH

# show the git branch we are on
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# set my prompt
export PS1="\
\$(if [[ \$? -gt 0 ]]; then printf \"\\[\\033[01;31m\\]\xF0\x9F\x98\xA7\";
else printf \"\\[\\033[01;32m\\]\xF0\x9F\x98\x83\";
fi) \
\[\033[01;30m\]\u\
\[\033[01;33m\]@\
\[\033[01;36m\]\h \
\[\033[01;31m\]\d \
\[\033[01;32m\]\t \
\[\033[01;33m\]\w \
\[\033[01;31m\]\$(parse_git_branch)\[\033[01;00m\]
\[\033[01;32m\]└─\[\033[01m\033[01;32m\] \$\[\033[0m\033[01;32m\] ▶\[\033[0m\] "
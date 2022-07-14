#!/QOpenSys/pkgs/bin/bash

# -------------------------------
# Check installation of f_FTP
#
# Checks if libraries, directories, products & node modules are installed
#
# Credit to Jamie Mason for the basis of this script
# https://gist.github.com/JamieMason/4761049
#
# -------------------------------

clear

echo "==========================="
echo "     f_FTP Setup"
echo "==========================="

# Functions ==============================================

# Check if a library exists
# return 1 if library exists, else 0
# example - echo "QGPL: $(library_exists qgpl)"
function library_exists {

  # set return to 0 initially
  local return_=0
  local library="/QSYS.LIB/${1}.LIB"

  # Is the library found?
  if [[ -d "${library}" && ! -L "${library}" ]] ; then
    local return_=1
  fi

  # return value
  echo "$return_"
}

# Check if an IFS directory exists
# return 1 if directory, else 0
# example - echo "FTP: $(directory_exists FTP)"
function directory_exists {

  # set to 0 initially
  local return_=0
  local directory="/${1}/"

  # we got a directory?
  if [[ -d "${directory}" && ! -L "${directory}" ]] ; then
    local return_=1
  fi

  # return value
  echo "$return_"
}

# Check if open source program exits
# return 1 if global command line program installed, else 0
# example - echo "node: $(program_is_installed node)"
function program_is_installed {

  # set to 1 initially
  local return_=1

  # set to 0 if not found
  type $1 >/dev/null 2>&1 || { local return_=0; }

  # return value
  echo "$return_"
}

# check if a node package is installed
# return 1 if local npm package is installed at ./node_modules, else 0
# example - echo "gruntacular : $(npm_package_is_installed gruntacular)"
function npm_package_is_installed {

  # set to 1 initially
  local return_=1

  # set to 0 if not found
  ls node_modules | grep -w $1 >/dev/null 2>&1 || { local return_=0; }

  # return value
  echo "$return_"
}

# display a message in red with a cross by it
# example - # echo echo_fail "No"
function echo_fail {

  # echo first argument in red
  printf "\e[31m✘ ${1}"

  # reset colours back to normal
  printf "\033\e[0m"

}

# display a message in green with a tick by it
# example - echo echo_fail "Yes"
function echo_pass {

  # echo first argument in green
  printf "\e[32m✔ ${1}"

  # reset colours back to normal
  printf "\033\e[0m"

}

# echo pass or fail
# example
#   echo echo_if 1 "Passed"
#   echo echo_if 0 "Failed"
function echo_if {
  if [ $1 == 1 ]; then
    echo_pass $2
  else
    echo_fail $2
  fi
}

# ============================================== End of Functions

# Check open source programs installed
echo ""
echo "Checking Open Source Programs"
echo "============================="

echo "node  $(echo_if $(program_is_installed node))"
echo "yum   $(echo_if $(program_is_installed yum))"
echo "npm   $(echo_if $(program_is_installed npm))"

# Local npm packages exist
echo ""
echo "Checking Open Source Packages"
echo "============================="
echo "body-parser                $(echo_if $(npm_package_is_installed body-parser))"
echo "client-sessions            $(echo_if $(npm_package_is_installed client-sessions))"
echo "connect-busboy             $(echo_if $(npm_package_is_installed connect-busboy))"
echo "cookie-session             $(echo_if $(npm_package_is_installed cookie-session))"
echo "csv-parser                 $(echo_if $(npm_package_is_installed csv-parser))"
echo "dateformat                 $(echo_if $(npm_package_is_installed dateformat))"
echo "debug                      $(echo_if $(npm_package_is_installed debug))"
echo "express                    $(echo_if $(npm_package_is_installed express))"
echo "express-dnt                $(echo_if $(npm_package_is_installed express-dnt))"
echo "express-form-data          $(echo_if $(npm_package_is_installed express-form-data))"
echo "format-currency            $(echo_if $(npm_package_is_installed format-currency))"
echo "formidable                 $(echo_if $(npm_package_is_installed formidable))"
echo "fs                         $(echo_if $(npm_package_is_installed fs))"
echo "getmac                     $(echo_if $(npm_package_is_installed getmac))"
echo "http-errors                $(echo_if $(npm_package_is_installed http-errors))"
echo "idb-connector              $(echo_if $(npm_package_is_installed idb-connector))"
echo "idb-pconnector             $(echo_if $(npm_package_is_installed idb-pconnector))"
echo "jquery                     $(echo_if $(npm_package_is_installed jquery))"
echo "moment                     $(echo_if $(npm_package_is_installed moment))"
echo "nodemon                    $(echo_if $(npm_package_is_installed nodemon))"
echo "public-ip                  $(echo_if $(npm_package_is_installed public-ip))"
echo "pug                        $(echo_if $(npm_package_is_installed pug))"
echo "session                    $(echo_if $(npm_package_is_installed session))"
echo "sha1                       $(echo_if $(npm_package_is_installed sha1))"
echo "simple-oauth2              $(echo_if $(npm_package_is_installed simple-oauth2))"
echo "superagent                 $(echo_if $(npm_package_is_installed superagent))"
echo "uuid                       $(echo_if $(npm_package_is_installed uuid))"
echo "winston                    $(echo_if $(npm_package_is_installed winston))"
echo "winston-daily-rotate-file  $(echo_if $(npm_package_is_installed winston-daily-rotate-file))"

# Check IFS Directories exist
echo ""
echo "Checking Directories"
echo "===================="
echo "FTP            $(echo_if $(directory_exists FTP))"
echo "FTP/TEMP       $(echo_if $(directory_exists FTP/temp))"
echo "FTP/SaveFiles  $(echo_if $(directory_exists FTP/SaveFiles))"

# Check Libraries exist
echo ""
echo "Checking Libraries"
echo "=================="
echo "FTP    $(echo_if $(library_exists FTP))"
echo "yajl   $(echo_if $(library_exists yajl))"
echo "temp   $(echo_if $(library_exists temp))"

echo ""
echo ""
echo "===================="
echo "All checks completed"
echo "===================="
echo ""

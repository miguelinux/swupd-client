#!/bin/bash
#   Software Updater - autocompletion script
#
#      Copyright © 2016 Intel Corporation.
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, version 2 or later of the License.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#   WARNING: This is an autogenerated script

#declares the completion function
_swupd()
{
  local cur prev opts index suboptions mainsubcommands
  local mainopts=" -h --help -v --version"
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  #Adding all options for subcommands in an array
  mainsubcommands+=("bundle-add bundle-remove hashdump update verify check-update search")
  suboptions+=("$mainopts")
  suboptions+=(" -h --help -u --url -c --contenturl -v --versionurl -P --port -p --path -F --format -l --list -x --force -S --statedir")
  mainsubcommands+=(" ")
  suboptions+=(" -h --help -p --path -u --url -c --contenturl -v --versionurl -P --port -F --format -x --force -S --statedir")
  mainsubcommands+=(" ")
  suboptions+=(" -h --help -n --no-xattrs -b --basepath")
  mainsubcommands+=(" ")
  suboptions+=(" -h --help -d --download -u --url -P --port -c --contenturl -v --versionurl -s --status -F --format -p --path -x --force -S --statedir")
  mainsubcommands+=(" ")
  suboptions+=(" -h --help -m --manifest -p --path -u --url -P --port -c --contenturl -v --versionurl -f --fix -i --install -F --format -q --quick -x --force -S --statedir")
  mainsubcommands+=(" ")
  suboptions+=(" -h --help -u --url -v --versionurl -P --port -F --format -x --force -p --path -S --statedir")
  mainsubcommands+=(" ")
  suboptions+=(" -h --help -l --library -b --binary -s --scope -d --display-files -i --init -u --url -c --contenturl -v --versionurl -P --port -p --path -F --format -S --statedir")
  mainsubcommands+=(" ")

  #Need to get last subcommand entered by the user
  index=COMP_CWORD-1
  while [[ " swupd $mainsubcommands " != *" $prev "* ]]; do
    ((index--))
    prev="${COMP_WORDS[$index]}"
  done
  #Now need to calculate the index of the subcommand in order to
  #retreive options
  index=0
  for subc in swupd ${mainsubcommands[0]}
  do
    if [[ $subc == $prev ]]; then
      break
    fi
    ((index++))
  done

  #Get all options for last subcommand entered
  opts="${suboptions[$index]} ${mainsubcommands[$index]}"

  COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )

  return 0
}

complete -F _swupd swupd

# Font Color Settings
RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

# Check the status of last command
function CheckLastCommandStatus() {
  if [ $? -ne 0 ]
  then
    echo -e "${RED}$1${NOCOLOR}"
    exit 1
  fi
}

#Prompt continue wizard
function IsContinue() {
  echo -e "Once you finished, please input y to continue..."
  read is_continue
  if [ ${is_continue,,} != "y" ]
  then
    echo -e "The process is aborted by user"
    exit 1
  fi
}

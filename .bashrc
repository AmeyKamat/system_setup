#CONSOLE PROMPT

YELLOW="\e[1;33m";
RED="\e[1;31m";
GREEN="\e[1;32m";
CYAN="\e[0;36m";
WHITE="\e[1;37m";
RESET="\e[0;37m";


function bash_prompt() {
    # Get smiley based on last status
    local last_status=$?
    local smiley="${GREEN}:)"
    if [[ "$last_status" != "0" ]]; then
       smiley="${RED}:(";
    fi
	

    # Get git branch
    #local git_branch=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
    local git_branch=`git branch --show-current 2> /dev/null`
	if [ "$git_branch" ]; then
		git_branch="($git_branch)"
	fi
	

    # Get date
    #curr_date=`date`

    # Title String
    #TITLE="\033]0;$(whoami)@$(hostname) \U2666 $(pwd|cut -d "/" -f 4-100)\a"

    # Build everything together
    #echo -e "\n${WHITE}${curr_date}\n[\#] ${smiley} ${YELLOW}\w${CYAN}${git_branch} \n${YELLOW}\$> ${RESET}"
    echo -e "\033]0;Amey Kamat: Master of the Universe\a\n${WHITE}[\#] ${smiley} ${YELLOW}\w${CYAN} ${git_branch} \n${YELLOW}\$> ${RESET}"
}

PROMPT_COMMAND='PS1=$(bash_prompt)' #'PS1="\033]0;Amey Kamat: Master of the Universe\a\n${WHITE}[\#] $(pwd): ${RESET}"'
export PS1;

# PATH Variables
APP_HOME=~/work/apps
export APP_HOME

JAVA_HOME_12=$APP_HOME/jdk-12.0.2
JAVA_HOME_8=$APP_HOME/jdk1.8.0_221
JAVA_HOME=$JAVA_HOME_8

SCRIPTS=$APP_HOME/scripts
export SCRIPTS

path(){
   PATH=$JAVA_HOME/bin:$MAVEN_HOME/bin:$MONGO_HOME/bin:$AZURE_HOME:$KUBECTL_PATH:$PYTHON_HOME:$PYTHON_SCRIPTS:$PATH:$SCRIPTS
   export PATH
}
path

# ALIASES
alias jdk8="source jdk8.sh && path && java -version"
alias jdk12="source jdk12.sh && path && java -version"

alias mci="mvn clean install"
alias mcist="mvn clean install -Dmaven.test.skip=true"
alias msbr="mvn spring-boot:run"

alias ni="npm install --verbose"
alias nrb="npm run build"
alias nrbd="x-terminal-emulator -e npm run build:watch"
alias nrs="npm run start"
alias nrsd="npm run start"
alias nd="nrb && nrs"
alias ndd="nrbd && nrsd"

alias .="cd ~/work"
alias ~="cd ~"
alias ..="cd .."
alias repos="cd ~/work/repositories"

alias pip="python -m pip"
alias jupyter="x-terminal-emulator -e jupyter"

alias refresh="source ~/.bashrc"

# For windows
# alias az=az.cmd
# alias kubectl=kubectl.exe

# alias mvn="winpty mvn.cmd -B"
# alias npm="winpty npm.cmd"

# cd
cd() {
   echo
   builtin cd $1
   ls
}

# git clone
gclone() {
   git-clone.sh $1
}

gbranch() {
  echo `git rev-parse --abbrev-ref HEAD 2> /dev/null`
}

gpush(){
  git push --set-upstream origin `branch`

}

# git commit
gcommit() {
  local work_item=`branch | grep -oE '(US|DE)[0-9]{6,}'`
  git commit -m "$work_item - $1"
}

# for windows
#alert(){
#  (sleep $1; msg $USERNAME $2) &
#}

# STARTUP SCRIPT

clear
echo
echo
echo
echo -e "${YELLOW}              *              )  "   
echo -e "${YELLOW}     (      (  \`          ( /(  "
echo -e "${YELLOW}     )\     )\))(   (     )\()) "
echo -e "${YELLOW}  ((((_)(  ((_)()\  )\   ((_)\  "
echo -e "${YELLOW}   )\ _ )\ (_()((_)((_) __ ((_) "
echo -e "${YELLOW}   (_)_\(_)|  \/  || __|\ \ / / "
echo -e "${CYAN}    / _ \  | |\/| || _|  \ V /  "
echo -e "${CYAN}   /_/ \_\ |_|  |_||___|  |_|   "
echo.
echo -e "\e[1;36m   The Master of the Universe      " 
echo -e "\e[1;36m   Welcomes you to the Console     "
echo -e "        \e[4;34mwww.ameykamat.in${RESET}     "
echo
echo

.


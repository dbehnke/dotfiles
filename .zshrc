
####   Oh My Zsh

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

#debian specific
alias agi="sudo apt-get -y install"
alias agu="sudo apt-get -y update"
alias agU="sudo apt-get -y upgrade"
alias acs="sudo apt-cache search"

####    Programming Languages

#go
export GOPATH=$HOME/go

#Groovy
#I'm not using groovy for anything right now this is just a placeholder
#export GROOVY_HOME=$HOME/opt/groovy

#nodejs
export PATH=./node_modules/.bin:$PATH

#ruby
#TODO fix this next time I need ruby
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
source $HOME/.rvm/scripts/rvm

#python

#pyenv - uncomment all if using pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
export PATH=$HOME/.pyenv/shims:$PATH


#uncomment if using python in /usr/local/bin
#PYTHON_PREFIX=/usr/local/bin

use-python3() {
  #uncomment if using pyenv - set version to match one of the pyenv versions
  export PYENV_VERSION=3.3.4
  pyenv virtualenvwrapper

  #uncomment if not using pyenv
  #export VIRTUALENV_PYTHON=${PYTHON_PREFIX}/python3
  #export VIRTUALENVWRAPPER_PYTHON=${PYTHON_PREFIX}/python3
}

use-python2() {
  #uncomment if using pyenv - set version to match one of the pyenv versions
  export PYENV_VERSION=2.7.6
  pyenv virtualenvwrapper

  #uncomment if not using pyenv
  #export VIRTUALENV_PYTHON=${PYTHON_PREFIX}/python2
  #export VIRTUALENVWRAPPER_PYTHON=${PYTHON_PREFIX}/python2
}

#set default python
#use-python2
use-python3

#virtualenvwrapper (for python) - these are where virtual environments will be stored
export WORKON_HOME=${HOME}/python-env

#uncomment if not using pyenv
#source ${PYTHON_PREFIX}/virtualenvwrapper.sh

#Scala
export PATH=$HOME/opt/scala/bin:$PATH

####    Virtualization Tools

#packer (vm builder)
export PATH=$HOME/opt/packer:$PATH

#docker (for mac - not sure if this is needed for linux)
export DOCKER_HOST=tcp://

####    Cool Hacks

#spawn http server in current directory - useful for testing
#web pages and temporarily sharing files
http-serve() {
  python3 -m http.server 8099
}

#find out internet facing ip address
whatismyip() {
  curl -s icanhazip.com
}

#spawn http server similar to http-serve but for external internet use
#using port 8098 instead of 8099 so you can differentiate for port
#forwarding purposes.
#This is assuming you forward the port 8098 properly from your router to
#your machine
http-serve-internet() {
  local myip=`whatismyip`
  echo "External URL: http://${myip}:8098/ - forward your router to this machine port 8098"
  python3 -m http.server 8098
}

####    Helper Functions

#change email for git for working repository - copy these to .zshrc-private with correct values
gitconfig-work() {
  echo "Configuring git for work.."
  git config user.email "workemail"
}

gitconfig-github() {
  echo "Configuring git for github.."
  git config user.email "personalemail"
}

start-btsync() {
  echo "Attempting to start BitTorrent Sync"
  $HOME/opt/btsync/btsync
  xdg-open http://localhost:8888
}

stop-btsync() {
  echo "Attempting to stop BitTorrent Sync"
  killall btsync
}

####    Aliases

#sublimetext
#path to executable
sublime=${HOME}/opt/sublime_text/sublime_text

alias subl="${sublime} -n"
#this makes sublime the default editor and waits for finish
export EDITOR="${sublime} -n -w"

#quick edit functions
alias zshconfig="subl ~/.zshrc"
alias zshconfigprivate="subl ~/.zshrc-private"

#quickly print public key
alias sshpublickey="cat ~/.ssh/id_rsa.pub"

#private zshrc (not included in dotfiles) - keep at end of file 
#(but before source $ZSH/oh-my-zsh.sh to override
#any variables in this file with the private ones.
source $HOME/.zshrc-private

#now we'll activate oh-my-zsh
source $ZSH/oh-my-zsh.sh

~/scripts/screenfetch

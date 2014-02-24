
####   Oh My Zsh

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

#for brew
export PATH=/usr/local/bin:$PATH

####    Programming Languages

#go
export GOPATH=$HOME/go

#Groovy
export GROOVY_HOME=/usr/local/opt/groovy/libexec

#nodejs
export PATH=./node_modules/.bin:$PATH

#ruby
PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
source /Users/dbehnke/.rvm/scripts/rvm

#python
PYTHON_PREFIX=/usr/local/bin

use-python3() {
  export VIRTUALENV_PYTHON=${PYTHON_PREFIX}/python3
  export VIRTUALENVWRAPPER_PYTHON=${PYTHON_PREFIX}/python3
}

use-python2() {
  export VIRTUALENV_PYTHON=${PYTHON_PREFIX}/python2
  export VIRTUALENVWRAPPER_PYTHON=${PYTHON_PREFIX}/python2
}

#set default python
#use-python2
use-python3

#virtualenvwrapper (for python)
export WORKON_HOME=${HOME}/python-env
source ${PYTHON_PREFIX}/virtualenvwrapper.sh

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

#change email for git for working repository
gitconfig-work() {
  echo "Configuring git for work.."
  git config user.email "workemail"
}

gitconfig-github() {
  echo "Configuring git for github.."
  git config user.email "personalemail"
}

####    Aliases

#sublimetext
alias subl="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"

#quick edit functions
alias zshconfig="subl ~/.zshrc"
alias zshconfigprivate="subl ~/.zshrc-private"

#quickly print public key
alias sshpublickey="cat ~/.ssh/id_rsa.pub"

#private zshrc (not included in dotfiles) - keep at end of file 
#(but before source $ZSH/oh-my-zsh.sh to override
#any variables in this file with the private ones.
source .zshrc-private

#now we'll activate oh-my-zsh
source $ZSH/oh-my-zsh.sh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
TERM=tmux-256color

# Uncomment the following line to change how often to auto-update (in days).
 zstyle ':omz:update' frequency 13

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX"]; then
	#exec tmux
fi

# source ros workspace
source /opt/ros/humble/setup.zsh
# source asgard workspace
source ~/asgard/workspace/install/setup.zsh
source ~/asgard/external_packages/install/setup.zsh

# Gazebo reosurce path
export GZ_SIM_RESOURCE_PATH="$HOME/asgard/workspace/src/gazebo/simulation"

# Change your domain
export ROS_DOMAIN_ID=16;

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# aliases for ubuntu
alias ra='ranger' 
alias kk='tmux kill-session'
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# aliases for ros
alias rtl='ros2 topic list'
alias rti='ros2 topic info'
alias rte='ros2 topic echo'

alias rnl='ros2 node list'
alias rni='ros2 node info'

alias rsl='ros2 service list'
alias rsc='ros2 service call'

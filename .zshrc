# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
#TERM=tmux-256color
TERM=alacritty

# Uncomment the following line to change how often to auto-update (in days).
 zstyle ':omz:update' frequency 13

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Custom autocomplete settings
autoload -U compinit
compinit

eval "$(register-python-argcomplete ros2)"
eval "$(register-python-argcomplete colcon)"

source $ZSH/oh-my-zsh.sh

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
	#exec tmux
fi

setopt nocorrectall

# source ROS
source /opt/ros/humble/setup.zsh

# source asgard workspace
source ~/asgard/workspace/install/setup.zsh
source ~/asgard/external_packages/install/setup.zsh

# Gazebo reosurce path
export GZ_SIM_RESOURCE_PATH="$HOME/asgard/workspace/src/asgard/simulation/worlds:$HOME/asgard/workspace/src/asgard/simulation/models"
export GZ_SIM_RESOURCE_PATH=$HOME/asgard/external_packages/src/ardupilot_gazebo/models:$HOME/asgard/external_packages/src/ardupilot_gazebo/worlds:$GZ_SIM_RESOURCE_PATH
export GZ_SIM_SYSTEM_PLUGIN_PATH="$HOME/asgard/external_package/src/ardupilot_gazebo/build:$GZ_SIM_SYSTEM_PLUGIN_PATH"
export GZ_VERSION=garden


# Change your domain
export ROS_DOMAIN_ID=0;

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

alias cb="colcon build --symlink-install --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON && source install/setup.zsh"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

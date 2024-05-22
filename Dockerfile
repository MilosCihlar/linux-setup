###########################################
# Base image
###########################################
FROM ubuntu:22.04 AS base

ENV DEBIAN_FRONTEND=noninteractive

FROM base AS dev

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
  gdb \
  git \
  sudo \
  openssh-client \
  python3-pip \
  vim \
  zsh \
  rxvt-unicode \
  curl \
  ranger \
  tmux \
  tmuxinator \
  fonts-powerline \
  fonts-hack-ttf \
  && rm -rf /var/lib/apt/lists/*

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

ARG USERNAME=ros
ARG USER_UID=1000
ARG USER_GID=$USER_UID

ARG GID=$USER_UID
ARG UID=$USER_UID

# Create new user and home directory
RUN groupadd --gid $GID $USERNAME \
 && useradd --uid ${GID} --gid ${UID} --create-home ${USERNAME} \
 && echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME} \
 && chmod 0440 /etc/sudoers.d/${USERNAME} \
 && mkdir -p /home/${USERNAME} \
 && chown -R ${UID}:${GID} /home/${USERNAME}

COPY .oh-my-zsh /home/${USERNAME}/.oh-my-zsh
COPY .vim /home/${USERNAME}/.vim
COPY .bashrc /home/${USERNAME}/
COPY .rangerdir /home/${USERNAME}/
COPY .tmux.conf /home/${USERNAME}/
COPY .vimrc /home/${USERNAME}/
COPY .Xresources /home/${USERNAME}/
COPY .zshrc /home/${USERNAME}/

#RUN sudo update-alternatives --set x-terminal-emulator /usr/bin/urxvt
#RUN /bin/zsh /home/${USERNAME}/.zshrc

RUN usermod -s $(which zsh) root
WORKDIR /home/${USERNAME}



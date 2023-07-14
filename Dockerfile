FROM node:20.4.0

RUN apt-get update && apt-get install -y \
    vim \
    nano \
    zsh \
    sudo

# ENTRYPOINT
ADD docker/node/entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh

# SSh Config
ADD docker/_config/ssh /root/.ssh

# Add some config
ADD docker/_config/vim/.vimrc /root/.vimrc

# Git config
ADD docker/_config/git/.gitignore_global /root/.gitignore_global
RUN git config --global core.excludesfile '/root/.gitignore_global'
RUN git config --global push.default simple

# Instal Oh my Zsh
RUN bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN sed -i -- 's/robbyrussell/sonicradish/g' /root/.zshrc # Other awesome theme: random kafeitu sonicradish wezm+

# LIB
RUN npm install -g @angular/cli
RUN npm install -g @nestjs/cli

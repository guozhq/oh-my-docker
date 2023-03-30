FROM alpine:3.17.2

WORKDIR /tmp
ENV SHELL /bin/bash

# speed up 
RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories
# end

# basic tools
RUN apk update
RUN apk --no-cache --update add bash git vim curl
ENV EDITOR=/usr/bin/vim
# end

# Dev env for JS
RUN apk add --no-cache nodejs=~18.14.2
# end





# FROM alpine:latest

# WORKDIR /tmp
# ENV SHELL /bin/bash

# # speed up 
# RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories
# # end

# # basic tools
# RUN apk update
# RUN apk --no-cache --update add bash git vim curl
# ENV EDITOR=/usr/bin/vim
# ENV VISUAL=/usr/bin/vim
# # end

# # Python3 and pip
# ENV PYTHONUNBUFFERED=1
# RUN apk add --no-cache --repository=https://mirrors.tuna.tsinghua.edu.cn/alpine/v3.12/main/ python3=3.10.10-r0 py3-pip &&\
#     pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/ &&\
#     ln -sf python3 /usr/bin/python &&\
#     python3 -m ensurepip --upgrade &&\
#     pip3 install --no-cache --upgrade pip setuptools
# # end

# # Dev env for JS
# RUN apk add --no-cache nodejs=~18.14.2 yarn=~1.22.19 &&\
#     yarn config set registry https://registry.npm.taobao.org
# # end

# # Zsh+Prezto
# RUN apk add --no-cache zsh &&\
#     zsh -c 'git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME"/.zprezto' &&\
#     zsh -c 'setopt EXTENDED_GLOB' &&\
#     zsh -c 'for rcfile in "$HOME"/.zprezto/runcoms/z*; do ln -s "$rcfile" "$HOME"/."${rcfile:t}"; done'
# ENV SHELL /bin/zsh
# # end

# # # nvm
# # ENV NVM_DIR /root/.nvm
# # ADD nvm-0.39.3 /root/.nvm/
# # RUN sh ${NVM_DIR}/nvm.sh &&\
# #     echo '' >> /root/.zshrc &&\
# #     echo 'export NVM_DIR="$HOME/.nvm"' >> /root/.zshrc && \
# #     echo '[ -s "$NVM_DIR/nvm.sh" ] && { source "$NVM_DIR/nvm.sh"}' >> /root/.zshrc && \
# #     echo '[ -s "$NVM_DIR/bash_completion" ] && { source "$NVM_DIR/bash_completion"}' >> /root/.zshrc
# # # end
FROM hashicorp/packer:1.5.4 AS packer

RUN apk add --update --no-cache bash make git zsh curl
# install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

RUN apk add --update --no-cache virtualbox-guest-additions virtualbox-guest-modules-virt

WORKDIR /app

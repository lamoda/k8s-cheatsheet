FROM alpine
ARG KUBE_VERSION=1.21.0
RUN apk --no-cache add curl bash-completion bash && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v${KUBE_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    kubectl version --client && \
    echo 'source /etc/profile.d/bash_completion.sh' >> /root/.bash_profile && \
    echo '\
        . /etc/profile ; \
        PS1='\''\[\e[01;33m\][\h \u:\[\e[01;34m\]\w\[\e[01;33m\]]\[\e[00m\]\$ '\'' ; \
        alias ls="ls --color=auto" ; \
        alias l="ls -lah" ; \
        alias ll="ls -lh" ; \
    ' >> /etc/bash.bashrc && \
    echo '. ~/.bashrc' > /root/.bash_profile && \
    echo '. /etc/bash.bashrc' > /root/.bashrc && \
    echo 'source <(kubectl completion bash)' >> /root/.bashrc && \
    sed -i 's,/bin/ash,/bin/bash,g' /etc/passwd

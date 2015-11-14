FROM base/archlinux

RUN echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen
ENV LANG "ja_JP.UTF-8"
ENV LC_ALL "ja_JP.UTF-8"

ENV PAC "pacman --noconfirm"
RUN $PAC -Sy archlinux-keyring \
&& $PAC -Syu \
&& pacman-db-upgrade \
&& rm -rf /var/cache/pacman/pkg/*

RUN $PAC -S \
ruby \
git \
vim \
openssh \
gcc \
make \
patch \
the_silver_searcher \
&& rm -rf /var/cache/pacman/pkg/*

RUN gem update --system

RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -t rsa -b 2048 -N ''
COPY ./sshd_config /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

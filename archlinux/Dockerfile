FROM base/archlinux

RUN echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen

RUN locale-gen

ENV PAC "pacman --noconfirm"
RUN $PAC -Sy archlinux-keyring \
&& $PAC -Syu \
&& pacman-db-upgrade \
&& $PAC -Sc

RUN $PAC -S \
ruby \
git \
vim \
openssh \
gcc \
make \
patch \
the_silver_searcher \
&& $PAC -Sc

RUN gem update --system

CMD ["su", "-", "root"]

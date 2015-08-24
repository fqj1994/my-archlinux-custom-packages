FROM base/archlinux
RUN printf "\n\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n" >> /etc/pacman.conf
RUN pacman -Sy archlinux-keyring --noconfirm
RUN pacman -Syu --noconfirm
RUN pacman-db-upgrade
RUN pacman -S sudo --noconfirm
RUN pacman -Rdd gcc-libs --noconfirm
RUN pacman -S base-devel multilib-devel ccache --noconfirm
COPY makepkg.conf /etc/makepkg.conf
RUN mkdir /home/packages
RUN mkdir -p /home/buildbot/.ccache
RUN useradd buildbot
RUN chown buildbot:buildbot -R /home/packages /home/buildbot/
RUN mkdir /pkgs
COPY . /pkgs/

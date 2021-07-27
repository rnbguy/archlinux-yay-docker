FROM archlinux:base-devel
LABEL maintainer="Ranadeep B <mail [at] rnbguy [dot] at>"

# install dependencies
RUN pacman -Syu git --asdeps --noconfirm

# create user
RUN useradd --create-home --system aur && \
    echo 'aur ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/aur

# clone yay
RUN sudo -u aur git clone --depth 1 https://aur.archlinux.org/yay-bin.git /home/aur/yay

# run makepkg
RUN cd /home/aur/yay && \
    sudo -u aur makepkg -ic --noconfirm

# cleanup
RUN rm -rf /home/aur/yay && \
    pacman -Qtdq | xargs -r pacman -Rcns --noconfirm

# configure yay
RUN sudo -u aur yay --cleanafter --removemake --save

# build trigger
ONBUILD RUN sudo -u aur yay -Syu yay-bin --needed --noconfirm

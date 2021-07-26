# `archlinux:base-devel` with yay

Automated build is configured linked to offical `archlinux:base-devel` updates.
So this image is never outdated. 

## Docker pull command

```
docker pull rnbguy/archlinux-yay
```

## Instruction

`yay` must be executed as a non-root user. The image comes with an `aur` user. To install `neovim-git` from AUR, execute

```
sudo -u aur yay -S neovim-git
```

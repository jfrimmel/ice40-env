# open-source `ice40` FPGA development environment

This repository amis to provide a full development environment for developing for the ice40 series of Lattice FPGAs.

## Prerequisites

This section assumes you are using a Linux environment, e.g. [Arch Linux](www.archlinux.org).
On any platform you'll need to install the following software:

- Synthesis: [yosys](http://bygone.clairexen.net/yosys/)
- Place'n'route: [nextnpr](https://github.com/YosysHQ/nextpnr)
- Bitstream creation: [icestorm](http://www.clifford.at/icestorm/)

Below there are the steps for Arch Linux as of 2021-10-24.

```bash
# install yosys
sudo pacman -S yosys
# install icestorm for AUR
git clone https://aur.archlinux.org/icestorm-git.git
cd icestorm-git
makepkg -sri
cd ..
# install nextpnr from AUR
git clone https://aur.archlinux.org/nextpnr-ice40-nightly.git
cd nextpnr-ice40-nightly
# patch package build script (we have the non-nightly versions installed)
sed -i "s/yosys-nightly/yosys/" PKGBUILD
sed -i "s/icestorm-nightly/icestorm/" PKGBUILD
makepkg -sri
cd ..
```

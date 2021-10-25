# open-source `ice40` FPGA development environment

This repository amis to provide a full development environment for developing for the ice40 series of Lattice FPGAs.

## Prerequisites

This section assumes you are using a Linux environment, e.g. [Arch Linux](www.archlinux.org).
On any platform you'll need to install the following software:

- Build system: [ninja](https://ninja-build.org/)
- Synthesis: [yosys](http://bygone.clairexen.net/yosys/)
- Place'n'route: [nextnpr](https://github.com/YosysHQ/nextpnr)
- Bitstream creation: [icestorm](http://www.clifford.at/icestorm/)
- programming (only for TinyFPGA-BX and compatible): [tinyprog](https://pypi.org/project/tinyprog/) (FTDI-based boards can simply use the `iceprog` program, which is part of the tools above)

Below there are the steps for Arch Linux as of 2021-10-24.

```bash
# install tools available in the package repositories
sudo pacman -S yosys tinyprog ninja
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

Also, make sure, that your user has the permission to access the serial port, if your programmer uses the serial port.
Depending on your Linux distribution you have to add yourself to either the [`dialout`](https://wiki.debian.org/SystemGroups#Other_System_Groups) or [`uucp`](https://wiki.archlinux.org/title/Users_and_groups#User_groups) group.

